module Main where

class YesNo a where
  yesno :: a -> Bool

data Tree a = EmptyTree | Node a deriving Show

instance YesNo (Maybe a) where
  yesno (Just _) = True
  yesno Nothing = False

instance YesNo (Tree a) where
  yesno (Node _) = True
  yesno EmptyTree = False

main :: IO ()
main = do
  print $ yesno Nothing
