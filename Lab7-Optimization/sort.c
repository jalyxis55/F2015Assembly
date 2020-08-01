//
//  driver.c
//  sort.c
//
//  COSC 2325- Optimization
//

#include <stdio.h>

void sort(int A[], int count) {
    int temp,i,j,k;
    for(i=0; i<count-1 ;i++) {
        for(j=0; j<count-1-i; j++)
            if(A[j] > A[j+1]) {
                temp = A[j];
                A[j] = A[j+1];
                A[j+1] = temp;
            }
    }
}
