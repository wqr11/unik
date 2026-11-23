s = input()

r = ""

was = set()

for i in s:
    if (i not in was):
        r += str(s.count(i)) + i
        was.add(i)

print(r)