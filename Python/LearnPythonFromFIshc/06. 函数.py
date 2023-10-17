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

# 收集参数
def myfunc(*args):
    print(args)
    print(f"有{len(args)}个参数")
    print(f"第2个参数是：{args[1]}")

myfunc(1,2,3,4,5)

def myfunc(*args,a,b):
    pass

myfunc(1,2,3,a=4,b=5)

def myfunc(**kwargs):
    print(kwargs)

myfunc(a=1,b=2,c=3)

def myfunc(a,*b,**c):
    print(a,b,c)

myfunc(1,2,3,4,x=5,y=6)

# 解包参数
def myfunc(a,b,c,d):
    print(a,b,c,d)

args = (1,2,3,4)
myfunc(*args)# 这里args被*解包

# 同样对字典用**来解包

# 全局变量
x = 880
def myfunc():
    global x
    x = 520
    print(x)
myfunc()
print(x)

# 嵌套函数
def func1():
    x=520
    def func2():
        x=880
        print(f'in func2,x = {x}')
    func2()
    print(f'in func1,x = {x}')
func1()

# nonlocal:在内部修改外部变量
def func1():
    x=520
    def func2():
        nonlocal x
        x=880
        print(f'in func2,x = {x}')
    func2()
    print(f'in func1,x = {x}')
func1()

# LEGB规则
# Local
# Enclose
# Global
# Build-In

# 函数说明文档
def exchange(dollar,rate = 6.32):
    '''
    功能：汇率转换，美元 -> 人民币
    参数：
    - dollar 美元数量
    - rate 汇率，默认值是6.32
    返回值：
    - 换算后人民币的值
    '''
    return dollar*rate

help(exchange)

# 类型注释
def times(s:str = 'Fishc',n:int = 3) -> str:
    return s * n

times("FishC",5)
times(5,5)
# 请注意这个注释并非强行限制，
# 只是函数作者建议，
# 乱来不一定会报错

def times(s:list[int],n:int = 3) -> list:
    return s * n

def times(s:dict[int,int],n:int = 3) -> list:
    return list(s.keys()) * n


# 高阶函数
