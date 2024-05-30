/*
* Synchronize two threads using mutex
* Introduce a deadlock
*/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


//Prototype of a threaded function
void *function_t1();
void *function_t2();
//Mutex
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
//Common counter
int counter = 0;



void main() {

    int iret1, iret2;
    pthread_t t1, t2;

    pthread_create( &t1, NULL, function_t1, NULL);
    pthread_create( &t2, NULL, function_t2, NULL);

    pthread_join( t1, NULL);
    pthread_join( t2, NULL);

    exit(0);

    

}


//Add pthread_mutex_unlock to fix
void *function_t1() {
    pthread_mutex_lock(&mutex);
    counter++;
    printf("(t1) counter value: %d\n",counter);
    //1st thread does not unlock the mutex. deadlock
}

void *function_t2() {
    pthread_mutex_lock(&mutex);
    counter++;
    printf("(t2) counter value: %d\n",counter);
    pthread_mutex_unlock(&mutex);
}

