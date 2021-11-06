-- ----------------------------------------------
-- Lab_3 exercise 3
-- ----------------------------------------------

unzip1 [(1,4),(2,5),(3,6)]
-- output: ([1,2,3],[4,5,6])

unzip1 :: [(a, b)] -> ([a], [b])
unzip1 xys = foldr (\(x,y) (xs,ys) -> (x:xs, y:ys)) ([],[]) xys
 
--foldr :: Foldable t => (a -> b -> b) -> b -> t a -> b

-- foldr needs a function of type (a -> b -> b)

-- lambda fn is of type:
fn :: (a,b) -> ([a],[b]) -> ([a],[b])
-- so a := (a,b)
--    b := ([a],[b])

-- concrete values:
--         a         b           b
--       (1,4) -> ([],[]) -> ([1],[4])        -- fn 1st run
--
--         a         b           b
--       (2,5) -> ([1],[4]) -> ([1,2],[4,5])  -- fn 2nd run


-- foldr needs arguments 'b' and 't a' (ie. list of 'a')
-- so b := ([a],[b])
--  t a := [(a, b)]

-- foldr result is 'b', and b is already ([a],[b])

-- Concrete values:
--
--    b := ([],[])               -- 1st arg
--  t a := [(1,4),(2,5),(3,6)]   -- 2nd arg
--    b := ([1,2,3],[4,5,6])     -- result

--    b         a          b
-- ([],[]) -> (1,4) -> ([1],[4])               -- foldr 1st iter

--     b          a           b
-- ([1],[4]) -> (2,5) -> ([1,2],[4,5])         -- foldr 2nd iter

--       b            a              b
-- ([1,2],[4,5]) -> (3,6) -> ([1,2,3],[4,5,6]) -- foldr 3rd iter

