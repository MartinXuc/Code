#include<stdio.h>
//顺序表的初始化
#define MaxSize 50
typedef int ElemType;

//静态分配
typedef struct{
    ElemType data[MaxSize];
    int length;
}SqList;

//插入元素
bool ListInsert(SqList &L, int i, ElemType e){
    if(i<1||i>L.length+1)
        return false;
    if(L.length>=MaxSize)
        return false;
    for(int j=L.length;j>=i;j--){
        L.data[j] = L.data[j-1];
    }
    L.data[i - 1] = e;
    L.length += 1;
    return true;
}
bool ListInsert(SqList &L, ElemType e){
    return ListInsert(L,L.length + 1, e);
}

//删除元素
bool ListDelete(SqList &L, int i, ElemType &e){
    if(i<1||i>L.length)
        return false;
    e = L.data[i - 1];
    for(int j = i; j < L.length; j++){
        L.data[j - 1] = L.data[j];
    }
    L.length--;
    return true;
}

//查找元素
int LocateElem(SqList &L, ElemType e){
    int i;
    for(i = 0; i < L.length; i++){
        if(L.data[i] == e)
            return i + 1;
    }
    return 0;
}

//打印顺序表元素
void PrintList(SqList &L){
    for(int i = 0; i < L.length; i++){
        printf("%3d", L.data[i]);
    }
    printf("\n");
}

int main(){
    SqList L;
    L.length = 0;
    bool ret = true;
    ListInsert(L,1);
    ListInsert(L,2);
    ListInsert(L,3);
    ElemType del;
    ElemType insertnum;
    int deleteadd;
    scanf("%d", &insertnum);
    ret = ListInsert(L,2,insertnum);
    if(ret){
        PrintList(L);
    }
    else{
        printf("false\n");
    }
    scanf("%d",&deleteadd);
    ret = ListDelete(L,deleteadd,del);
    if(ret){
        PrintList(L);
    }
    else{
        printf("false\n");
    }
    return 0;
}