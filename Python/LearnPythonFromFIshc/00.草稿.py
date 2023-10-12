class Person(object):
    def __init__(self, name, gender):
        self.name = name
        self.gender = gender

class Student(Person):
    def __init__(self, name, gender, score):
        super(Student,self).__init__(name, gender)
        self.score = score
    def __str__(self):
        return f'name:{self.name},gender:{self.gender},score:{self.score}'
    def __repr__(self):
        return self.__str__()

p = Person('Bob','Male')
s = Student('Bob','Male',88)

print(s)

class Fib(object):
    def __init__(self,n):
        self.n = n
        self.fib_list = [1,1]
        if n == 1:
            self.fib_list=[1]
        elif n == 2:
            self.fib_list=[1,1]
        else:
            for i in range(2, n):
                if(i == len(self.fib_list)):
                    self.fib_list.append(self.fib_list[i - 1] + self.fib_list[i - 2])
    def __str__(self):
        return str(self.fib_list)
    def __len__(self):
        return len(self.fib_list)
    
print(Fib(10))
print(len(Fib(10)))
print(len(Fib(10)))


class Rational(object):
    def __init__(self, p, q):
        self.p = p
        self.q = q
    def __add__(self, r):
        return Rational(self.p * r.q + self.q * r.p, self.q * r.q)
    def __str__(self):
        return '{}/{}'.format(self.p, self.q)
    def __sub__(self, r):
        return Rational(self.p * r.q - self.q * r.p, self.q * r.q)
    def __mul__(self, r):
        return Rational(self.p * r.p, self.q * r.q)
    def __truediv__(self, r):
        return Rational(self.p * r.q, self.q * r.p)

r1 = Rational(1, 2)
r2 = Rational(1, 5)
print(r1 + r2)
print(r1 - r2)
print(r1 * r2)
print(r1 / r2)