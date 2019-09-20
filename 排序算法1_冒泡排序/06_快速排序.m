//
//  06_快速排序.m
//  排序算法1_冒泡排序
//
//  Created by BMW on 2017/7/13.
//  Copyright © 2017年 wb2lz. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 设要排序的数组是A[0]……A[N-1]，首先任意选取一个数据（通常选用数组的第一个数）作为关键数据，然后将所有比它小的数都放到它前面，所有比它大的数都放到它后面，这个过程称为一趟快速排序。值得注意的是，快速排序不是一种稳定的排序算法，也就是说，多个相同的值的相对位置也许会在算法结束时产生变动。
 */

void sort(int *a, int left, int right)
{
    if(left >= right)/*如果左边索引大于或者等于右边的索引就代表已经整理完成一个组了*/
    {
        return ;
    }
    int i = left;
    int j = right;
    int key = a[left];//一般第一个数作为第一趟比较数据
    
    while(i < j)/*控制在当组内寻找一遍*/
    {
        while(i < j && key <= a[j])
        /*而寻找结束的条件就是
         1，找到一个小于或者大于key的数（大于或小于取决于你想升序还是降序）
         2，没有符合条件1的，并且i与j的大小没有反转*/
        {
            j--;/*向前寻找*/
        }
        
        a[i] = a[j];
        /*找到一个这样的数后就把它赋给前面的被拿走的i的值（如果第一次循环且key是
         a[left]，那么就是给key）*/
        
        while(i < j && key >= a[i])
        /*这是i在当组内向前寻找，同上，不过注意与key的大小关系停止循环和上面相反，
         因为排序思想是把数往两边扔，所以左右两边的数大小与key的关系相反*/
        {
            i++;
        }
        
        a[j] = a[i];
    }
    
    a[i] = key;/*当在当组内找完一遍以后就把中间数key回归*/
    sort(a, left, i - 1);/*最后用同样的方式对分出来的左边的小组进行同上的做法*/
    sort(a, i + 1, right);/*用同样的方式对分出来的右边的小组进行同上的做法*/
    /*当然最后可能会出现很多分左右，直到每一组的i = j 为止*/
}

int main(){
    @autoreleasepool {
        
        int r[] = {0};
        for (int i = 0; i < 10; i++) {
            r[i] = arc4random() % 10;
        }
        sort(r, 0, 10);
        for (int i = 0; i < 10; i++) {
            printf("%d\n",r[i]);
        }
    }
    return 0;
}
