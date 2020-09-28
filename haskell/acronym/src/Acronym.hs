module Acronym (abbreviate) where

abbreviate :: String -> String
abbreviate xs = map head $ words xs
