module Main (main) where

import System.Environment (getArgs)
import RomanNumbers (r2i, i2r)

main :: IO ()
main = do
        args <- getArgs
        let output = case args of
                  ["--r2i", r] -> show (r2i r)
                  ["--i2r", i] -> i2r  (read i :: Int)
                  ["--help"]   -> usageMsg 
                  _            -> errorMsg
        putStrLn output

errorMsg :: String 
errorMsg = "Error running RomanNumerals" ++ "\n\n" ++ usageMsg

usageMsg :: String
usageMsg = "Usage: RomanNumerals --r2i R | --i2r N\n\
             \\n\
             \with:\n\
             \- R a roman number like XI or MDCXXVI\n\
             \- N a natural number like 4 or 2345"
