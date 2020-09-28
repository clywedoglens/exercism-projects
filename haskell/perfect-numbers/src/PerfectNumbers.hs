module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify num
   | num < 1           = Nothing
   | aliquotSum == num = Just Perfect
   | aliquotSum > num  = Just Abundant
   | otherwise         = Just Deficient
   where aliquotSum = sum [x | x <- [1..n-1], isFactor]
         isFactor n = num `rem` n == 0
