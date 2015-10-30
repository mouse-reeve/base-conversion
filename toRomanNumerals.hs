import System.Environment
import Data.Map hiding (filter)

toRomanNumerals :: Int -> String
toRomanNumerals 0 = ""
toRomanNumerals n
    | (n + 1) `elem` values = "I" ++ fromList buckets ! (n + 1)
    | n >= 1000 = fromList buckets ! 1000 ++ toRomanNumerals(n - 1000)
    | otherwise =
        let overshoot = last (filter (>n) values)
            bucket = head (filter (<overshoot) values)
        in  fromList buckets ! bucket ++ toRomanNumerals(n - bucket)
    where values   = [1000, 500, 100, 50,  10,  5,   1  ]
          numerals = ["M",  "D", "C", "L", "X", "V", "I"]
          buckets = zip values numerals

main :: IO ()
main = do
    args <- getArgs
    let n = toRomanNumerals (read $ head args)
    print n
