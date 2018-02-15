#include <stdio.h>
#include <sys/time.h>

extern void fibonacci_iterative();
extern void fibonacci_recursive();

long timediff_microseconds(struct timeval end_time, struct timeval start_time) {
    return (end_time.tv_sec - start_time.tv_sec) * 1000000L +
            end_time.tv_usec - start_time.tv_usec;
}

int main() {
    struct timeval start_time, end_time;
    const int n_iterative_executions = 100000000;

    gettimeofday(&start_time, NULL);
    for(int i = 0; i < n_iterative_executions; i++) {
        fibonacci_iterative();
    }
    gettimeofday(&end_time, NULL);
    printf("Iterative: %ld microseconds / %d times\n",
           timediff_microseconds(end_time, start_time), n_iterative_executions);

    gettimeofday(&start_time, NULL);
    fibonacci_recursive();
    gettimeofday(&end_time, NULL);
    printf("Recursive: %ld microseconds\n",
            timediff_microseconds(end_time, start_time));
    return 0;
}
