raw = open("input.txt").read()

num1 = ""
num2 = ""
st = ""
log = ""
final = 0
do = True
for c in raw:
    log += c
    if(log.endswith("do()")):
        do = True
    elif log.endswith("don't()"):
        do = False
    if st == "mul(":
        if c.isdigit():
            if num1 == "":
                num1 += c
            elif num2 != "":
                num2 += c
            else:
                num1 += c
        else:
            if c == ",":
                if num2 == "":
                    num2 = "0"
                else:
                    st += ")"
            elif c == ")":
                if 1 <= len(num1) <= 3 and 2 <= len(num2) <= 4:
                    if do:
                        final += int(num1) * int(num2)
                    st += ")"
                else:
                    st += ")"
            else:
                st += ")"
        if st.endswith(")"):
            num1 = ""
            num2 = ""
            st = ""
    else:
        if "mul(".startswith(st+c):
            st += c
        else:
            num1 = ""
            num2 = ""
            st = ""
            if "mul(".startswith(c):
                st += c
                

print(final)