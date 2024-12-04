#!python

from requests import get
import sys
import json
import os

day = sys.argv[1]

cookie = json.loads(open("secrets.json").read())["cookie"]
print("hello")
fldr = f"solns/day{day}"

os.mkdir(fldr)

r = get(f"https://adventofcode.com/2024/day/{day}/input", cookies={"session": cookie}, headers={"User-Agent": "personal use fetcher by udaykalyansreenivasa@gmail.com, https://github.com/coder11235/aoc-2024/blob/main/setupday.py"})

print(r.text)

fl = open(f"{fldr}/input.txt", "w")
fl.write(r.text)

# one file solutions for the first few days
open(f"{fldr}/part1.py", "w")
open(f"{fldr}/part2.py", "w")
open(f"{fldr}/sample.txt", "w")
