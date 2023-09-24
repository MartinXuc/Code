print("欢迎来到黑马动物园。")
height = input("请输入您的身高(cm):")
height = int(height)
if(height <= 120):
    print("您的身高未超出120cm，可以免费游玩")
else:
    print("您的身高超出120cm，游玩需要补票10元。")
print("祝您游玩愉快")