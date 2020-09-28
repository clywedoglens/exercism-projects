module Raindrops (convert) where

convert :: Int -> String
convert n = translateFactors [translate d | d <- [3, 5, 7], n `mod` d == 0]
  where translateFactors [] = show n
        translateFactors xs = concat xs
        translate 3         = "Pling"
        translate 5         = "Plang"
        translate 7         = "Plong"
        translate _         = ""
