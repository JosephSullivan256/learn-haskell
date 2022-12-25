import Data.List (foldl')

-- create a fast/space efficient Fibonacci sequence
-- (normal implementation is very slow)

-- should use foldl' to keep the thunk small
-- thunk = unevaluated expression

-- to avoid repeat computations, we should build
-- a list of Fibonacci numbers which is evaluated via
-- foldl', to achieve dynamic programming

expandFib :: [Integer] -> [Integer]
expandFib lst@(x:y:ys) = (x + y):lst
expandFib [0] = [1,0]
expandFib _ = [0]

fibLst :: Int -> [Integer]
fibLst n = foldl' (\newList _ -> expandFib newList) [] (replicate (n+1) 0)

fib :: Int -> Integer
fib n = case fibLst n of
    x:xs -> x
    [] -> 0

badFib :: Int -> Integer
badFib 0 = 0
badFib 1 = 1
badFib n = badFib (n-1) + badFib (n-2)


-- the "good" fib is so much better than badFib. `fib` can handle 100,000
-- with ease, `badFib` gets stuck at 40 :))

-- TODO: how to implement using seq? is my approach clunky?