#!/usr/bin/python3
 
x="a"
y="b"
# 换行输出
print( x )
print( y )
 
print('---------')
# 不换行输出
print( x, end="" )
print( y, end=" " )
print()

# 注意双引号内的东西也会被输出出来
print( x, end=" " )
print( y, end=" " )