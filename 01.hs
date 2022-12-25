x :: Int -- machine integer
x = 3

y :: Integer -- actual integer (bound by memory lol)
y = 2^(2^(2^(2^2)))

{-
	Other types inlcude
		Double, Float, Bool, Char
		String (special syntax for list of characters)
-}

-- put ticks to do infix notation
ex01 = mod 19 3
ex02 = 19 `mod` 3

-- need parentheses around negative
ex03 = (-3) * (-7)

-- need to cast integers to do division
ex04 = fromIntegral(3) / fromIntegral(7)

-- integer division
ex05 = 12 `div` 5

-- Boolean logic
ex06 = not(False || (True && True))

-- Equality
ex07 = ('a' == 'a')
-- Not equal
ex08 = (16 /= 3)
-- Lexicographic ordering
ex09 = "Haskell" > "C++"



-- Basic Functions

-- example
-- clauses are matched from top to bottom
sumtorial :: Integer -> Integer
sumtorial 0 = 0
sumtorial n = n + sumtorial (n-1)

-- a clause can have __guards__ to do cases
-- (this is the Collatz conjecture sequence)
hailstone :: Integer -> Integer
hailstone n
    | n `mod` 2 == 0 = n `div` 2
    | otherwise      = 3*n + 1

-- another example
foo :: Integer -> Integer
foo 0 = 16
foo 1
    | "Haskell" > "C++" = 3
    | otherwise         = 4
foo n
    | n < 0             = 0
    | n `mod` 17 == 2   = -43
    | otherwise         = n + 3

-- other examples
isEven :: Integer -> Bool
isEven n
    | n `mod` 2 == 0 = True
    | otherwise      = False

isEven2 :: Integer -> Bool
isEven2 n = n `mod` 2 == 0


-- Pairs --

-- the notation (x,y) is used for type AND value of pair
p :: (Int, Char)
p = (3, 'x')

-- extract elements with pattern matching
sumPair :: (Int, Int) -> Int
sumPair (x,y) = x + y


-- Functions of multiple arguments

-- Use Currying!
f :: Int -> Int -> Int -> Int
f x y z = x + y + z
ex10 = f 3 17 8

-- Function application has higher precedence than infix operators, so
-- f 3 n+1 7 is parsed as (f 3 n) + (1 7)
-- need to write f 3 (n+1) 7


-- Lists

-- e.g.,
nums, range, range2 :: [Integer]
nums   = [1,2,3,19]
range  = [1..100]
range2 = [2,4..100]

-- String = [Char], String literal syntax is abbreviation

emptyList = []
ex11 = 1 : [] -- same as [1]
ex12 = 3 : (1 : []) -- same as [3, 1]
ex13 = [2,3,4] == 2 : 3 : 4 : [] -- True

-- these are __singly linked lists__, NOT arrays

-- creating lists
-- ranges
ex14 = [1..20]
ex15 = [2,4..20]
ex16 = ['a'..'z']

-- array functions
-- length
-- null - check empty
-- reverse
-- take n list - takes first n elements
-- drop - backwards take
-- elem tells if thing is an element
ex17 = 4 `elem` [3,4,5,6] -- True

ex18 = take 11 (cycle "LOL ") -- "LOL LOL LOL"
ex19 = take 4 (repeat 5) -- [5, 5, 5, 5]
ex20 = replicate 4 5 -- [5, 5, 5, 5]


-- List Comprehension
-- [expression of x | x from lists, predicates]
ex21 = [x*2 | x <- [1..5]] -- [2,4,6,8,10]
ex22 = [x*2 | x <- [1..10], x*2 >= 12, x /= 7]
ex23 = [x*y | x <- [2,5,10], y <- [8,10,11]]



-- e.g. functions returning lists
hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

-- functions on lists
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (x:xs) = 1 + intListLength xs

-- e.g.,
sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo []         = []
sumEveryTwo (x:[])     = [x]
sumEveryTwo (x:(y:zs)) = (x+y) : sumEveryTwo zs

-- combining functions/lazy evaluations
hailstoneLen :: Integer -> Integer
hailstoneLen n = intListLength (hailstoneSeq n) - 1


-- zip / enumerate
ex24 = zip [1..] ["apple", "orange", "cherry", "mango"]