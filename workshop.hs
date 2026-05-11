-- Ignore this line, it just lets me redefine existing functions
import Prelude hiding (sum, map, String)

sum :: [Int] -> Int
sum [] = 0
sum (x:xs) = x + sum xs

{-
Map function:

map :: (a -> b) -> [a] -> [b]
map f [] = undefined
map f (x:xs) = undefined

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : undefined
-}

map :: (a -> b) -> [a] -> [b]
map f [] = []
map f (x:xs) = f x : map f xs

{-
removeLast function:

removeLast :: [a] -> [a]
removeLast [x] = undefined
removeLast (x:xs) = undefined

If x is the only element in the list, removing the last element will remove x
removeLast :: [a] -> [a]
removeLast [x] = []
removeLast (x:xs) = undefined

In the second case, we know there are at least 2 elements and x is the first element.
So we know to keep the first element in the new list. 
removeLast :: [a] -> [a]
removeLast [x] = []
removeLast (x:xs) = x : undefined

Note that if the cases were swapped, i.e. (x:xs) on top, that would match every list
with at least 1 element (since xs can be empty). Which would mean the removelast [x] case would never
run. 

removeLast :: [a] -> [a]
removeLast [x] = []
removeLast (x:xs) = x : removeLast xs
-}

removeLast :: [a] -> [a]
removeLast [_] = []
removeLast (x:xs) = x : removeLast xs

-----------------------------------------

-- type Name = Type
-- will "rename" / "alias" Type to be Name, letting you use them interchangably

type String = [Char]

-- They are used to convey more meaning in types
type R2 = (Float, Float)

-- E.g. A function returning (Float, Float) may be returning 2 general floats
-- but a function returning R2 is returning a point on the 2D plane. 

-- Type definitions can also include arguments
type Matrix a = [[a]]
-- E.g. `Matrix Int` will become `[[Int]]`, `Matrix String` will become `[[String]]`