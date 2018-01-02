module Main where

import Data.Char
-- import Data.Functor

data Tree a = EmptyTree | Node a (Tree a) (Tree a)
  deriving (Show)

sg :: a -> Tree a
sg x = Node x EmptyTree EmptyTree

treeInsert :: (Ord a) =>  a -> Tree a -> Tree a
treeInsert x EmptyTree = sg x
treeInsert x (Node a left right)
  | x == a = Node a left right
  | x < a = Node a (treeInsert x left) right
  | otherwise = Node a left (treeInsert x right)

threeNodeTree :: [a] -> Tree a
threeNodeTree str = Node (str!!0) (sg $ str!!1) (sg $ str!!2)

instance Functor Tree where
  fmap _ EmptyTree = EmptyTree
  fmap f (Node x left right) = Node (f x) (fmap f left) (fmap f right)

main :: IO ()
main = do
  -- let ll = Node 'L' (sg 'N') (sg 'T')
  -- let yy = Node 'Y' (sg 'S') (sg 'A')
  let t1 = Node 'O' (threeNodeTree "LNT") (threeNodeTree "YSA")
  let t2 = Node 'L' (threeNodeTree "WCR") (threeNodeTree "AAC")
  let freeTree = Node 'P' t1 t2
  -- let nums = [8, 6, 4, 1, 7, 3, 5]::[Int]
  -- let tree = foldr treeInsert EmptyTree nums
  print $ fmap toLower freeTree
