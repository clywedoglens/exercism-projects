module Bob (responseFor) where
import Data.Char (isUpper, isAlpha)

responseFor :: String -> String
responseFor xs
  | null xs               = "Fine. Be that way!"
  | isQuestion && allCaps = "Calm down, I know what I'm doing!"
  | allCaps               = "Whoa, chill out!"
  | isQuestion            = "Sure"
  | otherwise             = "Whatever."
  where isQuestion = last xs == '?'
        allCaps    = all isUpper $ filter isAlpha xs
