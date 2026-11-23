n = int(input())

ls = 0
rs = 0

for _ in range(n):
    l, r, s = map(int, input().split())
    ls += l * s
    rs += r * s

print(
    int(abs(ls-rs) / 100)
)
