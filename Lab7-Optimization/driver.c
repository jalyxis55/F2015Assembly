//
//  driver.c
//  sort.c
//
//  COSC 2325- Optimization
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "sort.c"

// set this to the number of sorts to do
#define TCOUNT 5000L

// set this to the maximum data set size to test
#define DSIZE 1000

int data[DSIZE];
int test[DSIZE];

void seed_random();
int get_random(int, int);

// sorting random data minus overhead

int main(int argc, char argv[]) {
    int i;
    int size = 100;
    int pass;
    long count;
    clock_t start, finish;
    clock_t o_start, o_finish;
    double  duration;
    
    seed_random();
    // outer data size sweep
    for(pass = 0;pass<10;pass++) {
        
        // test data
        for(i=0;i<size;i++)
            data[i] = get_random(0,1000);
        
        // time the setup overhead
        count = TCOUNT;
        o_start = clock();
        while( count-- ) {
            for(i=0;i<size;i++)
                test[i] = data[i];
        }
        o_finish = clock();
        
        // time the basic sort for this pass.
        start = clock();
        count = TCOUNT;
        while(count--) {
            for(i=0;i<size;i++)
                test[i] = data[i];
            sort(test,size);
        }
        finish = clock();
        
        duration = (double)((finish - start) - (o_finish - o_start))
        / CLOCKS_PER_SEC;
        printf("Time to sort %d items %ld times is ", size, (long int)TCOUNT);
        printf("%f seconds\n", duration);
        
        // set up for the next pass
        size = size + 100;
    }
    
    // sanity check
    size = size-100;
    for(i=0;i<size-1;i++)
        if(test[i] > test[i+1]) {
            printf("sort failed\n");
            printf("%d > %d\n",test[i],test[i+1]);
            return 1;
        }
    printf("Sort checked OK\n");
}

void seed_random() {
    srand((unsigned)time( NULL ));
}

int get_random(int max, int min) {
    float x,y;
    x = (float)(rand()/(RAND_MAX + 1.0));
    y = (float)(max-min);
    return (int)(x * y) + min;
}
