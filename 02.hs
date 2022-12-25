{-

Algebraic Data Types

In general, they take the format

data AlgDataType = Constr1 Type11 Typ12
                 | Constr2 Type21
                 | Constr3 Type21
                 | Constr4

You can also add
    deriving Show
to get ghci to actually name the variants with strings
-}

data FailablePerson = Person String Int
                    | Failure

ex01 = Person "Joseph" 21
ex02 = Failure

ageOrZero :: FailablePerson -> Int
ageOrZero Failure = 0
ageOrZero (Person _ age) = age


data Dog = Dog String Int
    deriving Show

-- you can keep the entire term (without having to reconstruct) with the syntax
-- sugar d@(Dog name age) for any pattern matching application
baz :: Dog -> String
baz d@(Dog name _) = "The name of (" ++ show d ++ ") is " ++ name


-- morally, Int and Char were defined by
--     data Int = 0 | 1 | -1 | 2 | -2 | ...
--     data Char = 'a' | 'b' | 'c' | ...
-- in the sense that we can think of each literal value as a constructor with
-- no arguments


-- Case Expressions

{-
case exp of
    pat1 -> exp1
    pat2 -> exp2
-}

-- Remark: functions use syntax which is considered to be syntax sugar for
-- case expressions. Alternatively, we could write
ageOrZero' :: FailablePerson -> Int
ageOrZero' x = case x of
    Failure        -> 0
    (Person _ age) -> age


-- Recursive Data Types

-- e.g., list
data IntList = Empty | Cons Int IntList
intListProd :: IntList -> Int
intListProd Empty      = 1
intListProd (Cons x l) = x * intListProd l

-- e.g., binary tree
data Tree = Leaf Int
          | Node Tree Int Tree

tree :: Tree
tree = Node (Leaf 1) 2 (Node (Leaf 3) 4 (Leaf 5))
