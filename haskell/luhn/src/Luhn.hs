module Luhn (isValid) where
import Data.Char (digitToInt, isDigit)

isValid :: String -> Bool
isValid n
  | numLength <= 1 = False
  | otherwise      = validSum $ zipWith ($) (cycle [id, double]) digits
  where numLength   = length n
        validSum xs = (sum xs) `mod` 10 == 0
        digits      = reverse $ map digitToInt $ filter isDigit n
        double x    = (x * 2) `mod` 9
