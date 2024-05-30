/*
* Synchronize two threads using mutex
* Join at the end
*/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

const int N_THREADS = 10;
//Prototype of a threaded function
void *function();
//Mutex
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
//Common counter
int counter = 0;



void main() {

    pthread_t threadPool[10];
    
    for(int i = 0; i < N_THREADS; i++) {
        pthread_create(&threadPool[i], NULL, function, NULL);
    }

    for(int j = 0; j < N_THREADS; j++) {
        pthread_join(threadPool[j], NULL);
    }


    

}


//Add pthread_mutex_unlock to fix
void *function() {
    pthread_mutex_lock(&mutex);
    counter++;
    pthread_mutex_unlock(&mutex);

    printf("(t :%ld) counter value: %d\n", pthread_self(), counter);

}



