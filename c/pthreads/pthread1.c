#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

//Prototype of the functions executed in a thread
void *print_message_function(void *ptr);
void *thread1_routine(void *ptr);
void *thread2_routine(void *ptr);

//Main thread
void main() {
    pthread_t thread1, thread2;
    char *message1 = "Hello from thread1";
    char *message2 = "Hello from thread2";
    int iret1, iret2;

    //Create two independent threads
    iret1 = pthread_create( &thread1, NULL, thread1_routine , (void*) message1);
    iret2 = pthread_create( &thread2, NULL, thread2_routine, (void*) message2);

    //Wait for the treads i.e join threads with the main thread
    //Otherwise process would run to completeion before threads finished

    pthread_join(thread1, NULL);
    pthread_join(thread2, NULL);

    //This will be executed after both threads completed
    printf("Thread 1 returns: %d\n", iret1);
    printf("Thread 2 returns: %d\n", iret2);
    exit(0);
}

void *print_message_function(void *ptr) {
    char *message = (char*) ptr;
    printf("%s\n", message);
}

void *thread1_routine(void *ptr) {
    int i;
    for(i = 0; i <= 10000000; i++);
    printf("Thread 1 completed\n");
}

void *thread2_routine(void *ptr) {
    int i;
    for(i = 0; i <= 100; i++);
    printf("Thread 2 completed \n");
}