module Main where

-- import Data.Char
-- import Data.Functor

data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving (Show)

singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) =>  a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
  | x == a = Node a left right
  | x < a = Node a (treeInsert x left) right
  | otherwise = Node a left (treeInsert x right)

instance Functor Tree where
  fmap _ EmptyTree = EmptyTree
  fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

main :: IO ()
main = do
  let nums = [8, 6, 4, 1, 7, 3, 5]::[Int]
  let tree = foldr treeInsert EmptyTree nums
  print $ fmap (*2) tree
