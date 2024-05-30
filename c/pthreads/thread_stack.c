#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

const int NITERS = 10;

//Prototypes
void *functionA(void*);
void *functionB(void*);
int scale(int,int);

typedef struct thread_params {
    int scaling;
    int iterations;
} thread_param;

int main() {
    //Threads parameter structures
    thread_param tp1, tp2;
    tp1.scaling = 2;
    tp1.scaling = 4;
    tp1.iterations, tp2.iterations = NITERS;
    
    //Create two threads
    pthread_t t1, t2;
    pthread_attr_t thread_attribute;
    pthread_attr_init(&thread_attribute);

    int iret1 = pthread_create( &t1, NULL, functionA, (void*)&tp1);
    int iret2 = pthread_create( &t2, NULL, functionB, (void*)&tp2);

    //Thread stack size
    size_t stackSize;
    pthread_attr_getstacksize(&thread_attribute, &stackSize);

    
    //Wait for the threads to finish
    pthread_join(t1, NULL);
    pthread_join(t2, NULL);
}

void *functionA(void *params) {
    int __iterations = ((thread_param*)params)->iterations;
    int __scaling = ((thread_param*)params)->scaling;
    int i;
    for(i = 0; i < __iterations; i++) {
        printf("Thread (%ld) scaled value %d\n", pthread_self(), scale(i,__scaling));
    }
}

void *functionB(void *params) {
    int __iterations = ((thread_param*)params)->iterations;
    int __scaling = ((thread_param*)params)->scaling;
    int i;
    for(i = 0; i < __iterations; i++) {
        printf("Thread (%ld) scaled value %d\n", pthread_self(), scale(i,__scaling));
    }
}

int scale(int input, int scaling) {
    return input * scaling;
}

