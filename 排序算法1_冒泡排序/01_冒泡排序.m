//
//  main.m
//  排序算法1_冒泡排序
//
//  Created by BMW on 2016/12/9.
//  Copyright © 2016年 wb2lz. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
排序算法总结
In-place sort（不占用额外内存或占用常数的内存）：
插入排序(直接、二分、希尔)、选择排序、冒泡排序、堆排序、快速排序。
Out-place sort：
归并排序、计数排序、基数排序、桶排序。
 */
//冒泡 时间复杂度O（n^2）
/*
 第一次:从一个数组的最后一个元素到该数组的第一个元素进行扫描，比较后一个元素与前一个元素的大小，如果后一个小于前一个，交换顺序。通过这样的交换，那么我们就可以把该数组的最小元素换位到该数组的第一个位置。
 第二次:从该数组的最后一个元素到该数组的第二个元素进行扫描，比较后一个元素与前一个元素的大小，如果后一个小于前一个，交换顺序。通过这样的交换，那么我们就可以把该数组的最小元素换位到该数组的第二个位置。 依次这样的循环。。。。
 如果是有n个元素的话，那么我们就要进行n-1次的冒泡，就可以把该数组从小到大排好序
 */

void print(int *num,int n){
    for (int i = 0; i < n; i++) {
        printf("%d ",num[i]);
    }
    printf("\n");
    return;
}
//最大的搁最后
void bubble_Sort(int *num,int n){
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (num[j] > num[j + 1]) {
                int temp = num[j];
                num[j] = num[j + 1];
                num[j + 1] = temp;
                
            }
        }
    }
    print(num, n);
}

int main() {
    @autoreleasepool {
        int n = 0;
        NSLog(@"请输入需要排序的个数n：");
        scanf("%d",&n);//输入函数不要带n = ？
        NSLog(@"n = %d",n);
//        printf("n = %d",n);
        int num[] = {0};
        for (int i = 0; i < n; i++) {
            num[i] = arc4random() % 10;
//            NSLog(@"请输入第%d个数：",i+1);
        }
//        int num[5] = {54,32,49,78,89};
        bubble_Sort(num, 5);
   
    }
    return 0;
}
