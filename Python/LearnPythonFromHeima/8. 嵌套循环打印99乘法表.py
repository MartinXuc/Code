i = 0
while i < 9:
    i += 1
    j = 0
    while j < i:
        j += 1
        print(f"{j}*{i}={j*i}\t",end='')
    print()