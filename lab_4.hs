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
