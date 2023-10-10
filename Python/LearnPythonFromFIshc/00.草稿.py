class Animal():
    def __init__(self,name,age):
        self.name = name
        self.age = age

dog = Animal('wangcai',5)
cat = Animal('mimi',3)

print(dog.name,dog.age)
print(cat.name,cat.age)