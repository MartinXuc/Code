# 获取范围在1-100中的随机数字
import random
num = random.randint(1,100)

# 定义一个变量记录一共猜了多少次
count = 0

# 通过布尔类型变量控制循环是否进行的标记

flag = True
while flag:
    count += 1
    guess_num = int(input("请输入你要猜测的数字："))
    if guess_num == num:
        print("猜中了")
        # 设置为false就是终止循环的条件
        flag = False
    else:
        if guess_num > num:
            print("大了")
        else:
            print("小了")
print(f"一共猜测了{count}次")