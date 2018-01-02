module Main where

class MyEq a where
  equals :: a -> a -> Bool

data MyValue = W Double deriving Show

instance MyEq MyValue where
  equals (W x) (W y) =  x == y

t2 :: [Char]
t2 = show $ W(2.2) `equals` W(2.2)

main :: IO ()
main = do
  putStrLn $ t2
