-- Ignore this line, it just lets me redefine existing functions
import Prelude hiding (sum, map, String, Bool, Maybe, True, False)
import System.IO -- Ignore this import, it just prevents problems if you compile this file

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
You can also define map without recursion, instead using list comprehension.

map' :: (a -> b) -> [a] -> [b]
map' f xs = []

You can use `| x <- xs` to extract each element x from the list xs
map' :: (a -> b) -> [a] -> [b]
map' f xs = [undefined | x <- xs]

The part to the left of the | guard is what is put in the list (for each element x in the original list).
So we apply the function to each x
-}

map' :: (a -> b) -> [a] -> [b]
map' f xs = [f x | x <- xs]

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


-- You can also create your own brand new data types using `data`. 

-- You seperate the "constructors" by | 
data Bool = False | True

-- You can then pattern match the "constructors" of your new type
not :: Bool -> Bool
not True = False
not False = True

-- Constructors can also have parameters
data Shape = Circle Float | Rect Float Float

square :: Float -> Shape
square n = Rect n n

-- Data declerations can also be paramterised
data Maybe a = Nothing | Just a

-- They can also be recursive
data Tree a = Leaf a | Node [Tree a] -- General tree with any number of nodes
data BTree a = BLeaf a | BNode (BTree a) (BTree a) | Null -- Binary tree

------------------------------------------------------------------------------

{-
`IO a` is the type for "impure actions" (things that have side effects) that return type a.

`return :: a -> IO a` lets you go from "pure" to "impure" (used if you need to return IO a but only have type a)
`getLine :: IO String` gets input from the user
`putStr` and `putStrLn :: String -> IO ()` lets you print text to the screen


To write "interactive" programs, the return type must finish with IO type and use "do notation".
For example, hello world
-}
helloWorld :: IO ()
helloWorld = do
    putStrLn "Hello, World!"

-- Use `variable <- IO function` notation to "unwrap" the value out of IO
-- So `name <- getLine` will make `name` String
main :: IO ()
main = do
    -- Ignore this line, it just prevents problems if you compile this file
    hSetBuffering stdout NoBuffering

    putStr "What is your name? "
    name <- getLine
    putStr "Hello "
    putStrLn name
