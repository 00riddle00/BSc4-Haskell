-- @Tomas Giedraitis
-- Exercise set 1

module Lab_1 
where

import Test.QuickCheck

-- TODO quickcheck mult, *
-- TODO smaller/larger root using min, max and 
--      without using lists

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

exOr :: Bool -> Bool -> Bool
exOr x y = (x || y) && not (x && y)

nAnd_1 :: Bool -> Bool -> Bool
nAnd_1 x y = not (x && y)

nAnd_2 :: Bool -> Bool -> Bool
nAnd_2 _ False = True
nAnd_2 x True = not x

nAnd_3 :: Bool -> Bool -> Bool
nAnd_3 False False = True
nAnd_3 False True = True
nAnd_3 True False = True
nAnd_3 True True = False

-- ----------------------------------------------
-- Exercise 2
-- ----------------------------------------------

prop_nAnds_1 :: Bool -> Bool -> Bool
prop_nAnds_1 x y =
    nAnd_1 x y == nAnd_2 x y && nAnd_1 x y == nAnd_3 x y

prop_nAnds_2 :: Bool -> Bool -> Bool
prop_nAnds_2 x y
    | (x == False) || (y == False) = nAnd_1 x y
    | otherwise = True
    
-- ----------------------------------------------
-- Exercise 3
-- ----------------------------------------------

nDigits :: Integer -> Int
nDigits x
    | x >= 0 = length(show x) 
    | x < 0 = nDigits(abs x) 

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

nRoots :: Float -> Float -> Float -> Int
nRoots 0 _ _ = error "the first argument should be non-zero!"
nRoots a b c
    | det > 0 = 2
    | det == 0 = 1
    | otherwise = 0
    where
        det = b^2 - 4*a*c

-- ----------------------------------------------
-- Exercise 5
-- ----------------------------------------------

smallerRoot :: Float -> Float -> Float -> Float 
largerRoot :: Float -> Float -> Float -> Float
getRoots :: Float -> Float -> Float -> [Float]

smallerRoot a b c = minimum (getRoots a b c)
largerRoot a b c = maximum (getRoots a b c)

getRoots a b c
    | (nRoots a b c == 0) = error "the quadratic equation has no real roots!"
    | otherwise = [(-b) - sqrt(det) / 2*a, (-b) + sqrt(det) / 2*a]
    where
        det = b^2 - 4 * a * c

-- ----------------------------------------------
-- Exercise 6
-- ----------------------------------------------

power2 :: Integer -> Integer
power2 n
    | n == 0 = 1
    | n > 0 = 2 * power2 (n-1)
    | otherwise = error "the power must be a natural number!"

-- ----------------------------------------------
-- Exercise 7
-- ----------------------------------------------

mult :: Integer -> Integer -> Integer
mult 0 _ = 0
mult _ 0 = 0
mult 1 n = n
mult n 1 = n
mult m n
    | m > 1 = mult (m - 1) n + n
    | otherwise = (-1) * mult (-m) n

-- ----------------------------------------------
-- Exercise 8
-- ----------------------------------------------

prod :: Integer -> Integer -> Integer
prod m n
    | m > n = error "invalid range!"
    | m == n = m
    | otherwise = mult (prod m (n-1)) n -- from left to right
--  | otherwise = mult m (prod (m+1) n) -- from right to left 

fact :: Integer -> Integer
fact n
    | n == 0 = 1
    | n > 0 = prod 1 n
    | otherwise = error "only defined for natural numbers!"

