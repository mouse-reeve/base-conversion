import System.Environment

toBase :: Int -> Int -> Int
toBase 0 _ = 0
toBase n radix =
    let minExponent = floor ( logBase (fromIntegral radix) (fromIntegral n) )
        digitValue = radix ^ minExponent
        digit = floor (fromIntegral n / fromIntegral digitValue)
    in  (digit * (10 ^ minExponent)) + toBase (n - (digitValue * digit)) radix

main :: IO ()
main = do
    (arg1:arg2:_) <- getArgs
    let n = toBase (read $ arg1) (read $ arg2)
    print n
