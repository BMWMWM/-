//
//  02.m
//  排序算法1_冒泡排序
//
//  Created by BMW on 2016/12/11.
//  Copyright © 2016年 wb2lz. All rights reserved.
//

#import <Foundation/Foundation.h>
//插入排序事件复杂度O（n^2）

//待排序元素用数组a表示 n表示数组有n个元素
void insert_sort(int* a,int n){
    int i,j;
    int temp;
    for (i = 1; i < n; i++) {//i 表示插入次数 共插入n-1次
        temp = a[i];//把待排序元素赋给temp，temp在while循环中并不改变，这样方便比较，并且它是要插入的元素
        j = i - 1;
        while (temp < a[j]) {
            //while循环的作用是将比当前元素大的元素都往后移动一个位置
            a[j+1] = a[j];
            j--;// 顺序比较并移动,依次将元素后移一个位置
        }
        a[j+1] = temp;//元素后移后要插入的位置就空出了，找到该位置插入
        }
}
int main(){
    @autoreleasepool {
     
        int array[] = {4,9,8,30,20,50};
        int i = 0;
        insert_sort(array,6);
        for (i = 0; i < 6; i++) {
        printf("[%d]\n",array[i]);
            
        }
        
    }
    return 0;
}
