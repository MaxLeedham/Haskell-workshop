-- Ignore this line, it just lets me redefine existing functions
import Prelude hiding (map)

{-
First function: map

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