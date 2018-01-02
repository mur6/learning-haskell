module Main where

class MyEq a where
  equals :: a -> a -> Bool

data MyValue = W Double deriving Show

instance MyEq MyValue where
  equals (W x) (W y) =  x == y

t2 :: [Char]
t2 = show $ W(2.2) `equals` W(2.2)

test3 :: IO ()
test3 = do
  _ <- putStrLn "Hello, what's your name?"
  let tmp = getLine
  name <- tmp
  _ <- putStrLn $ "Zis is your future: " ++ name
  return ()

main :: IO ()
main = do
  -- putStrLn $ t2
  test3
