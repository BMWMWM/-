//
//  04_二分（插入）排序.m
//  排序算法1_冒泡排序
//
//  Created by BMW on 2017/7/13.
//  Copyright © 2017年 wb2lz. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 二分法插入排序是在插入第i个元素时，对前面的0～i-1元素进行折半，先跟他们中间的那个元素比，如果小，则对前半再进行折半，否则对后半进行折半，直到left<right，然后再把第i个元素前1位与目标位置之间的所有元素后移，再把第i个元素放在目标位置上。
平均时间复杂度O(n^2)
 */


//折半插入


#define KeyType int

typedef struct _SeqList
{
    int key;
}SeqList;

int Partition0( int R[], int i, int j){//调用Partition(R,low,high)时,对R[low..high]做划分,
    int pivot = R[i];//用区间的第1个记录作为基准
    while( i < j )//  i == 0,j == 9条件为真
    {
        if (R[j] >= pivot) {
                j--;//从右向左扫描,查找第1个关键字小于pivot的记录R[j]
            }
            R[i] = R[j];//相当于交换R[i]和R[j]
        if (R[i] <= pivot) {
                i++;//从左向右扫描,查找第1个关键字大于pivot的记录R[i]
            }
            R[j] = R[i];//相当于交换R[i]和R[j]
    }
    R[i]=pivot;
    return i;
}


//结构体写法
int Partition( SeqList R[], int i, int j){//调用Partition(R,low,high)时,对R[low..high]做划分,
    SeqList pivot = R[i];// 用区间的第1个记录作为基准
    while( i < j )
    {
        while( i < j && R[j].key >= pivot.key )//pivot相当于在位置i上
        {
            j--;//从右向左扫描,查找第1个关键字小于pivot.key的记录R[j]
        }
        if( i < j )//表示找到的R[j]的关键字<pivot.key
        {
            R[i] = R[j];//相当于交换R[i]和R[j],交换后i指针加1
        }
        while( i < j && R[i].key <= pivot.key )//pivot相当于在位置j上
        {
            i++;//从左向右扫描,查找第1个关键字大于pivot.key的记录R[i]
        }
        if( i < j )//表示找到了R[i],使R[i].key>pivot.key
        {
            R[j] = R[i];//相当于交换R[i]和R[j]
        }
    }
    R[i]=pivot;
    return i;
}

void QuickSort0( int R[], int low, int high )
{
    int pivotpos; // 划分后的基准记录的位置
    if( low < high )
    {// 仅当区间长度大于1时才须排序
        pivotpos = Partition0(R, low, high);//对R[low..high]做划分
        QuickSort0( R, low, pivotpos - 1 );//对左区间递归排序
        QuickSort0( R, pivotpos + 1, high );//对右区间递归排序
    }
}


//结构体写法
void QuickSort( SeqList R[], int low, int high )
{
    int pivotpos; // 划分后的基准记录的位置
    if( low < high )
    {// 仅当区间长度大于1时才须排序
        pivotpos = Partition(R, low, high);//对R[low..high]做划分
        QuickSort( R, low, pivotpos - 1 );//对左区间递归排序
        QuickSort( R, pivotpos + 1, high );//对右区间递归排序
    }
}

int main(){
    @autoreleasepool {
        SeqList arr_Seq[10];
        int arr[] ={5,2,6,7,3,12,56,0,15,22};
        for (int i = 0; i < 10; i++) {
            arr_Seq[i].key = arr[i];
        }
        QuickSort0(arr, 0, 9);
        //结构体写法
        QuickSort( arr_Seq, 0, 9 );
        
        for( int i = 0; i < 10; i++ )
        {
            printf("%d\n",arr[i]);
            //结构体写法
            printf("%d\n",arr_Seq[i].key);
            printf("====================\n");

        }

           }
    return 0;
}
