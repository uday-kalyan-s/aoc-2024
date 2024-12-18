import System.IO
import Control.Monad
import Data.Char

main = do
  contents <- readFile "sample.txt"
  let res = uzip $ map (convInt . (take 2) . words) (lines contents)
  print $ getDists (quicksort $ fst res) (quicksort $ snd res)

uzip::[[Int]] -> ([Int], [Int])
uzip [(a:b:_)] = ([a],[b])
uzip ((f:s:_):xs) = 
  ((f:l),(s:r))
  where
    (l,r) = uzip xs
    

quicksort::[Int] -> [Int]
quicksort [] = []
quicksort [x] = [x]
quicksort (p:xs) = 
  smallerSorted ++ [p] ++ biggerSorted
  where
    smallerSorted = quicksort $ filter (>p) xs
    biggerSorted = quicksort $ filter (<=p) xs

getDists [] [] = 0
getDists (left:ls) (right:rs) = 
  abs (left - right) + getDists ls rs

convInt::[String] -> [Int]
convInt a = map read a
