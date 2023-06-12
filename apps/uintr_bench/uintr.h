#ifndef LIBIUNTR_H
#define LIBIUNTR_H

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <x86intrin.h>
#include <errno.h>

// Caladan runtime
#include "runtime.h"
#include "thread.h"

// #define __USE_GNU
#include <pthread.h>
#include <sched.h>

#ifndef __NR_uintr_register_handler
#define __NR_uintr_register_handler	471
#define __NR_uintr_unregister_handler	472
#define __NR_uintr_create_fd		473
#define __NR_uintr_register_sender	474
#define __NR_uintr_unregister_sender	475
#define __NR_uintr_wait			476
#endif

#define uintr_register_handler(handler, flags)	syscall(__NR_uintr_register_handler, handler, flags)
#define uintr_unregister_handler(flags)		syscall(__NR_uintr_unregister_handler, flags)
#define uintr_create_fd(vector, flags)		syscall(__NR_uintr_create_fd, vector, flags)
#define uintr_register_sender(fd, flags)	syscall(__NR_uintr_register_sender, fd, flags)
#define uintr_unregister_sender(ipi_idx, flags)	syscall(__NR_uintr_unregister_sender, ipi_idx, flags)
#define uintr_wait(flags)			syscall(__NR_uintr_wait, flags)

#define TOKEN 0
int uintr_sent = 0, uintr_recv = 0;
int uintr_fd;
long long interval;
long long start, end;
volatile int uintr_timer_flag = 0;

void uintr_summary(void);

long long now() {
	struct timespec ts;
	timespec_get(&ts, TIME_UTC);
	return ts.tv_sec * 1e9 + ts.tv_nsec;
}

void set_thread_affinity_numa(int numa, int core, int thread) {
	if (thread == 1)
		core += 80;
	if (numa == 1)
		core += 40;	
	cpu_set_t mask;
	CPU_ZERO(&mask);
	CPU_SET(core, &mask);
	sched_setaffinity(0, sizeof(mask), &mask);
}

void print_entry() {
	printf("entry\n");
}

void print_exit() {
	printf("exit\n");
}

void __attribute__ ((interrupt))
     __attribute__((target("general-regs-only", "inline-all-stringops")))
     ui_handler(struct __uintr_frame *ui_frame,
		unsigned long long vector) {
	
	// print_entry();
	
	++uintr_recv;
	rt::Yield();	

	int i = 0;
	for (i = 0; i < 10; ++i);
    
	_stui();	

	// print_exit();		
}

void uintr_timer_start() {
	uintr_timer_flag = 1;
	start = now();
	// printf("enable: %d\n", uintr_timer_flag);
}

void uintr_timer_end() {
	end = now();
	uintr_timer_flag = -1;
}

void *timer(void *arg) {
    set_thread_affinity_numa(0, 2, 0);
	    
    int uipi_index = uintr_register_sender(uintr_fd, 0);

	/*int uipi_index[2], i;
	for (i = 0; i < 2; ++i) {
		uipi_index[i] = uintr_register_sender(uintr_fd[i], 0);
	}*/

	
    long long last = now(), current;
	while (uintr_timer_flag != -1) {
        current = now();
		// printf("%lld %d\n", current, uintr_timer_flag);
		
		if (!uintr_timer_flag) {
			last = current;
			continue;
		}

        if (current - last >= interval) {
			last = current;
			// printf("sneduipi %d\n", uipi_index);
            _senduipi(uipi_index);
			uintr_sent ++;
        }
    } 
	
	// uintr_summary();
    
	return NULL;
}

void uintr_init()
{
	if (uintr_register_handler(ui_handler, 0))
		exit(-1);

	uintr_fd = uintr_create_fd(TOKEN, 0);
	if (uintr_fd < 0)
		exit(-1);

/*
	int i; 
	for (i = 0; i < 2; ++i) {
		uintr_fd[i] = uintr_create_fd(i, 0);
		if (uintr_fd[i] < 0)
			exit(-1);
	}
*/

	// Enable interrupts
	// _stui();

	interval = atoi(getenv("INT_INTERVAL")) * 1000L;
	printf("interval: %lld\n", interval);
	
	// Create the timer thread
	pthread_t pt;
	if (pthread_create(&pt, NULL, &timer, NULL)) 
		exit(-1);

}

void uintr_summary(void)
{
	/*
	int i;
	for (i = 1; i <= uintr_cnt; ++i) {
		printf("%lld\n",ts[i] - ts[0]); 
	}*/

	// printf("start = %lld, end = %lld, time = %lld\n", start, end, end - start);
    printf("Execution: %.9f\n", 1.*(end - start) / 1e9);
    printf("Uintrs_received: %d\n", uintr_recv);	
    printf("Uintrs_sent: %d\n", uintr_sent);
}

#endif //LIBIUNTR_H
