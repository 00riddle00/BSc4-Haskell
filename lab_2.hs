-- @Tomas Giedraitis
-- Exercise set 2

module Lab_2
where

import Data.Char
import Test.QuickCheck

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

average :: [Float] -> Float
average [x] = x
average xs = avg' xs 0 0
    where
        avg' [] s n = s / n
        avg' (x:xs) s n = avg' xs (s+x) (n+1)

--average :: [Float] -> Float
--average xs = sum xs / fromIntegral(length xs)

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

prefix :: String -> String -> Bool
prefix "" _ = True
prefix _ "" = False
prefix p s
    | length p > length s = False
    | head p == head s = prefix (tail p) (tail s)
    | otherwise = False

substring :: String -> String -> Bool
substring sub s = prefix sub s || substring sub (tail s)

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

permut :: [Integer] -> [Integer] -> Bool
permut [] [] = True
permut _ [] = False
permut [] _ = False
permut xs ys
    | length xs /= length ys = False
    | otherwise = qsort(xs) == qsort(ys)
        where
            qsort [] = []
            qsort (x:xs) = qsort [y | y <- xs, y <= x] ++ [x] ++ qsort [y | y <- xs, y > x]

-- ----------------------------------------------
-- Exercise 5
-- ----------------------------------------------

capitalise :: String -> String
capitalise str = [toUpper ch | ch <- str, elem ch ['a'..'z'] || elem ch ['A'..'Z']]

-- ----------------------------------------------
-- Exercise 6
-- ----------------------------------------------

itemTotal :: [(String,Float)] -> [(String,Float)]
itemTotal [] = []
itemTotal [x] = [x]
itemTotal ((k,v):xs) = tmp [k] [v] xs
    where
        tmp :: [String] -> [Float] -> [(String,Float)]
        tmp keys values [] = zip keys values
        tmp keys values ((k,v):xs)
            | elem k keys = tmp keys values(add $ to one existing value by index) xs   --in progress
            | otherwise = tmp keys++[k] values++[v] xs                                 --in progress



--itemDiscount :: String -> Integer -> [(String,Float)] -> [(String,Float)]
