
-- Anonymous/Lambda Functions

greaterThan100 = \x -> x > 100

lst1 = filter greaterThan100 [1,2,101,102]


-- Operator section
-- if ? is an operator (e.g., + :: Int -> Int -> Int),
-- then ?y is equivalent to the function \x -> x ? y
-- and y? equivalent to \x -> y ? x

-- you can do previous example even shorter with this!!
lst2 = filter (>100) [1,2,101,102]


-- Function composition
composition :: (b -> c) -> (a -> b) -> a -> c
composition g f x = g (f x)

-- this function is already defined! has the name (.),
-- e.g.,
filterItGood :: [Integer] -> [Integer]
filterItGood = filter even . filter (>100)
-- filters until only >100 and even

-- could also do
filterItGood2 :: [Integer] -> [Integer]
filterItGood2 = filter (\x -> even x && x > 100)



-- Currying and Uncurrying
curry2 :: ((a, b) -> c) -> a -> b -> c
curry2 f x y = f (x,y)

uncurry2 :: (a -> b -> c) -> (a,b) -> c
uncurry2 f (x,y) = f x y

-- implemented in the std lib as curry and uncurry


-- Folds
-- starting value b
-- function of a and b outputting b
-- list [a]
-- called foldl in std lib
foldLeft :: b -> (a -> b -> b) -> [a] -> b
foldLeft start accum [] = start
foldLeft start accum (x: xs) = foldLeft (accum x start) accum xs

-- called foldr in std lib
foldRight :: b -> (a -> b -> b) -> [a] -> b
foldRight start accum [] = start
foldRight start accum (x: xs) = accum x (foldRight start accum xs)