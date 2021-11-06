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
       

{-
overlap (Rectangle 10 10 (5,5)) (Rectangle 5 10 (10, 2.5)) - True
l1 = (0, 10)
r1 = (10, 0)

l2 = (5, 5)
r2 = (15, 0)

overlap (Circle 1 (5,4)) (Rectangle 4 10 (6,1)) - True
overlap (Circle 1 (1,1)) (Circle 1 (1,1)) - True
-}
