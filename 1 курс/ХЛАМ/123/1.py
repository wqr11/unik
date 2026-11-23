n = int(input())

p = 10**100
for i in range(n):
    p = (p * (365 - i)) // 365

print(10**100 - p)