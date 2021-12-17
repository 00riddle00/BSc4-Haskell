-- @Tomas Giedraitis
-- Exercise set 4

{-# LANGUAGE GADTs #-}

module Lab_4
where

-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

data GTree a = Leaf a | Gnode [GTree a]
    deriving (Eq, Show)

depth :: GTree a -> Integer
depth (Leaf _) = 1
depth (Gnode ts) = 1 + maximum (map depth ts)

occurs :: Eq a => a -> GTree a -> Bool
occurs e (Leaf x) = e == x
occurs e (Gnode ts) = any (==True) (map (occurs e) ts)

mapTree :: (a -> b) -> GTree a -> GTree b
mapTree f (Leaf x) = Leaf (f x)
mapTree f (Gnode ts) = Gnode (map (mapTree f) ts)

-- ----------------------------------------------
-- Exercise 2
-- ----------------------------------------------

data Expr a = Lit a | EVar Var | Op (Ops a) [Expr a]
type Ops a = [a] -> a
type Var = Char

instance Show (Expr a) where
    show (Lit a) = "literal"
    show (EVar a) = "var:" ++ show a
    show (Op fn xs) = "Op fn " ++ show xs

-- function on operands
fsum :: Ops Integer
fsum xs = sum xs

-- -------------------------
-- Ex.2 Solution No.1
-- -------------------------

type Valuation a = (Var -> a)

eval :: Valuation a -> Expr a -> a
eval _ (Lit x) = x
eval fval (EVar var) = fval var

eval _ (Op fn []) = error ("no expression given!")
eval fval (Op fn es) = fn (map (eval fval) es)

-- valuation functions
fval0, fval1 :: Valuation Integer

fval0 var = 0

fval1 var = case var of 
    'x' -> 1
    'y' -> 2
    'z' -> 3
    _ -> error ("variable " ++ show var ++ " is not initialized!")

-- -------------------------
-- Ex.2 Solution No.2
-- -------------------------

type Valuation' a = [(Var,a)]

eval'' :: Valuation' a -> Expr a -> Maybe a
eval'' [(var,val)] (EVar variable)
      | var == variable = Just val
      | otherwise = Nothing

eval' :: Valuation' a -> Expr a -> a

eval' _ (Lit x) = x

eval' [] (EVar variable) = error ("variable " ++ show variable ++ " is not initialized!")
eval' (v:vs) (EVar variable) =
    case (eval'' [v] (EVar variable)) of
        Nothing -> eval' vs (EVar variable)
        Just x -> x

eval' _ (Op fn []) = error ("no expression given!")
eval' vs (Op fn es) = fn (map (eval' vs) es)

-- ----------------------------------------------
-- Exercise 3
-- ----------------------------------------------

type RegExp = String -> Bool

-- empty string
epsilon :: RegExp
epsilon = (=="")

-- any single character
char :: Char -> RegExp
char ch = (==[ch])

-- either {pattern1} or {pattern2}
(|||) :: RegExp -> RegExp -> RegExp
e1 ||| e2 = \x -> e1 x || e2 x

-- concat: {pattern1}{pattern2}
(<<*>>) :: RegExp -> RegExp -> RegExp
e1 <<*>> e2 = \x ->
    or [e1 y && e2 z | (y,z) <- splits x]
    where
        -- returns all the ways a string can be split into two
        splits :: String -> [(String,String)]
        splits str = map (\x -> ((take x str),(drop x str)) ) [0..length (str)]

-- 0 or 1 occurrences of {pattern}
option :: RegExp -> RegExp
option p = epsilon ||| p

-- 1 or more occurrences of {pattern}
plus :: RegExp -> RegExp
plus p = (p <<*>> star p)

-- repeating {pattern} zero or more times
star :: RegExp -> RegExp
star p = epsilon ||| (plus p)

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

-- -------------------------
-- Ex.4 Solution No.1
-- -------------------------

data NumList a = Nlist [a]

instance (Fractional a, Eq a) => Eq (NumList a) where
    Nlist xs == Nlist ys = (average xs) == (average ys)

