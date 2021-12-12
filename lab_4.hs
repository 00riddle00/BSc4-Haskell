-- @Tomas Giedraitis
-- Exercise set 4

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

