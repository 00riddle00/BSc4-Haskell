-- @Tomas Giedraitis
-- Exercise set 3

module Lab_3
where

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

data Shape = Circle Float (Float, Float) | Rectangle Float Float (Float, Float)
    deriving (Show, Ord, Eq)

topLeft :: Shape -> (Float, Float)
topLeft (Rectangle h w (x,y)) = (x-w/2, y+h/2)

bottomRight :: Shape -> (Float, Float)
bottomRight (Rectangle h w (x,y)) = (x+w/2, y-h/2)

overlap :: Shape -> Shape -> Bool
overlap (Rectangle h1 w1 (x1,y1)) (Rectangle h2 w2 (x2,y2)) = 
    doOverlap (topLeft (Rectangle h1 w1 (x1,y1))) (bottomRight (Rectangle h1 w1 (x1,y1)))
        (topLeft (Rectangle h2 w2 (x2,y2))) (bottomRight (Rectangle h2 w2 (x2,y2)))

doOverlap :: (Float, Float) -> (Float, Float) -> (Float, Float) -> (Float, Float) -> Bool
doOverlap (l1x,l1y) (r1x,r1y) (l2x,l2y) (r2x,r2y)
    | l1x == r1x || l1y == r1y || l2x == r2x || l2y == r2y = False
    | l1x >= r2x || l2x >= r1x = False
    | r1y >= l2y || r2y >= l1y = False
    | otherwise = True

coverlap :: Shape -> Shape -> Bool
coverlap (Circle r1 (x1,y1)) (Circle r2 (x2,y2))
    | (x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2) < (r1 + r2) * (r1 + r2) = True
    | otherwise = False

rcoverlap :: Shape -> Shape -> Bool
rcoverlap (Rectangle h w (x,y)) (Circle r (xc,yc))
    | (dx**2 + dy**2) < r**2 = True
    | otherwise = False
        where 
            dx = xn - xc
            dy = yn - yc
            xn = max x1 (min xc x2)
            yn = max y2 (min yc y1)
            (x1, y1) = (topLeft (Rectangle h w (x,y)))
            (x2, y2) = (bottomRight (Rectangle h w (x,y)))
rcoverlap (Circle r (xc,yc)) (Rectangle h w (x,y)) = 
    rcoverlap (Rectangle h w (x,y)) (Circle r (xc,yc)) 

{-
overlap (Rectangle 1 1 (1,1)) (Rectangle 1 1 (1,1)) - True
overlap (Rectangle 10 10 (5,5)) (Rectangle 5 10 (10,2.5)) - True
-- Do not overlap, just touch each other at the corner:
overlap (Rectangle 2 2 (3,1)) (Rectangle 2 2 (1,3)) - False
-- Do not overlap, just touch each other at the side:
overlap (Rectangle 2 2 (3,1)) (Rectangle 2 2 (1,1)) - False

coverlap (Circle 1 (1,1)) (Circle 1 (1,1)) - True
-- Do not overlap, just touch each other:
coverlap (Circle 30 ((-10),8)) (Circle 10 (14,(-24))) - False

rcoverlap (Rectangle 3 2 (2,1.5)) (Circle 2 (0,0)) - True
rcoverlap (Circle 2 (5,4)) (Rectangle 4 10 (6,1)) - True
rcoverlap (Rectangle 3 2 (4,4.5)) (Circle 1 (1,1)) - False
-- Do not overlap, just touch each other:
rcoverlap (Rectangle 2 2 (1,1)) (Circle 1 (3,1)) - False
rcoverlap (Rectangle 2 2 (2,0)) (Circle 1 (0,0)) - False
-}
