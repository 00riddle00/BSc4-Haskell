-- @Tomas Giedraitis
-- Exercise set 3

module Lab_3
where

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

data Shape = Circle Float (Float, Float) | Rectangle Float Float (Float, Float)
    deriving (Show, Ord, Eq)

overlaps :: Shape -> Shape -> Bool
overlaps (Rectangle h1 w1 (x1,y1)) (Rectangle h2 w2 (x2,y2)) =
    l1x /= r1x && l1y /= r1y && l2x /= r2x && l2y /= r2y &&
    l1x < r2x && l2x < r1x &&
    r1y < l2y && r2y < l1y
        where 
            (l1x, l1y) = (x1-w1/2, y1+h1/2) 
            (r1x, r1y) = (x1+w1/2, y1-h1/2)
            (l2x, l2y) = (x2-w2/2, y2+h2/2) 
            (r2x, r2y) = (x2+w2/2, y2-h2/2)
overlaps (Circle r1 (x1,y1)) (Circle r2 (x2,y2)) = (x1-x2)**2 + (y1-y2)**2 < (r1+r2)**2
overlaps (Rectangle h w (x,y)) (Circle r (xc,yc)) = ((xn-xc)**2 + (yn-yc)**2) < r**2
    where 
        (x1, y1) = (x-w/2, y+h/2)
        (x2, y2) = (x+w/2, y-h/2)
        xn = max x1 (min xc x2)
        yn = max y2 (min yc y1)
overlaps (Circle r (xc,yc)) (Rectangle h w (x,y)) = 
    overlaps (Rectangle h w (x,y)) (Circle r (xc,yc)) 

-- ----------------------------------------------
-- Exercise 2
-- ----------------------------------------------

any1 :: (a->Bool) -> [a] -> Bool
any1 f xs = not (null (filter f xs))

any2 :: (a->Bool) -> [a] -> Bool
any2 _ [] = False
any2 f xs = foldr (||) False (map f xs)

all1 :: (a->Bool) -> [a] -> Bool
all1 f xs = length (filter f xs) == length xs

all2 :: (a->Bool) -> [a] -> Bool
all2 _ [] = True
all2 f xs = foldr (&&) True (map f xs)

-- ----------------------------------------------
-- Exercise 3
-- ----------------------------------------------

unzip1 :: [(a, b)] -> ([a], [b])
unzip1 xys = foldr (\(x,y) (xs,ys) -> (x:xs, y:ys)) ([],[]) xys

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------


