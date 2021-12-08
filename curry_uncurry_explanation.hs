
-- ----------------------------------------------
-- Lecture 8
-- ----------------------------------------------

-- ------------------------
-- curry
-- ------------------------

--curry :: ((a,b) -> c) -> (a -> b -> c)
--curry g x y = g (x,y)

--`g` gets matched with `((a,b) -> c)`
--(`g` is a function which takes in a tuple `(a,b)` and returns `c`)

--So we can imagine it like that:
--(curry g) :: (a -> b -> c)

--Now we pass `x` and `y` to `(curry g)`:
    --`a` matches with `x`
    --`b` matches with `y`

--And we return `g(x,y)`, which is of type `c`, since
    --`g` is a function which takes in a tuple `(a,b)` and returns `c`

--So from now on instead of the expression `g(x,y)` we can use `(curry g) x y`

-- ------------------------
-- uncurry
-- ------------------------

--uncurry :: (a -> b -> c) -> ((a,b) -> c)
--uncurry f (x,y) = f x y

--`f` gets matched with `(a -> b -> c)`
--(`f` is a function which takes in two arguments `a`,`b`, and returns `c`)

--So we can imagine it like that:
--(uncurry f) :: ((a,b) -> c)

--Now we pass a tuple `(x,y)` to `(uncurry f)`:
    --`(a,b)` matches with `(x,y)`

--And we return `f x y`, which of of type `c`, since
    --`f` is a function which takes in two arguments `a`, `b` and returns `c`

--So from now on instead of expression `f x y` we can use `(uncurry f) (x,y)`
    --which is how we are normally used to look at a function with two arguments
