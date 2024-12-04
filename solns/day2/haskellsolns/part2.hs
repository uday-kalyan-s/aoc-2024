main = do
  raw <- readFile("input.txt")
  print $ sum . map checkAll $ parse raw
  
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

-- checks for a list if it satisfied both conds and returns ans in bitwise
checkSimpleBool::[Int] -> Int
checkSimpleBool lst = if checkOrder Undefined lst && checkDist lst then 1 else 0

-- since haskell bitwise is funny & wrapper for better currying
checkAll::[Int] -> Int
checkAll lst =
  (\l -> if (l>0) then 1 else 0) . sum . map checkSimpleBool $ removeSingle [] lst ++ [lst]

removeSingle::[Int] -> [Int] -> [[Int]]
removeSingle left [x] = [left]
removeSingle left [] = []
removeSingle left (x:right) =
  (left++right):removeSingle (left ++ [x]) right
