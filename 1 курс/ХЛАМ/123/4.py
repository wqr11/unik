zps = [i for i in map(int, input().split())]

mz = max(zps)
miz = min(zps)

print( round((miz / mz * 100)) )  