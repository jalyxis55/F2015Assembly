//c version to get me started: fibonacci sequence
//Gina Hall
//COSC 2325
#include<stdio.h>

int refib(int);

int main() {
    int n;
    int i = 0;
    int num = 0;

    printf("Enter a positive number of terms to calculate\n");
    scanf("%d", &n);

    for (i = 1; i <= n; i++){
        printf("%d ", refib(num));
        num++;
    }
    printf("\n");
    return 0;
}

int refib(int num) {
    if (num == 0) {
        return 0;
    } else if (num == 1) {
        return 1;
    } else {
        return (refib(num-1) + refib(num-2));
    }
}
