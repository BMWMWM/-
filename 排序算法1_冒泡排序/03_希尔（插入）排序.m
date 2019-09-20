//
//  03_希尔排序.m
//  排序算法1_冒泡排序
//
//  Created by BMW on 2017/7/13.
//  Copyright © 2017年 wb2lz. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 希尔排序（Shell sort）基本思想: 改进的直接插入算法。设待排序的元素序列有n个元素，首先取一整数gap（<n）作为间隔，将全部元素分为gap个子序列，所有距离为gap的元素放在同一序列中，在每个子序列中分别进行直接插入排序。然后缩小gap，例如gap=gap/2,重复上述的子序列划分与排序工作。开始由于gap取直大，每个子序列元素少，排序速度快，待排序后期，gap值逐渐变小，子序列元素变多，但由于前面的工作基础，大多数元素已经有序，所以排序速度快。
 
 基本思想：先取一个小于n的整数d1作为第一个增量，把文件的全部记录分组。所有距离为d1的倍数的记录放在同一个组中。先在各组内进行直接插入排序；然后，取第二个增量d2<d1重复上述的分组和排序，直至所取的增量  =1(  <  …<d2<d1)，即所有记录放在同一组中进行直接插入排序为止。
    希尔排序是一种不稳定的排序。
 在最优的情况下，时间复杂度为：O（n ^ (1.3) ）（元素已经排序好顺序）
 O(nlog n) 
 在最差的情况下，时间复杂度为：O（n ^ 2）；
 */
void swap(int *a,int *b){//指针值交换算法
    int x;
    x = *a;
    *a = *b;
    *b = x;
}

void insertion_sort(int data[], int n, int increment)
{
    int i, j;
    for (i = increment; i < n; i += increment)
    {
            for (j = i; j >= increment; j -= increment)
                {
                    if (data[j] < data[j-increment])
                    {
                        swap(&data[j], &data[j-increment]);
                    }
                }
    }
}

void shellsort(int data[], int n)
{
    int i, j;
    for (i = n / 2; i > 0; i /= 2)//每次缩短一半
    {
            for (j = 0; j < i; j++)
        {
                insertion_sort(data, n, i);//第一次i = n / 2
        }
    }
}

int main(){
    @autoreleasepool {
//        int a = 10;
//        int * pa = &a;
//        printf("%d",*pa);
        
        int data[] = {1,3,5,4,9,6,7,8,2};
        shellsort(data, 9);
        
        int data2[] = {0};
        for (int i = 0;i < 100 ; i++) {
            data2[i] = arc4random() % 100;//%余数 ／整数
        }
        shellsort(data2, 100);

        for (int i = 0; i < 9; i++) {
//            printf("[%d]\n",data[i]);
        }
        
        for (int i = 0; i < 100; i++) {
            printf("[%d]\n",data2[i]);
        }
    }
    return 0;
}
