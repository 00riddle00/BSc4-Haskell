module Lecture_09
where

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' f xs = foldr (\x acc -> if f x then x : acc else []) [] xs

-----------------------------------------
--takeWhile' (<100) [1,77,9,101,6,99]
-- scanr (\x acc -> if (<100) x then x : acc else []) [] [1,77,9,101,6,99]
-----------------------------------------
