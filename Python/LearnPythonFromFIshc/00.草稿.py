class Animal():
    __count = 0
    __age = 0
    def __init__(self,name,age):
        self.name = name
        self.__age = age
        self.__count += 1
dog=Animal('wangcai',3)
print(dog.age)