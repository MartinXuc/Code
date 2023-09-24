#include<stdio.h>
//结构体指针
typedef struct student{
    int num;
    char name[20];
    char sex;
}stu,*pstu;

typedef int INTEGER;

int main(){
    stu s ={1001,"wangle",'M'};
    pstu p;
    INTEGER i = 10;
    p = &s;
    printf("i = %d,p->num = %d\n",i,p->num);
    return 0;
}