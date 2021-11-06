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

-- ----------------------------------------------
-- Exercise 2
-- ----------------------------------------------

-- False:
any (<2) []
any1 (<2) []
any2 (<2) []

-- True:
any (<2) [1,2,3]
any1 (<2) [1,2,3]
any2 (<2) [1,2,3]

-- True:
any (1==) [0,1,2,3,4,5]
any1 (1==) [0,1,2,3,4,5]
any2 (1==) [0,1,2,3,4,5]

-- False:
any (>5) [0,1,2,3,4,5]
any1 (>5) [0,1,2,3,4,5]
any2 (>5) [0,1,2,3,4,5]

-- False:
any even [1,3,5,7,9]
any1 even [1,3,5,7,9]
any2 even [1,3,5,7,9]

-- True:
any (\x -> x*4>20) [1,2,3,4,5,6]
any1 (\x -> x*4>20) [1,2,3,4,5,6]
any2 (\x -> x*4>20) [1,2,3,4,5,6]

-- -------------------------

-- True:
all (<10) []
all1 (<10) []
all2 (<10) []

-- True:
all (<10) [1,3,5,7,9]
all1 (<10) [1,3,5,7,9]
all2 (<10) [1,3,5,7,9]

-- False:
all (==1) [1,1,0,1,1]
all1 (==1) [1,1,0,1,1]
all2 (==1) [1,1,0,1,1]

-- True:
all even [2,4,6,8,10]
all1 even [2,4,6,8,10]
all2 even [2,4,6,8,10]

-- False:
all (\x -> (x*x)/4 > 10) [5,10,15]
all1 (\x -> (x*x)/4 > 10) [5,10,15]
all2 (\x -> (x*x)/4 > 10) [5,10,15]

-- ----------------------------------------------
-- Exercise 3
-- ----------------------------------------------

---- out> ([],[]):
unzip []
unzip1 []

-- out> ([1],[2]):
unzip [(1,2)]
unzip1 [(1,2)]

-- out> ([1,2,3],[4,5,6]):
unzip [(1,4),(2,5),(3,6)]
unzip1 [(1,4),(2,5),(3,6)]

-- out> ([1,2,3],["a","b","c"]):
unzip [(1,"a"),(2,"b"),(3,"c")]
unzip1 [(1,"a"),(2,"b"),(3,"c")]

-- ----------------------------------------------
-- Exercise 4
-- ----------------------------------------------

-- out> 0:
length []
length1 []
length2 []

-- out> 3:
length [1,2,3]
length1 [1,2,3]
length2 [1,2,3]

-- out> 5:
length "Hello"
length1 "Hello"
length2 "Hello"

-- ----------------------------------------------
-- Exercise 5
-- ----------------------------------------------

-----------------------
-- ff.py
-----------------------
{-
#!/usr/bin/env python

def ff(max, xs):
    xs = [x for x in xs if x >= 0]
    xs = [x*10 for x in xs]

    sum = 0

    for x in xs:
        tmp = x + sum

        if tmp > max:
            break

        sum = tmp

    return sum

print(ff(1, []))                    # = 0
print(ff(0, [1,2,3]))               # = 0
print(ff(10, [-1,-2,-3]))           # = 0
print(ff(5, [1,2,3]))               # = 0
print(ff(10, [1,2,3]))              # = 10
print(ff(30, [0,2,-4,6,-8]))        # = 20
print(ff(100, [1,2,-4,6]))          # = 90
print(ff(500, [9,8,7,6,5,4,3,2,1])) # = 450
-}

--out> 0:
ff 1 []

--out> 0:
ff 0 [1,2,3]

-- out> 0:
ff 10 [-1,-2,-3]

-- out> 0:
ff 5 [1,2,3]

-- out> 10:
ff 10 [1,2,3]

-- out> 20:
ff 30 [0,2,-4,6,-8]

-- out> 90:
ff 100 [1,2,-4,6]

-- out> 450:
ff 500 [9,8,7,6,5,4,3,2,1]

-- ----------------------------------------------
-- Exercise 6
-- ----------------------------------------------

-- out> 0:
total (\x -> 2*x) 0

-- out> 110:
total (\x -> 2*x) 10

