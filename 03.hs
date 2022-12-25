
-- Polymorphic data types

-- type parameter lower case
-- (type upper case, variants upper case)
data List t = Empty | Cons t (List t)

lst1 :: List Int
lst1 = Cons 3 (Cons 5 (Cons 2 Empty))


-- Polymorphic functions

-- some examples
-- remember that the "|" are clauses
filterList :: (t -> Bool) -> List t -> List t
filterList _ Empty = Empty
filterList p (Cons x xs)
    | p x       = Cons x (filterList p xs)
    | otherwise = filterList p xs

mapList :: (a -> b) -> List a -> List b
mapList _ Empty = Empty
mapList f (Cons x xs) = Cons (f x) (mapList f xs)



-- Prelude

-- data Maybe a = Nothing | Just a

-- you should get guarantees in your types!!
-- want a nonempty list? just make a type!!

data NonEmptyList a = NEL a [a]

nelToList :: NonEmptyList a -> [a]
nelToList (NEL x xs) = x:xs

listToNel :: [a] -> Maybe (NonEmptyList a)
listToNel []     = Nothing
listToNel (x:xs) = Just $ NEL x xs

headNEL :: NonEmptyList a -> a
headNEL (NEL a _) = a

tailNEL :: NonEmptyList a -> [a]
tailNEL (NEL _ as) = as