module CryptoSquare (encode) where
import Data.Char (isAlpha, toLower)
import Data.List (transpose)


splitEvery :: Int -> String -> [String]
splitEvery _ [] = []
splitEvery n list = (first ++ (padding n $ length first)) : (splitEvery n rest)
  where (first,rest)      = splitAt n list
        padding col wordlen
          | wordlen < col = replicate (col - wordlen) ' '
          | otherwise     = ""

encode :: String -> String
encode xs =
  let normalized input     = filter isAlpha . map toLower $ input
      normlen              = length $ normalized xs
      c:_                  = dropWhile (\x -> x^2 < normlen) [1..]
      chunks num string    = splitEvery num $ normalized string
  in unwords . transpose . chunks c $ normalized xs

