module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock { hour :: Int
                   , minute :: Int
                   } deriving (Eq)

fromHourMin :: Int -> Int -> Clock
fromHourMin hr m = Clock ((hr + m `div` 60) `mod` 24) (m `mod` 60)

toString :: Clock -> String
toString clock =
  let hr = hour clock
      m  = minute clock
      hourString
        | hr < 10   = "0" ++ show hr
        | otherwise = show hr
      minString
        | m < 10    = "0" ++ show m
        | otherwise = show m
  in mconcat [hourString, ":", minString]

addDelta :: Int -> Int -> Clock -> Clock
addDelta h m clock = fromHourMin (hour clock + h) (minute clock + m)
