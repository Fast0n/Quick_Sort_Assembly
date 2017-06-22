#define MAX 5
#include<stdio.h>

void quick_sort(int a[], int sx, int dx);

int main(void) {
    int a[] = {3, 2, 7, 9, 1};
    int i;

    quick_sort(a, 0, MAX-1);
    
    for(i = 0; i < MAX; i++)
        printf("%i\n", a[i]);

    return 0;
}


void quick_sort(int a[], int sx, int dx) {
    int pivot = a[(sx + dx)/2],
        i = sx,
        j = dx,
        tmp;

    while(i <= j) {

        while(a[i] < pivot)
            i++;

        while(a[j] > pivot)
            j--;

        if(i <= j) {
            if(i < j) {
                tmp = a[i];
                a[i] = a[j];
                a[j] = tmp;
            }

            i++;
            j--;
        }
    }

    if(sx < j)
        quick_sort(a, sx, j);
 
    if(i < dx)
        quick_sort(a, i, dx);
}
