/*Description

使用C++的引用，注意提交时把代码选为C++；在主函数定义字符指针 char *p,然后在子函数内malloc申请空间（大小为100个字节），通过fgets读取字符串，然后在主函数中进行输出；要求子函数使用C++的引用，注意在C++中从标准输入读取字符串，需要使用fgets(p,100,stdin)


Input
输入一个字符串，例如 I love C language


Output
如果输入的是I love C language，那么输出也是I love C language


Sample Input 1

I love C language
Sample Output 1

I love C language
Sample Input 2

how are you
Sample Output 2

how are you*/

#include <iostream>
#include <string.h>
using namespace std;
void read(char* &str){
    char* p = (char*)malloc(100);
    fgets(p,100,stdin);
    str = p;
}
int main() {
    char* str;
    read(str);
    puts(str);
    free(str);
}
