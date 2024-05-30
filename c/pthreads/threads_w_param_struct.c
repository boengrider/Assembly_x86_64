/*
* Create a new thread and pass a pointer to a structure
* which holds thread parameters
*/
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>


//Structure passed to the threaded function
typedef struct thread_params {
    int sleepDuration;
} thread_param;

//thread_params 'constructor'
void thread_params_init(thread_param*, int);
int getSeconds(thread_param*);
void *thread_function1(void *);

int main() {

    //Prepare thread parameters
    thread_param thread1_params;
    thread_params_init(&thread1_params, 10);
    
    //Create a new thread
    int iret1;
    pthread_t t1;
    iret1 = pthread_create(&t1, NULL, thread_function1, (void*)&thread1_params);

    //Do some work on the main thread
    for(int i = 0; i < 1000; i++) {
        if(i % 100 == 0) printf("Main thread doing work\n");
    }

    
    //Finally wait for the child thread to finish
    pthread_join(t1, NULL);
    
    
}


void thread_params_init(thread_param *tp, int seconds) {
    tp->sleepDuration = seconds;
}

int getSeconds(thread_param *tp) {

    return tp->sleepDuration;
}

void *thread_function1(void *params) {
    int __seconds = ((thread_param*)params)->sleepDuration;
    printf("Thread 1 sleeping for %d seconds\n",__seconds);
    sleep(__seconds);
    printf("Thread 1 resumed\n");
}

