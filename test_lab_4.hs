
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

