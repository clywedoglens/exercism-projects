module Triangle (rows) where

combination :: Integer -> Integer -> Integer
combination _ 0 = 1
combination 0 _ = 0
combination n k = combination (n-1) (k-1) * n `div` k

rows :: Integer -> [[Integer]]
rows x = let binomialCoefficients n = foldr (\y acc -> (combination n y) : acc) [] [0..n]
             rowNum                 = toInteger x - 1
         in foldr (\n acc -> binomialCoefficients n : acc) [] [0..rowNum]
