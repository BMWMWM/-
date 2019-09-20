//
//  05_选择排序.m
//  排序算法1_冒泡排序
//
//  Created by BMW on 2017/7/13.
//  Copyright © 2017年 wb2lz. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 简单选择排序的基本思想：第1趟，在待排序记录r[1]~r[n]中选出最小的记录，将它与r[1]交换；第2趟，在待排序记录r[2]~r[n]中选出最小的记录，将它与r[2]交换；以此类推，第i趟在待排序记录r[i]~r[n]中选出最小的记录，将它与r[i]交换，使有序序列不断增长直到全部排序完毕。
 时间复杂度为O(n2)
 */

void SelectSort(int r[], int length)/*对记录数组r做简单选择排序，length为待排序记录的个数*/
{
    for (int i=0 ; i< length-1 ; i++) //n-1趟排序
    {
        int index = i;//假设index处对应的数组元素是最小的
        for (int j = i+1 ; j < length ; j++)//查找最小记录的位置
            if (r[j] < r[index] )
                index = j;
        if ( index != i)//若无序区第一个元素不是无序区中最小元素，则进行交换
        {
//            r[i] = r[i] + r[index];
//            r[index] = r[i] - r[index];
//            r[i] = r[i] - r[index];
            r[i] = r[index];
        }
    }
}


int main(){
    @autoreleasepool {
        int r[] = {0};
        for (int i = 0; i < 10; i++) {
            r[i] = arc4random() % 100;
        }
        SelectSort(r, 10);
        for (int i = 0; i < 10; i++) {
            printf("%d\n",r[i]);
        }
    }
    return 0;
    
}
