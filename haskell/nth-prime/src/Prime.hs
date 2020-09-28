module Prime (nth) where

nth :: Int -> Maybe Integer
nth n
  | n <= 0    = Nothing
  | otherwise = Just (primes !!(n - 1))
  where primes = filter isPrime [2..]

isPrime :: Integer -> Bool
isPrime n = all (\m -> n `mod` m /= 0) [2..maxFactor]
  where maxFactor = (floor . sqrt . fromIntegral) n
