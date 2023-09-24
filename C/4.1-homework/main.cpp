/*Description

输入一个整型数，判断是否是对称数，如果是，输出yes，否则输出no，不用考虑这个整型数过大，int类型存不下，不用考虑负值；

例如 12321是对称数，输出yes，124421是对称数，输出yes，1231不是对称数，输出no


Input
一个整型数


Output
输出是yes，或者no


Sample Input 1

12321
Sample Output 1

yes
Sample Input 2

1231
Sample Output 2

no*/

#include<stdio.h>
int main(){
    int i, j;
    int temp;
    scanf("%d",&i);
    while(i){
        temp = i % 10;
        j *= 10;
        j += temp;
        i /= 10;
    }
    if(i == j)
        printf("yes");
    else
        printf("no");
}