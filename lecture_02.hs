module Lecture_02
where

-- cabal install --lib --package-env . QuickCheck
import Test.QuickCheck

size :: Integer
size = 20

square :: Integer -> Integer
square x = x*x

square_1 :: Integer -> Integer
square_1 x = square (x+1)

greater_than_size x = x > size

-- size = 55


(+++) :: Int -> Int -> Int
(+++) x y = x*x + y*y


exOr :: Bool -> Bool -> Bool
exOr x y = (x || y) && not (x && y)

exOr_1 :: Bool -> Bool -> Bool
exOr_1 True x = not x
exOr_1 False x = x

exOr_2 :: Bool -> Bool -> Bool
exOr_2 True False = True
exOr_2 False True = True
exOr_2 True True = False
exOr_2 False False = False
-- exOr_2 _ _ = False <- instead of last two lines


-- Properties to test
prop_square_1 x = 
    square_1 x == x*x  + 2*x + 1

prop_square_1_wrong x =
    square_1 x == x*x + 2*x - 1

prop_exOrs x y =
    exOr x y == exOr_1 x y && exOr x y == exOr_2 x y


is_zero 0 = True
is_zero _ = False

-- max of three numbers

max3 :: Integer -> Integer -> Integer -> Integer
max3 x y z
    | x >= y && x >= z = x
    | y >= z = y
    | otherwise = z


prop_max3 :: Integer -> Integer -> Integer -> Bool
prop_max3 x y z =
    (max3 x y z >= x) &&
    (max3 x y z >= y) &&
    (max3 x y z >= z)


fun n
    | n == 0 = ""
    | n > 0 = show(n) ++ fun(n-1)
    | otherwise = error "Negative number"

fact :: Integer -> Integer
fact n
    | n == 0 = 1
    | n > 0 = fact(n-1) * n
    | otherwise = error "Only defined for positive numbers"

-- Combining pattern matching and guards
-- is a common pratice in Haskell
fact_2 :: Integer -> Integer
fact_2 0 = 1
fact_2 n
    | n > 0 = fact_2(n-1) * n
    | otherwise = error "Only defined for positive numbers"

