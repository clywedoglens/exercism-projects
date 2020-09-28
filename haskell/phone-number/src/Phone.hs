module Phone (number) where
import Data.Char (isDigit)

number :: String -> Maybe String
number xs
  | length filteredNums == 11 = validate $ tail filteredNums
  | length filteredNums == 10 = validate filteredNums
  | otherwise                 = Nothing
  where filteredNums                = [n | n <- xs, isDigit n]
        e                           = head $ drop 3 filteredNums
        validate num@(a:_)
          | a `elem` "01" || e `elem` "01" = Nothing
          | otherwise                      = Just num
        validate _                         = Nothing
