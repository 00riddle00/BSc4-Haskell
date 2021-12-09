module Lecture_13
where

f x = lookup x [ (3, "hello"), (4, "julie")]
g y = lookup y [ (7, "sup?"), (8, "chris")]

-----------------------------------------
-- (++) <$> f 3 <*> g 7
-- >> Just "hellosup?"
--
-- :t (++) <$> f 3 <*> g 7
-- >> (++) <$> f 3 <*> g 7 :: Maybe [Char]
--
-- :t (++) <$> f 3
-- >> (++) <$> f 3 :: Maybe ([Char] -> [Char])
--                    ^
--                    |_ Just ("hello" ++)
--
-- Just ("hello" ++) :: Maybe ([Char] -> [Char])
--
--
-- Just ("hello" ++) <*> g 7
-- >> Just "hellosup?"
--
-- Just ("hello" ++) <*> Just "sup?"
-- >> Just "hellosup?"
--
-----------------------------------------

-----------------------------------------
-- Using `join`, `bind` can be simply defined as
-- (>>=) f x = join (fmap f x)
--
--
-- :t (>>=)
-- >> (>>=) :: Monad m => m a -> (a -> m b) -> m b
--
-- (>>=) f x = join (fmap f x)
-- :t (>>=)
-- (>>=) :: Monad m => (a -> m b) -> m a -> m b
--
-- To match (>>=) type definition, we can instead define it like this:
-- (>>=) x f = join (fmap f x)
--
-- :t (>>=)
-- >> (>>=) :: Monad m => m a -> (a -> m b) -> m b
--
-- (p.s. a will be displayed as a1, b as b2)
-----------------------------------------
