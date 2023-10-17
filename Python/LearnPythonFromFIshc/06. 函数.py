def myfunc(name,num):
    for i in range(num):
        print(f"12312313{name}")

print(myfunc('I love Python',5))

def div(x,y):
    if(y == 0):
        return 'Error:除数不能为0！'
    return x/y

z = div(4,0)
print(z)