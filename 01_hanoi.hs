-- type synonyms, exactly the same types
type Peg = String
type Move = (Peg, Peg)

-- Given the number of discs and names for the
-- three pegs, `hanoi` should return a list of moves
-- the stack of discs from the first peg to the second

-- e.g.,
-- hanoi 2 "a" "b" "c" == [("a","c"), ("a","b"), ("c","b")]

hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 a b c = []
-- moving n from a to b is the same process as moving
-- (n-1) from a to c, moving the bottom to b, then moving
-- (n-1) from c to b
hanoi n a b c = hanoi (n-1) a c b ++ [(a, b)] ++ hanoi (n-1) c b a

hanoi3 :: Integer -> [Move]
hanoi3 n = hanoi n "a" "b" "c"