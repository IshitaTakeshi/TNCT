gcc -c fibonacci_iterative_benchmark.s -o fibonacci_iterative_benchmark.o
gcc -c fibonacci_recursive_benchmark.s -o fibonacci_recursive_benchmark.o
gcc -c benchmark_template.c -o benchmark_template.o
gcc fibonacci_iterative_benchmark.o fibonacci_recursive_benchmark.o benchmark_template.o -o benchmark
