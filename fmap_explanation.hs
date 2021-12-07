
-- ----------------------------------------------
-- Lecture 13
-- ----------------------------------------------

-- :t fmap
-- >> fmap :: Functor f => (a -> b) -> f a -> f b
--
-- fmap (+10) (Just 4)
-- >> Just 14
--
--
-- :t (fmap . fmap)
-- >> (fmap . fmap) :: (Functor f1, Functor f2) => (a -> b) -> f1 (f2 a) -> f1 (f2 b)
--
-- (fmap . fmap) (+10) [(Just 4), (Just 8)]
-- >> [Just 14, Just 18]
--
-- ---------------------------------
-- -- Slide no. 9 --
-- -- Explanation of `(fmap . fmap)`
-- ---------------------------------
--
-- Let's use different letters for clarity
--
-- rewriting `fmap` type definition using different letters:
--
-- fmap :: Functor f => (m -> n) -> f m -> f n   // <- fmap where functor is named `f`
-- fmap :: Functor g => (x -> y) -> g x -> g y   // <- fmap where functor is named `g`
--
-- Let (fmap . fmap) mean 
--      ( (fmap where functor is named `g`) . (fmap where functor is named `f`) )
--
-- (.) :: (b -> c) -> (a -> b) -> a -> c     // <- type definition of `(.)`
--
-- so then `(b -> c)` is matched with `(fmap where functor is named `g`)`
--      where `b` becomes `(x -> y)`
--      and `c` becomes `g x -> g y`
--
-- and `(a -> b)` is matched with `(fmap where functor is named `f`)`
--      where `a` becomes `(m -> n)`
--      and `b` becomes `f m -> f n`  
--
-- Here is the flow of function composition:
--  firstly, (a -> b) function takes `a` and returns `b`, where `b` is `f m -> f n`
--  then, (b -> c) function takes `b`, where `b`, being `(x -> y)`, is matched with `f m -> f n`, such that `x` := `f m`, `y` := `f n`
--      and returns `c`, which is `g x -> g y`, or `g (f m) -> g (f n)`
--
-- And in the last part, `a -> c`, of the definition of (.),
--      `a` becomes `(m -> n)`
--      and `c` becomes `g x -> g y`, or `g (f m) -> g (f n)`
--
-- 
-- So `(fmap . fmap)` now means a function which takes in `(m -> n)` and returns `g (f m) -> g (f n)`
--                  or, using different letters: takes in `(a -> b)` and returns `f1 (f2 a) -> f1 (f2 b)`
-- 
-- Which coincides with the type def. of `(fmap . fmap)`:
--
-- :t (fmap . fmap)
-- >> (fmap . fmap) :: (Functor f1, Functor f2) => (a -> b) -> f1 (f2 a) -> f1 (f2 b)
-----------------------------------------
