module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map)
import qualified Data.Map as Map
import Control.Monad (foldM)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

initMap :: Map Nucleotide Integer
initMap = Map.fromList [(A, 0)
                       ,(C, 0)
                       ,(G, 0)
                       ,(T, 0)]


nucleotideCounts :: String -> Either String (Map Nucleotide Integer)
nucleotideCounts = let addToMap m c   = increment m <$> (nucleotide c)
                       nucleotide 'A' = Right A
                       nucleotide 'C' = Right C
                       nucleotide 'G' = Right G
                       nucleotide 'T' = Right T
                       nucleotide _   = Left "error"
                       increment m n  = Map.insertWith (+) n 1 m
                   in foldM addToMap initMap
