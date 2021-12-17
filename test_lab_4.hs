
-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

depth (Leaf 1) == 1
depth (Gnode [(Leaf 1)]) == 2
depth (Gnode [(Gnode [(Leaf 1), (Leaf 2)]), Leaf(3)]) == 3

occurs 1 (Leaf 1) == True
occurs 1 (Gnode [(Leaf 1)]) == True
occurs 1 (Gnode [(Gnode [(Leaf 1), (Leaf 2)]), Leaf(3)]) == True
occurs 0 (Gnode [(Gnode [(Leaf 1), (Leaf 2)]), Leaf(3)]) == False
occurs "c" (Gnode [(Gnode [(Leaf "a"), (Leaf "b")]), Leaf("c")]) == True

mapTree (>1) (Leaf 1) == Leaf False
mapTree (+1) (Gnode [(Gnode [(Leaf 1), (Leaf 2)]), Leaf(3)]) == Gnode [Gnode [Leaf 2, Leaf 3], Leaf(4)] 

-- ----------------------------------------------
-- Exercise 2
-- ----------------------------------------------

-- -------------------------
-- show
-- -------------------------

Lit 1
-- literal

EVar 'x'
-- var:'x'

Op fsum []
-- Op fn []

Op fsum [Lit 1, EVar 'x']
-- Op fn [literal,var:'x']

-- -------------------------------------
-- Ex.2 Solution No.1
-- -------------------------------------

-- --------------------------
-- eval (Lit a)
-- --------------------------

eval fval0 (Lit 1) == 1

eval (\x -> 1) (Lit 1) == 1

-- --------------------------
-- eval (EVar Var)
-- --------------------------

eval (\x -> 1) (EVar 'x') == 1

eval fval0 (EVar 'x') == 0

eval fval1 (EVar 'z') == 3

eval fval1 (EVar 'w')
 --Exception: variable 'w' is not initialized

-- --------------------------
-- eval (Op (Ops a) [Expr a])
-- --------------------------

eval (\x -> 1) (Op fsum [])
-- Exception: no expression given!

eval fval0 (Op fsum [])
-- Exception: no expression given!

eval (\x -> 1) (Op fsum [Lit 1]) == 1
eval fval1 (Op fsum [Lit 2]) == 2

eval fval0 (Op fsum [Lit 1, Lit 2]) == 3
eval fval1 (Op fsum [Lit 1, Lit 2, Lit 3]) == 6

eval (\_ -> 2) (Op fsum [Lit 1, EVar 'y', Lit 3]) == 6

eval fval1 (Op fsum [Lit 1, EVar 'w', Lit 3])
-- Exception: variable 'w' is not initialized

eval (\_ -> 2) (Op fsum [Lit 1, EVar 'y', (Op fsum [Lit 1, Lit 2])]) == 6

eval fval1 (Op fsum [Lit 1, EVar 'y', (Op fsum [EVar 'x', EVar 'y', Lit 2])]) == 8

-- -------------------------------------
-- Ex.2 Solution No.2
-- -------------------------------------

-- -------------------------
-- eval' (Lit a)
-- -------------------------

eval' [] (Lit 1) == 1

eval' [('x', 1)] (Lit 2) == 2

-- -------------------------
-- eval' (EVar Var)
-- -------------------------

eval' [] (EVar 'x')
-- Exception: variable 'x' is not initialized

eval' [('x',1)] (EVar 'x') == 1

eval' [('x',1)] (EVar 'y')
-- Exception: variable 'y' is not initialized

eval' [('x',1),('y',2),('z',3)] (EVar 'z') == 3

eval' [('x',1),('y',2),('z',3)] (EVar 'w')
-- Exception: variable 'w' is not initialized

-- -------------------------
-- eval' (Op (Ops a) [Expr a])
-- -------------------------

eval' [] (Op fsum [])
-- Exception: no expression given!

eval' [('x',1)] (Op fsum [])
-- Exception: no expression given!

eval' [] (Op fsum [Lit 1]) == 1
eval' [('x',1)] (Op fsum [Lit 2]) == 2

eval' [] (Op fsum [Lit 1, Lit 2]) == 3
eval' [] (Op fsum [Lit 1, Lit 2, Lit 3]) == 6

eval' [('y',2)] (Op fsum [Lit 1, EVar 'y', Lit 3]) == 6

eval' [('x',1)] (Op fsum [Lit 1, EVar 'y', Lit 3])
-- Exception: variable 'y' is not initialized

eval' [('y',2)] (Op fsum [Lit 1, EVar 'y', (Op fsum [Lit 1, Lit 2])]) == 6

