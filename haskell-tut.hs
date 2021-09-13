{-===========================================}
{    _   _           _        _ _ 
{   | | | | __ _ ___| | _____| | |
{   | |_| |/ _` / __| |/ / _ \ | |
{   |  _  | (_| \__ \   <  __/ | |
{   |_| |_|\__,_|___/_|\_\___|_|_|
{                              
{   Haskell tutorial by Derek Banas            
{                                             
{   2021-08-11                                 
{                                             
{===========================================-}

-- load modules
import Data.List
import System.IO

{-===========================================}
{ Comments                                   
{===========================================-}

-- Comment

{- 
Multiline comment
-}

{-===========================================}
{ Data Types                                  
{===========================================-}

-- Int -2^63 2^63
maxInt = maxBound :: Int
minInt = minBound :: Int

-- Integer

-- Float

-- Double

bigFloat = 3.99999999999 + 0.00000000005
bigFloat2 = 3.999999999999 + 0.000000000005

-- Bool True False

-- Char '

-- Tuple

always5 :: Int
always5 = 5

{-===========================================}
{ Math Functions
{===========================================-}

sumOfNums = sum [1..1000]

addEx = 5 + 4
subEx = 5 - 4
multEx = 5 * 4
divEx = 5 / 4

modEx = mod 5 4

modEx2 = 5 `mod` 4

negNumEx = 5 + (-4)

num9 = 9 :: Int
sqrtOf9 = sqrt (fromIntegral num9)

-- Built in math functions
piVal = pi
ePow9 = exp 9
logOf9 = log 9
squared9 = 9 ** 2
truncateVal = truncate 9.999
roundVal = round 9.999
ceilingVal = ceiling 9.999
floorVal = floor 9.999

-- Also sin, cos, tan, asin, atan, acos, sinh,
-- tanh, cosh, asinh, atanh, acosh

trueAndFalse = True && False
trueOrFalse = True || False
notTrue = not(True)

{-===========================================}
{ Lists
{===========================================-}

primeNumbers = [3,5,7,11]
 
morePrimes = primeNumbers ++ [13,17,19,23,29]

{-===========================================}
{ [Lists] : Operator
{===========================================-}

favNums = 2 : 7 : 21 : 66 :[]

multList = [[3,5,7],[11,13,17]]

morePrimes2 = 2 : morePrimes

lenPrime = length morePrimes2

revPrime = reverse morePrimes2

isListEmpty = null morePrimes2

{-===========================================}
{ [Lists] !! Operator
{===========================================-}

secondPrime = morePrimes2 !! 1

{-===========================================}
{ [Lists] Head / Last
{===========================================-}

firstPrime = head morePrimes2

lastPrime = last morePrimes2

primeInit = init morePrimes2

{-===========================================}
{ [Lists] Take
{===========================================-}

first3Primes = take 3 morePrimes2

removedPrimes = drop 3 morePrimes2

{-===========================================}
{ [Lists] Elem
{===========================================-}

is7InList = 7 `elem` morePrimes2

maxPrime = maximum morePrimes2

minPrime = minimum morePrimes2

newList = [2,3,5]

prodPrimes = product newList

{-===========================================}
{ [Lists] Create Range
{===========================================-}

zeroToTen = [0..10]

evenList = [2,4..20]

letterList = ['A','C'..'Z']

infinPow10 = [10,20..]

many2s = take 10 (repeat 2)

many3s = replicate 10 3

{-===========================================}
{ [Lists] Cycle
{===========================================-}

cycleList = take 10 (cycle [1,2,3,4,5])

{-===========================================}
{ [Lists] | Operator
{===========================================-}

listTimes2 = [x * 2 | x <- [1..10]]

{-===========================================}
{ [Lists] Filter
{===========================================-}

listTimes3 = [x * 3 | x <- [1..10], x * 3 <= 20]

divisBy9N13 = [x | x <- [1..500], x `mod` 13 == 0, x `mod` 9 == 0]

sortedList = sort [9,1,8,3,4,7,6]

{-===========================================}
{ [Lists] ZipWith
{===========================================-}

sumOfLists = zipWith (+) [1,2,3,4,5] [6,7,8,9,10]

{-===========================================}
{ [Lists] More Filters
{===========================================-}

listBiggerThan5 = filter (>5) morePrimes

{-===========================================}
{ [Lists] TakeWhile
{===========================================-}

evensUpTo20 = takeWhile (<= 20) [2,4..]

{-===========================================}
{ [Lists] Fold
{===========================================-}

multOfList = foldl (*) 1 [2,3,4,5]

multOfList2 = foldr (*) 1 [2,3,4,5]

{-===========================================}
{ [Lists] List comprehension
{===========================================-}

pow3List = [3^n | n <- [1..10]]

multTable = [[x * y | y <- [1..10]] | x <- [1..10]]

{-===========================================}
{ Tuples (lists of multiple data types)
{===========================================-}

randTuple = (1,"Random Tuple")

bobSmith = ("Bob Smith",52)

bobsName = fst bobSmith

bobsAge = snd bobSmith

{-===========================================}
{ Zip
{===========================================-}

names = ["Bob", "Mary", "Tom"]
addresses = ["123 Main", "234 North", "567 South"]

namesNAddress = zip names addresses

{-===========================================}
{ Functions && Compiling
{===========================================-}

main = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn ("Hello " ++name)

{-===========================================}
{ Type Declarations
{===========================================-}

-- Type Declaration
addMe :: Int -> Int -> Int

-- funcName param1 param2 = operations (returned value)
addMe x y = x + y

-- without Type declaration. Now works not only with Ints.
sumMe x y = x + y

addTuples :: (Int, Int) -> (Int, Int) -> (Int, Int)

addTuples (x, y) (x2, y2) = (x + x2, y + y2)

-- Type Declaration
whatAge :: Int -> String

-- Define function for some arguments
whatAge 16 = "You can drive"
whatAge 18 = "You can vote"
whatAge 21 = "You're an adult"
--whatAge x = "Nothing Important"
whatAge _ = "Nothing Important"

{-===========================================}
{ Recursive Functions
{===========================================-}

factorial :: Int -> Int

factorial 0 = 1
factorial n = n * factorial (n - 1)

-- 3 * factorial(2)         :6
-- 2 * factorial(1)     : 2
-- 1 * factorial(0) : 1

prodFact n = product[1..n]

{-===========================================}
{ Guards
{===========================================-}

isOdd :: Int -> Bool

isOdd n
    | n `mod` 2 == 0 = False
    | otherwise = True

isEven n = n `mod` 2 == 0

whatGrade :: Int -> String

whatGrade age
    | (age >= 5) && (age <= 6) = "Kindergarten"
    | (age > 6) && (age <= 10) = "Elementary School"
    | (age > 10) && (age <= 14) = "Middle School"
    | (age > 14) && (age <= 18) = "High School"
    | otherwise = "Go to College"

{-===========================================}
{ Where
{===========================================-}

batAvgRating :: Double -> Double -> String

batAvgRating hits atBats
    | avg <= 0.200 = "Terrible Batting Average"
    | avg <= 0.250 = "Average Player"
    | avg <= 0.280 = "You're doing pretty good"
    | otherwise = "You're a Superstar"
    where avg = hits / atBats

{-===========================================}
{ (x:y)
{===========================================-}

getListItems :: [Int] -> String

getListItems [] = "Your list is empty"
getListItems (x:[]) = "Your list starts with " ++ show x
getListItems (x:y:[]) = "Your list contains " ++ show x ++ " and " ++ show y
getListItems (x:xs) = "The 1st item is " ++ show x ++ " and the rest are " ++ show xs

{-===========================================}
{ As
{===========================================-}

getFirstItem :: String -> String

getFirstItem [] = "Empty String"
getFirstItem all@(x:xs) = "The first letter in " ++ all ++ " is " ++ [x]

{-===========================================}
{ Higher order Functions, Map, (x:xs)
{===========================================-}

times4 :: Int -> Int

times4 x = x * 4

listTimes4 = map times4 [1,2,3,4,5]

multBy4 :: [Int] -> [Int]
multBy4 [] = []
multBy4 (x:xs) = times4 x : multBy4 xs

--[1,2,3,4] : x = 1 | xs = [2,3,4]
--[2,3,4] : x = 2 | xs = [3,4]
--[3,4] : x = 3 | xs = [4]
--[4] : x = 4 | xs = []

areStringsEq :: [Char] -> [Char] -> Bool
areStringsEq [] [] = True
areStringsEq (x:xs) (y:ys) = x == y && areStringsEq xs ys
areStringsEq _ _  = False

{-===========================================}
{ Pass Function into a Function
{===========================================-}

doMult :: (Int -> Int) -> Int

-- function
doMult func = func 3

-- variable
num3Times4 = doMult times4

{-===========================================}
{ Returning a Function
{===========================================-}

getAddFunc :: Int -> (Int -> Int)

-- function which returns a function
-- getAddFunc 3 will return a function
-- getAddFunc 3 4 will return (3+4) = 7
getAddFunc x y = x + y

-- function
-- adds3 :: Int -> Int
adds3 = getAddFunc 3
-- adds3 3 y = 3 + y
-- adds3 3 y = getAddFunc 3 y = 3 + y

-- variable
fourPlus3 = adds3 4

-- variable
threePlusList = map adds3 [1,2,3,4,5]

{-===========================================}
{ Lambda
{===========================================-}

-- lambda fn - fn without a name (ad hoc fn)
dbl1To10 = map (\x -> x * 2) [1..10]

{-===========================================}
{ If 
{===========================================-}

-- < > <= >= == /=
-- && || not

doubleEvenNumbers y = 
    if (y `mod` 2 /= 0)
        then y
        else y * 2 -- else is necessary in the if stmt

getClass :: Int -> String

{-===========================================}
{ Case
{===========================================-}

getClass n = case n of
    5 -> "Go to Kindergarten"
    6 -> "Go to Elementary School"
    _ -> "Go away"

{-===========================================}
{ Modules
{===========================================-}

--- in one file, use:
{-module SampFunctions(getClass, doubleEvenNumbers) where-}
--- list all your functions
--- ...
--- ...
--- ...
--- ...

--- in another file, to import these functions, use:
{-import SampFunctions-}

{-===========================================}
{ Enumerations
{===========================================-}

data BaseballPlayer = Pitcher 
                    | Catcher
                    | Infielder
                    | Outfield
                deriving Show
                -- Show converts into a string

-- Type Declaration
barryBonds :: BaseballPlayer -> Bool

-- Define function for some arguments
barryBonds Outfield = True

-- variable
barryInOF = print(barryBonds Outfield)

{-===========================================}
{ Custom Types (like a struct)
{===========================================-}

-- 3 variables inside a Customer "struct":
------- String, String, Double
data Customer = Customer String String Double
    deriving Show

-- tomSmith Declaration
tomSmith :: Customer

-- tomSmith Definition
tomSmith = Customer "Tom Smith" "123 Main" 20.50

getBalance :: Customer -> Double

getBalance (Customer _ _ b) = b

-- Enum
data RPS = Rock | Paper | Scissors

shoot :: RPS -> RPS -> String
shoot Paper Rock = "Paper Beats Rock"
shoot Rock Scissors = "Rocks Beats Scissors"
shoot Scissors Paper = "Scissors Beat Ppaer"
shoot Scissors Rock = "Scissors Loses to Rock"
shoot Paper Scissors = "Paper Loses to Scissors"
shoot Rock Paper = "Rock Loses to Paper"
shoot _ _ = "Error"

{-===========================================}
{ Polymorphic Type
{===========================================-}

                 -- x_center, y_center, radius
data Shape = Circle Float Float Float
                    -- x_top, y_left, x_bottom, x_right
           | Rectangle Float Float Float Float
    deriving Show
    
area :: Shape -> Float

area (Circle _ _ r) = pi * r ^ 2
area (Rectangle x y x2 y2) = 
    (abs (x2 - x)) * (abs (y2 - y))

{-===========================================}
{ $ Operator
{===========================================-}

-- $ gets rid of additional parenthesis, 
-- indicating that anything that happens after
-- a $ sign get precedence over anything that 
-- comes before it.

--area (Rectangle x y x2 y2) = 
    --(abs $ x2 - x) * (abs $ y2 - y)

{-===========================================}
{ . Operator
{===========================================-}

-- . Operator allows us to chain functions
-- by passing output on the right to the 
-- input on the left (also gets rid of 
-- additional parenthesis)

sumValue = putStrLn (show (1 + 2))

sumValue2 = putStrLn . show $ 1 + 2

areaOfCircle = area (Circle 50 60 20)
areaOfRectangle = area $ Rectangle 10 10 100 100

{-===========================================}
{ Type Classes
{===========================================-}

-- Num Eq Ord Show ...

-- Type classes correspond to sets of types 
-- which have certain operations defined
-- for them.

-- :t (+)
-- (+) :: Num a => a -> a -> a

data Employee = Employee { name :: String,
                           position :: String,
                           idNum :: Int
                           } deriving (Eq, Show)

samSmith = Employee {name = "Sam Smith", position = "Manager", idNum = 1000}
pamMarx = Employee {name = "Pam Marx", position = "Sales", idNum = 1001}

isSamPam = samSmith == pamMarx

samSmithData = show samSmith

{-===========================================}
{ Type Instance
{===========================================-}

-- define Enum
data ShirtSize = S | M | L

-- Overriding what the 'Eq' type class does
instance Eq ShirtSize where
    S == S = True
    M == M = True
    L == L = True
    _ == _ = False

-- Overriding what the 'Show' type class does
instance Show ShirtSize where
    show S = "Small"
    show M = "Medium"
    show L = "Large"

smallAvail = S `elem` [S, M, L]

theSize = show S

{-===========================================}
{ Custom Typeclass
{===========================================-}

-- Custom Type class which is going to check
-- for equality
--
-- 'a' represents any type that implements
-- the function 'are equal'
class MyEq a where
    areEqual :: a -> a -> Bool

instance MyEq ShirtSize where
    areEqual S S = True
    areEqual M M = True
    areEqual L L = True
    areEqual _ _ = False

newSize = areEqual M M

{-===========================================}
{ File I/O
{===========================================-}

sayHello = do
    putStrLn "What's your name"
    name <- getLine
    putStrLn $ "Hello " ++ name

writeToFile = do
    theFile <- openFile "test.txt" WriteMode
    hPutStrLn theFile ("Random line of text")
    hClose theFile

readFromFile = do
    theFile2 <- openFile "test.txt" ReadMode
    contents <- hGetContents theFile2
    putStr contents
    hClose theFile2

{-===========================================}
{ Fibonacci Sequence
{===========================================-}

fib = 1 : 1 : [a + b | (a, b) <- zip fib (tail fib)]

-- 1, 1, 2, 3, 5, 8 .....

-- 1st: fib = 1; (tail fib) = 1
-- [1,1,2] : a: 1 + b: 1 = 2
--
-- 2nd: fib = 1; (tail fib) = 2
-- [1,1,2,3]: a : 1 + b: 2 = 3

fib300 = fib !! 300

fibFirst20 = take 20 fib
