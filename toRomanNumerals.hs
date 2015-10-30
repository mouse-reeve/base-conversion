import System.Environment
import Data.Map hiding (filter)
import qualified Data.Map as Map

toRomanNumerals :: Int -> String
toRomanNumerals 0 = ""
toRomanNumerals n
    | elem (n+1) values = "I" ++ fromList buckets ! (n+1)
    | otherwise =
        let overshoot = head ( reverse (filter (>n) values) )
            max = head (filter (<overshoot) values)
        in  fromList buckets ! max ++ toRomanNumerals(n - max)
    where values   = [1000, 500, 100, 50,  10,  5,   1  ]
          numerals = ["M",  "D", "C", "L", "X", "V", "I"]
          buckets = zip values numerals

main :: IO ()
main = do
    args <- getArgs
    let n = toRomanNumerals (read $ head $ args)
    print n
