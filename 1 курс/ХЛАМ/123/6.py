n = int(input())

inc = 0

for i in range(n):
    row = [x for x in map(int, input().split())]
    
    for j in range(0, i+1):
        if row[j] == 1:
            inc += 1
print(inc)