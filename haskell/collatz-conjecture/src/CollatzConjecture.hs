module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0    = Nothing
  | otherwise = Just $ fromIntegral $ length $ takeWhile (>1) $ iterate collatzStep n
  where collatzStep 1 = 1
        collatzStep n
          | even n    = n `div` 2
          | otherwise = n * 3 + 1
