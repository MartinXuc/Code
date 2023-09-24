#include<stdio.h>
int main(){
    int i;
    char c;
    float f;
    scanf("%d %c %f",&i,&c,&f);
    f += i + c;
    printf("%.2f",f);
    return 0;
}