eval' [('x',1),('y',2)] (Op fsum [Lit 1, EVar 'y', (Op fsum [EVar 'x', EVar 'y', Lit 2])]) == 8

-- ----------------------------------------------
-- Exercise 3
-- ----------------------------------------------

(epsilon) "" == True
(epsilon) "x" == False

(char 'x') "x" == True
(char 'x') "xxx" == False

(char 'x' ||| char 'y') "x" == True
(char 'x' ||| char 'y') "y" == True
(char 'x' ||| char 'y') "z" == False

(char 'x' <<*>> (char 'y' ||| char 'z')) "xy" == True
(char 'x' <<*>> (char 'y' ||| char 'z')) "xz" == True
(char 'x' <<*>> (char 'y' ||| char 'z')) "yz" == False
(char 'h' <<*>> char 'e' <<*>> char 'l' <<*>> char 'l' <<*>> char 'o') "hello" == True

option (char 'x') "" == True
option (char 'x') "x" == True
option (char 'x') "xx" == False

plus (char 'x') "x" == True
plus (char 'x') "xx" == True
plus (char 'x') "" == False

star (char 'x') "" == True
star (char 'x') "x" == True
star (char 'x') "xx" == True
star (char 'x') "xxxxxx" == True
star (char 'x') "xxxyxx" == False

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

-- -------------------------------------
-- Ex.4 Solution No.1
-- -------------------------------------

(Nlist [] == Nlist []) == True
(Nlist [1,2,3] == Nlist [1,2,3]) == True
(Nlist [1,2,3] == Nlist [1,3]) == True
(Nlist [1,2,3] == Nlist [2,4]) == False
(Nlist [1,2,3] > Nlist []) == True
(Nlist [1,2,3] > Nlist [0,1,4]) == True
(Nlist [1.5,2.5,3.5] == Nlist [2.1,4.2,6.3]) == False
(Nlist [1.5,2.5,3.5] == Nlist [1.0,2.1,4.4]) == True

-- -------------------------------------
-- Ex.4 Solution No.2
-- -------------------------------------

(Nlist' [] == Nlist' []) == True
(Nlist' [1,2,3] == Nlist' [1,2,3]) == True
(Nlist' [1,2,3] == Nlist' [1,3]) == True
(Nlist' [1,2,3] == Nlist' [2,4]) == False
(Nlist' [1,2,3] > Nlist' []) == True
(Nlist' [1,2,3] > Nlist' [0,1,4]) == True
(Nlist' [1.5,2.5,3.5] == Nlist' [2.1,4.2,6.3]) == False
(Nlist' [1.5,2.5,3.5] == Nlist' [1.0,2.1,4.4]) == True

-- ----------------------------------------------
-- Exercise 5
-- ----------------------------------------------

-- -------------------------------------
-- Ex.5 Solution No.1
-- -------------------------------------

composeResult fres1 fres2 4 
--OK "Success: The nearest int is even and positive!"

composeResult fres1 fres2 (-4)
--Error "The nearest int is negative!"

composeResult fres1 fres2 (-3)
--Error "The nearest int is negative!"

composeResult fres1 fres2 (3)
--Error "The nearest int is odd!"

-- -------------------------------------
-- Ex.5 Solution No.2
-- -------------------------------------

composeResult' fres1 fres2 4 
--OK "Success: The nearest int is even and positive!"

composeResult' fres1 fres2 (-4)
--Error "The nearest int is negative!"

composeResult' fres1 fres2 (-3)
--Error "The nearest int is negative!"

composeResult' fres1 fres2 (3)
--Error "The nearest int is odd!"

-- ----------------------------------------------
-- Exercise 6
-- ----------------------------------------------

goldbach 1000 == True

-- ----------------------------------------------
-- Exercise 7
-- ----------------------------------------------

streamtoList' Empty == []
streamtoList' (Cons' 1 Empty) == [1]
streamtoList' (Cons' 1 (Cons' 2 Empty)) == [1,2]
streamtoList' (Cons' 1 (Cons' 2 (Cons' 3 Empty))) == [1,2,3]

streamIterate (\x -> x+1) (1)

streamInterleave' Empty Empty == Empty
streamInterleave' (Cons' 1 Empty) Empty == (Cons' 1 Empty)
streamInterleave' Empty (Cons' 2 Empty) == (Cons' 2 Empty)
streamInterleave' (Cons' 1 (Cons' 2 Empty)) (Cons' 3 (Cons' 4 Empty)) == (Cons' 1 (Cons' 3 (Cons' 2 (Cons' 4 Empty))))

