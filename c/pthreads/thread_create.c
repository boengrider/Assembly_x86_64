#include <pthread.h>


void *do_nothing_function();

int main() {
    pthread_t t1;
    int iret1;

    iret1 = pthread_create(&t1, NULL, do_nothing_function, NULL);

    pthread_join(t1, NULL);
}


void *do_nothing_function() {
    
}
