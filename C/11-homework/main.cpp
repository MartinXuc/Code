#include<stdio.h>
#include<stdlib.h>
typedef int ElemType;
typedef struct LNode{
    ElemType data;
    struct LNode* Next;//指向下一个节点
}LNode, *LinkList;

//头插法新建链表
LinkList list_head_insert(LinkList &L){
    LNode* s;
    int x;
    L = (LinkList)malloc(sizeof(LNode));//带头结点的链表
    L->Next = NULL;
    scanf("%d",&x);
    while(x != 9999){
        s = (LNode*)malloc(sizeof(LNode));
        s->data = x;
        s->Next = L->Next;
        L->Next = s;
        scanf("%d",&x);
    }
    return L;
}

//尾插法新建链表
LinkList list_tail_insert(LinkList &L){
    int x;
    L = (LinkList)malloc(sizeof (LNode));
    LNode* s,*r = L;
    scanf("%d",&x);
    while(x != 9999){
        s = (LNode*)malloc(sizeof(LNode));
        s->data = x;
        r->Next = s;
        r = s;
        scanf("%d",&x);
    }
    r->Next = NULL;
    return L;
}

//按序号查找结点值，NULL代表查找的结点不存在
LNode *GetElem(LinkList &L, int i){
    LNode *p;
    for(p = L->Next; p!=NULL; p = p->Next){
        i--;
        if(i == 0) break;
    }
    if(i != 0) return NULL;
    else{
        return p;
    }
}

//按值查找，返回NULL代表没找到
LNode* LocateElem(LinkList L,ElemType e){
    LNode *p = L->Next;
    while(p!=NULL){
        if(p->data == e)
            return p;
        p = p->Next;
    }
    return p;
}

//新节点插入第i个位置
bool ListFrontInsert(LinkList &L, int i, ElemType e){
    LNode* p = GetElem(L, i - 1);
    if(NULL==p){
        return false;
    }
    LNode* temp = (LNode*)malloc(sizeof(LNode));
    temp->data = e;
    temp->Next = p->Next;
    p->Next = temp;
    return true;
}

void print_list(LinkList &L){
    L = L->Next;
    while(L != NULL) {
        printf("%d", L->data);
        L = L->Next;
        if (L != NULL) {
            printf(" ");
        }
    }
    printf("\n");
}

int main(){
    LinkList Lh,Lt;
    list_head_insert(Lh);
    list_tail_insert(Lt);
    print_list(Lh);
    print_list(Lt);
    return 0;
}