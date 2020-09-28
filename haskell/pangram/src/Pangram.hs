module Pangram (isPangram) where
import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text =
  let alphabet = ['a'..'z']
  in all (`elem` map toLower text) alphabet
