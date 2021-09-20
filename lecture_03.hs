module Lecture_03
where

import Test.QuickCheck


--factorial example
fact :: Integer -> Integer
fact n
    | n == 0 = 1
    | n > 0 = fact(n-1) * n
    | otherwise = error "Negative argument"

-- 1 * 2 * ... * n
fact2 :: Integer -> Integer
fact2 0 = 1
fact2 n
    | n > 0 = fact2(n-1) * n
    | otherwise = error "Negative argument!"


--fact 0 + fact 1 + ... + fact n
sumFacts :: Integer -> Integer
sumFacts 0 = 1
sumFacts n
    | n > 0 = sumFacts (n-1) + fact n
    | otherwise = error "Negative argument!"


-- f 0 + f 1 + ... + f n
sumFuns :: (Integer -> Integer) -> Integer -> Integer
sumFuns f 0 = f 0
sumFuns f n
    | n > 0 = sumFuns f (n-1) + f n
    | otherwise = error "Negative argument!"

sumFacts2 n = sumFuns fact n


-- quickCheck will run 100 times on this function.
prop_sum :: Integer -> Bool
prop_sum n = 
    if n >= 0 then sumFacts n == sumFacts2 n else True


-- covering any kind of range
-- f m + f (m+1) + ... + f n
sumFunsRange :: (Integer -> Integer) -> Integer -> Integer -> Integer
sumFunsRange f m n
    | (n-m) == 0 = f n  -- Here we combined both arguments to produce the base case (=zero).
                        -- 'f n' could be 'f m' as well, since 'n = m' here.
    | (n-m) > 0 = sumFunsRange f m (n-1) + f n
    | otherwise = error "Negative argument!"


sumFunsRange2 :: (Integer -> Integer) -> Integer -> Integer -> Integer
sumFunsRange2 f m n
    | n == m = f n
    | n > m = sumFunsRange f m (n-1) + f n -- We move from right to left in the range
    | otherwise = error "Negative argument!"

sumFunsRange3 :: (Integer -> Integer) -> Integer -> Integer -> Integer
sumFunsRange3 f m n
    | n == m = f n
    | n > m = sumFunsRange f (m+1) n + f m  -- Now we move from left to right in the range.
                                            -- We are still moving towards the base case (=zero), 
                                            -- since n == m means (n-m) == 0.
    | otherwise = error "Negative argument!"


-- Another example of non-primitive recursion
-- Going towards the base case in bigger jumps
-- The base case is also more complex
divide :: Integer -> Integer -> Integer
divide m n
    | (m < 0) || (n <= 0) = error "Invalid arguments!"
    | m < n = 0
    | otherwise = divide (m - n) n + 1


applyPositiveIfTrue :: (Integer -> Integer, Integer, Bool) -> Integer
applyPositiveIfTrue (_,x,False) = x
applyPositiveIfTrue (f,x,_)
    | x >= 0 = f x
    | otherwise = f (-x)
