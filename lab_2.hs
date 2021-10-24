-- @Tomas Giedraitis
-- Exercise set 2

module Lab_2
where

import Data.Char
import Test.QuickCheck

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

average1 :: [Float] -> Float
average1 [x] = x
average1 xs = avg' xs 0 0
    where
        avg' [] s n = s / n
        avg' (x:xs) s n = avg' xs (s+x) (n+1)

average2 :: [Float] -> Float
average2 xs = sum xs / fromIntegral(length xs)

-- ----------------------------------------------
-- Exercise 2
-- ----------------------------------------------

divides1 :: Integer -> [Integer]
divides1 0 = error "All integers divide 0"
divides1 (-1) = divides1 1
divides1 1 = [1,-1]
divides1 x
    | x < 0 = divides1 (-x)
    | otherwise = 1:(-1):(div' 2 x [])
    where
        div' i x xs
            | fromIntegral(i) > fromIntegral(x)/2 = (x:(-x):xs)
            | mod x i == 0 = i:(-i):(div' (i+1) x xs)
            | otherwise = div' (i+1) x (xs)

divides2 :: Integer -> [Integer]
divides2 0 = error "All integers divide 0"
divides2 (-1) = divides2 1
divides2 1 = [1,-1]
divides2 x
    | x < 0 = divides2 (-x)
    | otherwise = [1,-1] ++ concat [ [i,(-i)] | i <- [2..floor(fromIntegral(x)/2)], mod x i == 0] ++ [x, (-x)]

isPrime :: Integer -> Bool
isPrime 0 = False
isPrime x
    | x < 0 = error "negative integer!"
    | length (divides1(x)) == 4 = True
    | otherwise = False

-- ----------------------------------------------
-- Exercise 3
-- ----------------------------------------------

-- (...)

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

-- (...)

-- ----------------------------------------------
-- Exercise 5
-- ----------------------------------------------

capitalise :: String -> String
capitalise str = [toUpper ch | ch <- str, elem ch ['a'..'z'] || elem ch ['A'..'Z']]

-- ----------------------------------------------
-- Exercise 6
-- ----------------------------------------------

-- (...)
