#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

//Prototype of the functions executed in a thread
void *thread1_routine(void *ptr);
void *thread2_routine(void *ptr);
//Thread ID declared at the global scope
pthread_t t1, t2;

//Main thread
void main() {
    int iret1, iret2;

    //Create two independent threads
    iret1 = pthread_create( &t1, NULL, thread1_routine , NULL);
    iret2 = pthread_create( &t2, NULL, thread2_routine, NULL);

    //Wait for the treads i.e join threads with the main thread
    //Otherwise process would run to completeion before threads finished

    pthread_join(t1, NULL);
    pthread_join(t2, NULL);

    //This will be executed after both threads complete
    exit(0);
}

void *thread1_routine(void *ptr) {
    //Thread 1 has access to the "t1" global variable
    printf("Thread 1 ID: %d\n", (int) t1);
}

void *thread2_routine(void *ptr) {
    //Thread 2 has access to the "t2" global variable
    printf("Thread 2 ID: %d\n", (int) t2);
}