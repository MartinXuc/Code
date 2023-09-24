/*Description
输入N个数（N小于等于100），输出数字2的出现次数；
解题提示：
整型数组读取5个整型数的方法如下：
int a[100];
for(int i=0;i<5;i++)
{
scanf("%d",&a[i]);
}
完成作业的同学，可以购买《跟龙哥学C语言编程》，有很多课后习题可以练习，附带答案，或者直接B站搜王道论坛，看王道的数据结构，组成原理。
Inpu
输入的格式是两行
第一行输入要输的元素个数，比如5
第二行输入  1 2 2 3 2，那么输出结果为3，因为2出现了3次
Output
统计数字2出现的次数
Sample Input 1
5
1 2 2 3 2
Sample Output 1
3*/

#include <stdio.h>
#include <stdlib.h>

int main() {
    int count;
    int count_of_2 = 0;
    scanf("%d",&count);
    int i;
    for(i = 0; i < count; i++){
        int num;
        scanf("%d", &num);
        while(num != 0){
            if(num % 10 == 2)
                count_of_2++;
            num /= 10;
        }
    }
    printf("%d",count_of_2);
    return 0;
}
