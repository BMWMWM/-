//
//  09_基数排序.m
//  排序算法1_冒泡排序
//
//  Created by BMW on 2017/7/13.
//  Copyright © 2017年 wb2lz. All rights reserved.
//

#import <Foundation/Foundation.h>


- (void)testBS
{
    int a[] = {2, 343, 342, 1, 123, 43, 4343, 433, 687, 654, 3};
    int *a_p = a;
    //计算数组长度
    int size = sizeof(a) / sizeof(int);
    //基数排序
    bucketSort3(a_p, size);
    //打印排序后结果
    int i;
    for(i = 0; i < size; i++)
    {
        printf("%d\n", a[i]);
    }
    int t;
    scanf("%d", t);
}
//基数排序
voidbucketSort3(int *p, int n)
{
    //获取数组中的最大数
    int maxNum = findMaxNum(p, n);
    //获取最大数的位数，次数也是再分配的次数。
    int loopTimes = getLoopTimes(maxNum);
    int i;
    //对每一位进行桶分配
    for(i = 1; i <= loopTimes; i++)
    {
        sort2(p, n, i);
    }
}
//获取数字的位数
intgetLoopTimes(intnum)
{
    int count = 1;
    int temp = num / 10;
    while(temp != 0)
    {
        count++;
        temp = temp / 10;
    }
    returncount;
}
//查询数组中的最大数
intfindMaxNum(int *p, intn)
{
    int i;
    int max = 0;
    for(i = 0; i < n; i++)
    {
        if(*(p + i) > max)
        {
            max = *(p + i);
        }
    }
    return max;
}
//将数字分配到各自的桶中，然后按照桶的顺序输出排序结果
voidsort2(int *p, int n, int loop)
{
    //建立一组桶此处的20是预设的根据实际数情况修改
    intbuckets[10][20] = {};
    //求桶的index的除数
    //如798个位桶index=(798/1)%10=8
    //十位桶index=(798/10)%10=9
    //百位桶index=(798/100)%10=7
    //tempNum为上式中的1、10、100
    inttempNum = (int)pow(10, loop - 1);
    inti, j;
    for(i = 0; i < n; i++)
    {
        introw_index = (*(p + i) / tempNum) % 10;
        for(j = 0; j < 20; j++)
        {
            if(buckets[row_index][j] == NULL)
            {
                buckets[row_index][j] = *(p + i);
                break;
            }
        }
    }
    //将桶中的数，倒回到原有数组中
    intk = 0;
    for(i = 0; i < 10; i++)
    {
        for(j = 0; j < 20; j++)
        {
            if(buckets[i][j] != NULL)
            {
                *(p + k) = buckets[i][j];
                buckets[i][j] = NULL;
                k++;
            }
        }
    }
}

int main(){
    @autoreleasepool {
        
    }
    return 0;
}
