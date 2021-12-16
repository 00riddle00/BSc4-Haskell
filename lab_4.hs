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

fsum :: [Integer] -> Integer
fsum xs = sum xs

data Expr a = Lit a | EVar Var | Op (Ops a) [Expr a]
type Ops a = [a] -> a
type Var = Char

instance Show (Expr a) where
    show (Lit a) = "literal"
    show (EVar a) = "var:" ++ show a
    show (Op fn xs) = "Op fn " ++ show xs

type Valuation a = [(Var,a)]

eval' :: Valuation a -> Expr a -> Maybe a
eval' [(var,val)] (EVar variable)
      | var == variable = Just val
      | otherwise = Nothing

eval :: Valuation a -> Expr a -> a

eval _ (Lit x) = x

eval [] (EVar variable) = error ("variable " ++ show variable ++ " is not initialized!")
eval (v:vs) (EVar variable) =
    case (eval' [v] (EVar variable)) of
        Nothing -> eval vs (EVar variable)
        Just x -> x

eval vs (Op fn es) = fn (map (eval vs) es)

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

data NumList a where
    Nlist :: Real a => [a] -> NumList [a]

instance Eq a => Eq (NumList a) where
    Nlist xs == Nlist ys = (average xs) == (average ys)

instance Ord a => Ord (NumList a) where
    (Nlist xs) `compare` (Nlist ys) = (average xs) `compare` (average ys)

average :: (Real a, Fractional b) => [a] -> b
average [] = 0
average xs = realToFrac (sum xs) / (fromIntegral (length xs))

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