instance (Fractional a, Ord a) => Ord (NumList a) where
    (Nlist xs) `compare` (Nlist ys) = (average xs) `compare` (average ys)

average :: Fractional a => [a] -> a
average [] = 0
average xs = (sum xs) / (fromIntegral (length xs))

-- -------------------------
-- Ex.4 Solution No.2
-- -------------------------

-- Using GADTs
data NumList' a where
    Nlist' :: Real a => [a] -> NumList' [a]

instance Eq a => Eq (NumList' a) where
    Nlist' xs == Nlist' ys = (average' xs) == (average' ys)

instance Ord a => Ord (NumList' a) where
    (Nlist' xs) `compare` (Nlist' ys) = (average' xs) `compare` (average' ys)

average' :: (Real a, Fractional b) => [a] -> b
average' [] = 0
average' xs = realToFrac (sum xs) / (fromIntegral (length xs))

-- ----------------------------------------------
-- Exercise 5
-- ----------------------------------------------

data Result a = OK a | Error String
    deriving (Show)

instance Semigroup a => Semigroup (Result a) where
    (Error errmsg) <> _ = (Error errmsg)
    _ <> (Error errmsg) = (Error errmsg)
    OK m1 <> OK m2 = OK (m1 <> m2)

instance Monoid a => Monoid (Result a) where
    mempty = Error ""
  
instance Functor Result where
  fmap _ (Error errmsg) = (Error errmsg)
  fmap g (OK x) = OK (g x)

instance Applicative Result where
    pure = OK
    (Error errmsg) <*> _ = (Error errmsg)
    _ <*> (Error errmsg) = (Error errmsg)
    OK f <*> OK a = OK (f a)

instance Monad Result where
    return x = OK x  
    (Error errmsg) >>= f  = (Error errmsg)
    OK x >>= f = f x

composeResult :: (a -> Result b) -> (b -> Result c) -> (a -> Result c)
composeResult f g x = f x >>= g

err1 :: Float -> Result Integer
err1 val 
   | val < 0 = Error "The nearest int is negative!"
   | otherwise = OK (round(val))
  
err2 :: Integer -> Result String
err2 val 
   | (val `mod` 2) > 0 = Error "The nearest int is odd!"
   | otherwise = OK "Success: The nearest int is even and positive!"

-- ----------------------------------------------
-- Exercise 6
-- ----------------------------------------------

goldbach :: Integer -> Bool
goldbach n = (n==4) || not (null [(x,y) | x <- takeWhile (\x -> x+3 <= n) (sieve [2..]), y <- takeWhile (\y -> x+y <= n) (sieve [x..]), x+y == n]) && goldbach (n-2)
    where
        sieve (x:xs) = x : sieve [y | y <- xs, y `mod` x > 0]

-- ----------------------------------------------
-- Exercise 7
-- ----------------------------------------------

-- infinite data stream
data Stream a = Cons a (Stream a)
    deriving (Show)

-- creates an infinite list out of the given stream
streamtoList :: Stream a -> [a]
streamtoList (Cons x xs) = x:(streamtoList xs)

-- creates a stream for the given iteration function 
-- and the starting stream element (seed)
--
streamIterate :: (a -> a) -> a -> Stream a
streamIterate f x = Cons x (streamIterate f (f x))

-- merges two streams into one so that their elements are
-- interleaved. In other words, for two given streams 
-- <e11, e12, e13, ...> and <e21, e22, e23, ...>, the 
-- result would be the stream <e11, e21, e12, e22, ...>
--
streamInterleave :: Stream a -> Stream a -> Stream a
streamInterleave (Cons x xs) (Cons y ys) = Cons x (Cons y (streamInterleave xs ys))

-----------------------------

-- finite data stream (for testing)
data Stream' a = Empty | Cons' a (Stream' a)
    deriving (Show, Eq)

streamtoList' :: Stream' a -> [a]
streamtoList' Empty = []
streamtoList' (Cons' x xs) = x:(streamtoList' xs)

