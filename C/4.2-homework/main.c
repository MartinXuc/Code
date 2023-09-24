/*Description

利用while或者for循环计算n！的值。

提示：n！＝1*2*3…*n


Input
一个正整数n，1≤n≤10。


Output
n！的值。


Sample Input 1

2
Sample Output 1

2
Sample Input 2

5
Sample Output 2

120*/
#include<stdio.h>
int main(){
    int n;
    int ans = 1;
    scanf("%d",&n);
    while(n>=1){
        ans *= n;
        n--;
    }
    printf("%d",ans);
    return 0;
}