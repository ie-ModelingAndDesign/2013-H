//
//  main.c
//  ex2.5
//
//  Created by Chie AHAREN on 2013/12/25.
//  Copyright (c) 2013年 Chie AHAREN. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

FILE *global;
//FILE global_array[10];

int main(int argc, const char * argv[])
{
    FILE *local;
    //FILE local_array[10];
    FILE *filemalloc = (void*)malloc(sizeof(void));
    
    printf("%p\n",&global);
    printf("%p\n",&local);
    printf("%p\n",&filemalloc);
    //printf("%p\n",&global_array);
    //printf("%p\n",&local_array);
}

