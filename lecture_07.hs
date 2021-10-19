module Lecture_07
where

allDivisors :: [Integer] -> [[Integer]]
allDivisors xs = map divisors xs

firstElems :: [(a,b)] -> [a]
firstElems xs = map fst xs

zipWith' :: (a->b->c) -> [a] -> [b] -> [c]
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys
zipWith' _ _ _ = []

zipWith'' :: ((a,b)->c) -> [a] -> [b] -> [c]
zipWith'' f xs ys = map f (zip xs ys)

-----------------------------------------
--zipWith' (+) [1..10] [10,9..1]

--zipWith'' (+) [1..10] [10,9..1] - would not work
--       So we do:
--plusPair (x,y) = x+y
--zipWith'' plusPair [1..10] [10,9..1]
--   or use lambda notation:
--zipWith'' (\(x,y)->x+y) [1..10] [10,9..1]
-----------------------------------------
