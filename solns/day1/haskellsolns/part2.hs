import System.IO

main = do
  contents <- readFile "input.txt"
  let res = uzip $ map (convInt . (take 2) . words) (lines contents)
  print $
    sum (
      (map . conditionalSum . snd) res $ fst res
    )

-- takes in right list and el from left list. adds it up conditionally
conditionalSum::[Int] -> Int -> Int
conditionalSum lst val1 = foldl (\acc x -> if x == val1 then acc + val1 else acc) 0 lst

uzip::[[Int]] -> ([Int], [Int])
uzip [(a:b:_)] = ([a],[b])
uzip ((f:s:_):xs) = 
  ((f:l),(s:r))
  where
    (l,r) = uzip xs
    

convInt::[String] -> [Int]
convInt a = map read a
