main = do
  raw <- readFile("sample.txt")
  print $ sum $ map checkBoth $ parse raw
  
parse::String->[[Int]]
parse raw = map (map read . words) (lines raw)

convInt::String -> Int
convInt x = read x

data Order = Increasing | Decreasing | Undefined deriving Eq

checkOrder::Order -> [Int] -> Bool
checkOrder _ [x] = True
checkOrder order (a:b:xs)
    | order == Increasing = if b > a then checkOrder order rest else False
    | order == Decreasing = if a > b then checkOrder order rest else False
    | order == Undefined = if b > a then checkOrder Increasing rest else checkOrder Decreasing rest
  where
    rest = (b:xs)

checkDist::[Int] -> Bool
checkDist [x] = True
checkDist (a:b:xs) = 
  if (dist >= 1 && dist <= 3) then checkDist rest else False
  where
    rest = (b:xs)
    dist = abs(b-a)

-- since haskell bitwise is funny & wrapper for better currying
checkBoth::[Int] -> Int
checkBoth lst =
  if checkOrder Undefined lst && checkDist lst then 1 else 0
