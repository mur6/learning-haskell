module Main where

import Data.List (group)

rle :: String -> String
rle = concatMap (\s -> head s : show (length s)) .group

a :: Int -> Int
a = (^2)

main :: IO ()
main = print $ rle "aaaaaaaabbbbbccccddddddd"
