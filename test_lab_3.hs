-- ----------------------------------------------
-- Exercise 1
-- ----------------------------------------------

-- True:
overlaps (Rectangle 1 1 (1,1)) (Rectangle 1 1 (1,1))
-- True:
overlaps (Rectangle 10 10 (5,5)) (Rectangle 5 10 (10,2.5))
-- False: (do not overlaps, just touch each other at the corner)
overlaps (Rectangle 2 2 (3,1)) (Rectangle 2 2 (1,3))
-- False: (do not overlaps, just touch each other at the side)
overlaps (Rectangle 2 2 (3,1)) (Rectangle 2 2 (1,1))

-- True:
overlaps (Circle 1 (1,1)) (Circle 1 (1,1))
-- False: (do not overlaps, just touch each other)
overlaps (Circle 30 ((-10),8)) (Circle 10 (14,(-24)))

-- True:
overlaps (Rectangle 3 2 (2,1.5)) (Circle 2 (0,0))
-- True:
overlaps (Circle 2 (5,4)) (Rectangle 4 10 (6,1))
-- False:
overlaps (Rectangle 3 2 (4,4.5)) (Circle 1 (1,1))
-- False: (do not overlaps, just touch each other)
overlaps (Rectangle 2 2 (1,1)) (Circle 1 (3,1))
-- False: (do not overlaps, just touch each other)
overlaps (Rectangle 2 2 (2,0)) (Circle 1 (0,0))

