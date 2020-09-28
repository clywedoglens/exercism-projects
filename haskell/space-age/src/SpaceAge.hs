module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

yearProduct :: Float -> Float -> Float
yearProduct planetYear seconds = planetYear * toYears
  where toYears = seconds / 31557600

ageOn :: Planet -> Float -> Float
ageOn Mercury = yearProduct 0.2408467
ageOn Venus   = yearProduct 0.61519726
ageOn Earth   = yearProduct 1.0
ageOn Mars    = yearProduct 1.8808158
ageOn Jupiter = yearProduct 11.862615
ageOn Saturn  = yearProduct 29.447498
ageOn Uranus  = yearProduct 84.016846
ageOn Neptune = yearProduct 164.79132
