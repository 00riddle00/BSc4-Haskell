-- @Tomas Giedraitis
-- Exercise set 2

module Lab_2
where

import Data.Char
import Data.List

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

average :: [Float] -> Float
average xs = sum xs / fromIntegral(length xs)

-- ----------------------------------------------
-- Exercise 2
-- ----------------------------------------------

divides1 :: Integer -> [Integer]
divides1 0 = error "All integers divide 0"
divides1 1 = [1]
divides1 x
    | x < 0 = divides1 (-x)
    | otherwise = 1:(div' 2 x [])
    where
        div' i x xs
            | i > x `div` 2 = (x:xs)
            | x `mod` i == 0 = i:(div' (i+1) x xs)
            | otherwise = div' (i+1) x (xs)

divides2 :: Integer -> [Integer]
divides2 0 = error "All integers divide 0"
divides2 1 = [1]
divides2 x
    | x < 0 = divides2 (-x)
    | otherwise = [1] ++ [ i | i <- [2..x `div` 2], mod x i == 0] ++ [x]

isPrime :: Integer -> Bool
isPrime x = x > 1 && divides1(x) == [1,x]

-- ----------------------------------------------
-- Exercise 3
-- ----------------------------------------------

prefix :: String -> String -> Bool
prefix "" _ = True
prefix _ "" = False
prefix p s = head p == head s && prefix (tail p) (tail s)

substring :: String -> String -> Bool
substring sub s = prefix sub s || substring sub (tail s)

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

permut :: [Integer] -> [Integer] -> Bool
permut [] [] = True
permut _ [] = False
permut [] _ = False
permut (x:xs) ys =
    let 
        removeFromList zs i = (take i zs) ++ (drop (i+1) zs)
    in
        case (elemIndex x ys) of
            Just i -> permut xs (removeFromList ys i)
            Nothing -> False

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
itemTotal ((k,v):xs) = items' [k] [v] xs
    where
        items' :: [String] -> [Float] -> [(String,Float)] -> [(String,Float)]
        items' keys values [] = (zip keys values)
        items' keys values ((k,v):xs) =
            let 
                addToList xs i value = 
                    (take i xs) ++ [((xs!!i) + value)] ++ (drop (i+1) xs)
            in
                case (elemIndex k keys) of
                    Just i -> items' keys (addToList values i v) xs
                    Nothing -> items' (keys++[k]) (values++[v]) xs

itemDiscount :: String -> Integer -> [(String,Float)] -> [(String,Float)]
itemDiscount _ _ [] = []
itemDiscount i d xs = [ if i == x then (x, y-y*fromIntegral(d)/100 ) else (x,y) | (x,y) <- xs]
