module Anagram (anagramsFor) where

import Data.List (sort)
import Data.Char (toUpper)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss =
  let isAnAnagram xs ys = sorted xs == sorted ys
      sorted xs         = (sort . map toUpper) xs
  in foldr (\x acc -> if isAnAnagram xs x then x : acc else acc) [] xss
