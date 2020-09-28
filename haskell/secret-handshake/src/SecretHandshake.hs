module SecretHandshake (handshake) where
import Data.Char (intToDigit)
import Numeric
import qualified Data.Map as Map

mapping :: Map.Map Int String
mapping = Map.fromList [ (0, "wink")
                       , (1, "double blink")
                       , (2, "close your eyes")
                       , (3, "jump")]

handshake :: Int -> [String]
handshake n = convert $ reverse $ showIntAtBase 2 intToDigit n ""

convert :: String -> [String]
convert numStr = foldr translate [] posPairs
  where posPairs = reverse $ zip [0..] numStr

translate :: (Int, Char) -> [String] -> [String]
translate (4, num) acc
    | num == '1'  = reverse acc
    | otherwise   = acc
translate (pos, num) acc
    | num == '1'  = reverse $ translation : acc
    | otherwise   = acc
    where (Just translation) = Map.lookup pos mapping
