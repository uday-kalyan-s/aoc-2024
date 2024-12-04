raw = open("input.txt").read()

raw = list(raw.splitlines())
smp = []
for l in raw:
    s = []
    for c in l:
        s.append(False)
    smp.append(s)

def find_indices(data: list[str]):
    ind = set()
    for row, line in enumerate(data):
        for col, c in enumerate(line):
            if c == 'A':
                ind.add((row,col))
    return ind

x_inds = find_indices(raw)

i_lim = len(raw)
j_lim = len(raw[0])

def search_single(operator: tuple[int, int], data: list[str], x_ind: tuple[int, int]):
    str = "MS"
    for ind, i in enumerate([-1,1]):
        if (x_ind[0]+operator[0]*i) >= i_lim or (x_ind[1]+operator[1]*i) >= j_lim or (x_ind[1]+operator[1]*i) < 0 or (x_ind[0]+operator[0]*i) < 0:
            return False
        if str[ind] != data[x_ind[0]+operator[0]*i][x_ind[1]+operator[1]*i]:
            return False
    return True

operators = [(1,1),(-1,-1),(1,-1),(-1,1)]

count = 0
for x_ind in x_inds:
    c = 0
    for op in operators:
        if search_single(op, raw, x_ind):
            c += 1
    if c == 2:
        count += 1

for i in range(len(smp)):
    for j in range(len(smp[0])):
        if smp[i][j]:
            print(raw[i][j], end="")
        else:
            print(".", end="")
    print("")
print(count)
