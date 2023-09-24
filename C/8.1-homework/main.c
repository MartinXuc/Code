/*课时8作业1
Description

输入一个学生的学号，姓名，性别，用结构体存储，通过scanf读取后，然后再通过printf打印输出


Input
学号，姓名，性别，例如输入 101 xiongda m


Output
输出和输入的内容一致，如果输入的是101 xiongda m，那么输出也是101 xiongda m


Sample Input 1

101 xiongda m
Sample Output 1

101 xiongda m*/

#include<stdio.h>

typedef struct student{
    int num;
    char* name[10];
    char sex;
}stu;

int main(){
    stu s;
    scanf("%d",&s.num);
    scanf("%s",s.name);
    scanf("%c",&s.sex);
    scanf("%c",&s.sex);
    printf("%d ",s.num);
    printf("%s ",s.name);
    printf("%c",s.sex);
    return 0;
}