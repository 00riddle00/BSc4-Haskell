-- @Tomas Giedraitis
-- Exercise set 3

module Lab_3
where

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

data Shape = Circle Float (Float, Float) | Rectangle Float Float (Float, Float)
    deriving (Show, Ord, Eq)

overlap :: Shape -> Shape -> Bool
overlap (Rectangle h1 w1 (x1,y1)) (Rectangle h2 w2 (x2,y2)) =
    l1x /= r1x && l1y /= r1y && l2x /= r2x && l2y /= r2y &&
    l1x < r2x && l2x < r1x &&
    r1y < l2y && r2y < l1y
        where 
            (l1x, l1y) = (x1-w1/2, y1+h1/2) 
            (r1x, r1y) = (x1+w1/2, y1-h1/2)
            (l2x, l2y) = (x2-w2/2, y2+h2/2) 
            (r2x, r2y) = (x2+w2/2, y2-h2/2)
overlap (Circle r1 (x1,y1)) (Circle r2 (x2,y2)) = (x1-x2)**2 + (y1-y2)**2 < (r1+r2)**2
overlap (Rectangle h w (x,y)) (Circle r (xc,yc)) = ((xn-xc)**2 + (yn-yc)**2) < r**2
    where 
        (x1, y1) = (x-w/2, y+h/2)
        (x2, y2) = (x+w/2, y-h/2)
        xn = max x1 (min xc x2)
        yn = max y2 (min yc y1)
overlap (Circle r (xc,yc)) (Rectangle h w (x,y)) = 
    overlap (Rectangle h w (x,y)) (Circle r (xc,yc)) 
