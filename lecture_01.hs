{-
lecture_01
-}

module Lecture_01 where

import Test.QuickCheck

-- The value size is an integer

size :: Integer
size = 25

-- The function to square an integer

square :: Integer -> Integer
square n = n*n


-- Then function to double an integer
double :: Integer -> Integer
double n = 2*n

triple :: Integer -> Integer
triple n = 3*n

ff :: Integer -> Integer
ff x = x^2 + 100


-- An example using double, square, and size

example :: Integer
example = double (size - square (2+2))

equal_to_size :: Integer -> Bool
equal_to_size x = x==size

-- A property to test
-- run 'quickCheck prop_double' in ghci
prop_double :: Integer -> Bool
prop_double x =
     double x == x+x

