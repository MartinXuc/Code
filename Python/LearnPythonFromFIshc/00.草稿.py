class Fib(object):
    def __init__(self):
        self.array = []
        
    def __call__(self, num):
        if(num == 1):
            self.array = [1]
        elif(num == 2):
            self.array = [1, 1]
        else:
            self.array = [1, 1]
            for i in range(2, num):
                a = self.array[i - 1]
                b = self.array[i - 2]
                self.array.append(a + b)
        return self.array[:num]

f = Fib()
print(f(10))