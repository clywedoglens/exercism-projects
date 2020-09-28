module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
  | not $ isDivisibleBy 4       = False
  | not $ isDivisibleBy 100     = True
  | isDivisibleBy 400           = True
  | otherwise                   = False
  where isDivisibleBy d = year `rem` d == 0
