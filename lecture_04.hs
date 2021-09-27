module Lecture_04
where

import Test.QuickCheck

-- import Data.Char

weird :: (Int->Int->Int,(Int,Int),Bool) -> Int
weird (_,_,False) = (-1)
weird (_,(0,_),_) = 0
weird (_,(_,0),_) = 0
weird (f,(x,y),_) = f x y

-----------------------------------------
--weird ((+),(0,99),False)
--weird ((+),(0,99),True)
--weird ((+),(0,99),T
--weird ((+),(1,99),True)
-----------------------------------------

isSingleton :: [a] -> Bool
isSingleton [_] = True
isSingleton _ = False

describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
    where
        what [] = "empty."
        what [_] = "singleton list."
        what (_:_:_) = "a longer list."
     -- what (_:(_:_)) = "a longer list."
     -- what _ = "a longer list."

-----------------------------------------
--describeList [1..3]
--describeList "ab"
--describeList "a"
--describeList ""
-----------------------------------------

ff :: [Int] -> Int
ff [] = 0
ff [x]
    | x == 0 = 100
    | otherwise = x
ff (x:y:xs) = x + y + ff xs

ff2 :: [Int] -> Int
ff2 [] = 0
ff2 [0] = 100
ff2 [x] = x
ff2 (x:y:xs) = x + y + ff xs

-----------------------------------------
--ff [1..5]
--ff2 [1..5]
-----------------------------------------

--(x:y:z) = [1,3,77]
--(x:y:[z]) = [1,3,77] 
--(x:y:z) = [1,3,77] 

-- this also assigns the whole list to 's'
s@(x:y:z) = [1,3 .. 13]
