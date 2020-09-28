module SumOfMultiples (sumOfMultiples) where
import qualified Data.Set as Set

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = let multiples n    = takeWhile (< limit) $ iterate (+n) n
                                   addToSet n acc = Set.union acc $ Set.fromList $ multiples n
                               in sum $ Set.toList $ foldr addToSet Set.empty factors
