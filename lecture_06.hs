module Lecture_06
where
import Test.QuickCheck

-- returns first part of the list the items of which, when added together, 
-- do not exceed the limit (might return the whole list)
not_exceeding :: Int -> [Int] -> [Int]
not_exceeding n xs = not_exceed' n xs 0
    where
        not_exceed' :: Int -> [Int] -> Int -> [Int]
        not_exceed' _ [] _ = []
        not_exceed' n (x:xs) k
            | (x+k) > n = []
            | otherwise = x:(not_exceed' n xs (x+k))

not_exceeding_tr :: Int -> [Int] -> [Int]
not_exceeding_tr n xs = not_exceed' n xs 0 []
    where
        not_exceed' :: Int -> [Int] -> Int -> [Int] -> [Int]
        not_exceed' _ [] _ ys = ys
        not_exceed' n (x:xs) k ys
            | (x+k) > n = ys
            | otherwise = not_exceed' n xs (x+k) (ys ++ [x])
-----------------------------------------
--not_exceeding_tr 5 [1,2,3,4]
-----------------------------------------

qsort :: [Integer] -> [Integer]
qsort [] = []
qsort (x:xs) = qsort [y | y <- xs, y <= x] ++ [x] ++ qsort [y | y <- xs, y > x]

-----------------------------------------
--qsort [100, 99 .. 1]
-----------------------------------------

--aditional functions needed for this function to work
--are defined in the lecture slides
splitWords_case :: String -> [String]
splitWords_case "" = []
splitWords_case st =
    case (splitFirstWord_let st) of
        ("",_) -> []
        (first,rest) -> first : splitWords_case rest




