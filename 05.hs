
-- this polymorphism is called __parametric__ polymorphism
-- as in, when applying a function, the type of the
-- function is bound by the inputted term???

-- "the caller gets to choose the type"



-- some neat things!!

-- the only maps of the type a -> a are
f1 :: a -> a
f1 x = x

-- there are NO functions of type f2 :: a -> b

-- only options
f2 :: a -> b -> a
f2 x y = x

f3 :: [a] -> [a]
f3 xs = xs



-- Type classes

-- just like traits in rust, except even better!
-- can do pairs of types rather than just a single type
-- to do binary operations and stuff

-- e.g.,

-- type class, type variable, "where", and then
-- required functions
class Listable a where
    toList :: a -> [Int]

-- now we can implement the type class for some guys
instance Listable Int where
    toList x = [x]

instance Listable Bool where
    toList True  = [1]
    toList False = [0]

instance Listable [Int] where
    toList = id

-- e.g., turning tree into list
data Tree a = Empty | Node a (Tree a) (Tree a)

instance Listable (Tree Int) where
    toList Empty = []
    toList (Node x l r) = toList l ++ [x] ++ toList r


-- now let's define some functions for Listable

sumL :: Listable a => a -> Int
sumL x = sum (toList x)

-- cool example

instance (Listable a, Listable b) => Listable (a,b) where
    toList (x,y) = toList x ++ toList y



-- now let's try doing pairwise stuff
-- hmm maybe I'm not ready yet, idk if this makes sense
-- or is good practice
class Fightable a b where
    winsFight :: a -> b -> Bool


data Dog = GoodDog
data Cat = GoodCat

instance Fightable Dog Cat where
    winsFight _ _ = True
