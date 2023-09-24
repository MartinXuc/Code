/*Description

某人想将手中的一张面值100元的人民币换成10元、5元、2元和1元面值的票子。要求换正好40张，且每种票子至少一张。问：有几种换法？


Input
无输入


Output
一个数，表示共有多少种换法


Sample Input 1

无
Sample Output 1

不能告知，因为只有一个数，偷偷告诉你小于100*/
#include<stdio.h>
int main(){
    int count_price10 = 0;
    int count_price5 = 0;
    int count_price2 = 0;
    int count_price1 = 0;
    int count = 0;
    for(count_price10 = 1; count_price10 <= 100 / 10; count_price10++)
    {
        for(count_price5 = 1; count_price5 <= (100 - 10 * count_price10) / 5; count_price5++)
        {
            for(count_price2 = 1; count_price2 <= (100 - 10 * count_price10 - 5 * count_price5) / 2; count_price2++)
            {
                count_price1 = 100 - 10 * count_price10 - 5 * count_price5 - 2 * count_price2;
                if((count_price10 + count_price5 + count_price2 + count_price1) == 40 && count_price1 != 0){
                    count++;
                    //printf("countprice10=%d\ncp5=%d\ncp2=%d\ncp1=%d\n",count_price10,count_price5,count_price2,count_price1);
                }

            }
        }
    }
    printf("%d",count);
    return 0;
}