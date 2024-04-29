#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

//Prototype of the functions executed in a thread
void *thread1_routine(void *ptr);
void *thread2_routine(void *ptr);

//Main thread
void main() {
    int iret1, iret2;

    //Thread id variables declared at the local scope of the main function
    pthread_t t1, t2;
    
    //Create two independent threads
    //Pass tread ID as an argument to the function executed on a trhead
    iret1 = pthread_create( &t1, NULL, thread1_routine, (void*) &t1);
    iret2 = pthread_create( &t2, NULL, thread2_routine, (void*) &t2);

    //Wait for the treads i.e join threads with the main thread
    //Otherwise process would run to completeion before threads finished

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    //This will be executed after both threads complete
    exit(0);
}

void *thread1_routine(void *ptr) {
    printf("Thread 1 ID: %d\n", *(int*) ptr);
}

void *thread2_routine(void *ptr) {
    printf("Thread 2 ID: %d\n", *(int*) ptr);
}