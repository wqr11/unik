from math import sqrt

def nod(n):
    inc = 0
    ns = set()
    for i in range(1, int(sqrt(n))+1):
        if n % i == 0:
            f = n // i
            s = ""
            if i > f:
                s += str(i)
                s += str(f)
            else:
                s += str(f)
                s += str(i)
            if not s in ns:
                inc += 1
    return inc
print(
    nod(int(input()))
)
            