module Lecture_05
where

import Test.QuickCheck
import Data.Char

input_list2 = [(2,3),(2,1),(7,8)]
-----------------------------------------
--[x*y | (x,y) <- input_list2]
--[x*x | (x,_) <- input_list2]
--[(x+y,x-y) | (x,y) <- input_list2]
--[(x+y,x-y) | (x,y) <- input_list2, x > 10]
--[ x > 2 | (x,_) <- input_list2]
--[ z | z <- input_list2]
--[ snd z | z <- input_list2]
-----------------------------------------

input_list3 = [1..50]
-----------------------------------------
--[show x | x <- input_list3]
--[show x | x <- input_list3, x*x < 100]
--[show x | x <- input_list3, x*x < 100, mod x 2 == 0]
-----------------------------------------

acro :: String -> String
acro st = [ch | ch <- st, elem ch ['A'..'Z'] ]
-----------------------------------------
--acro "National Aeronautics and Space Administration"
--acro "Self Contained Underwater Breathing Apparatus"
-----------------------------------------

multVec :: [Float] -> [Float] -> Float
multVec xs ys = sum [x*y | x <- xs, y <- ys]
-----------------------------------------
--multVec [2.0, 3.5] [(-7.9), 4.4] <- incorrect, too many multiplications
-----------------------------------------

multVecCorrect :: [Float] -> [Float] -> Float
multVecCorrect xs ys = sum [x*y | (x,y) <- zip xs ys]
-----------------------------------------
--zip [2.0, 3.5] [(-7.9), 4.4]
--multVecCorrect [2.0, 3.5] [(-7.9), 4.4] 
-----------------------------------------

-- x*x + y*y == z*z
pyTriples :: Integer -> [(Integer, Integer, Integer)]
-- avoiding repetitions, such as (3,4,5), (4,3,5):
pyTriples n = [(x,y,z) | x <- [2..n], y <- [x+1 .. n], z <- [y+1 .. n], x*x + y*y == z*z]
-----------------------------------------
--pyTriples 50
-----------------------------------------

insertionSort :: [Integer] -> [Integer]
insertionSort [] = []
insertionSort (x:xs) = ins x (insertionSort xs)

ins :: Integer -> [Integer] -> [Integer]
ins x [] = [x]
ins x (y:ys) 
    | x <= y = x:(y:ys)
    | otherwise = y:(ins x ys)

-----------------------------------------
--insertionSort [1,3,5,7,9,2,4,6,8]
-----------------------------------------

-- filter :: (a -> Bool) -> [a] -> [a]     -- Defined in ‘GHC.List’
-- function (a -> Bool) is applied to [a] to get [a]
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter  _ [] = []
myFilter cond (x:xs)
    | cond x = x : (myFilter cond xs)
    | otherwise = (myFilter cond xs)

-- replacing primitive recursion with list comprehension
myFilter2 :: (a -> Bool) -> [a] -> [a]
myFilter2 cond xs = [x | x <- xs, cond x]


-- adjancent [1,2,3,2,3,4] --> [3,2]
--   2 <- 3 -> 2
--        3 -> 2 <- 3

adjacent :: [Integer] -> [Integer]

{-
adjacent [] = []
adjacent [_] = []
adjacent [_,_] = []
adjacent (x:y:z:zs) =
    if x == z then y : adjacent (y:z:zs) else adjacent (y:z:zs)
-}

{-
adjacent (x:y:z:zs) = 
    if x == z then y : adjacent (y:z:zs) else adjacent (y:z:zs)
adjacent _ = []
-}

{-
adjacent l@(x:y:z:zs) =
    if x == z then y : adjacent (tail l) else adjacent (tail l)
adjacent _ = []
-}

adjacent (x:l@(y:z:zs)) =
    if x == z then y : adjacent l else adjacent l
adjacent _ = []
