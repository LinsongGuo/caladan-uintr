extern "C" {
#include "programs/programs.h"
}

#include "uintr.h"

#include "runtime.h"
#include "sync.h"
#include "thread.h"
#include "timer.h"
// #include <base/log.h>

#include <chrono>
#include <iostream>

barrier_t barrier;

bool synth_barrier_wait() { return barrier_wait(&barrier); }

namespace {

typedef int (*bench_type)(void);

int threads;
uint64_t n;
std::string worker_spec;
// volatile 
int started = 0, finished = 0;

const int BENCH_NUM = 2;
std::string bench_name[BENCH_NUM] = {"linpack", "base64"};
bench_type bench_func[BENCH_NUM] = {linpack, base64};
// std::string bench_name[BENCH_NUM] = {"sum", "sum"};
// bench_type bench_func[BENCH_NUM] = {sum, sum};
bool bench_flag[BENCH_NUM];

void MainHandler(void *arg) {
  rt::WaitGroup wg(1);
  uint64_t cnt[threads] = {};

  barrier_init(&barrier, threads);
	
  int i, bench_num = 0;
  for (i = 0; i < BENCH_NUM; ++i) {
	bench_flag[i] = worker_spec.find(bench_name[i]) != std::string::npos;
	bench_num += bench_flag[i];
  }	
  
  for (i = 0; i < BENCH_NUM; ++i) {
	if (bench_flag[i]) {
  		rt::Spawn([&, i]() {
 			started += 1;
    		printf("%s start: %d\n", bench_name[i].c_str(), started);
			if (started == bench_num) {
				enable_uintr_preempt();
			}
				
			if (started < bench_num) {
//				printf("%s yield start\n", bench_name[i].c_str());			
				rt::Yield();
//				printf("%s yield ends\n", bench_name[i].c_str());
			}	

			_stui();
			// uthread_running_true();
			
			long long t1 = now();
			bench_func[i]();
			long long t2 = now();
  		
			finished += 1;
			if (finished == bench_num) {
				disable_uintr_preempt();
			}

			_clui();
    		// printf("%s end: %d %.3f\n", bench_name[i].c_str(), finished, 1.*(t2-t1)/1e9);
  		});
  	}
  }

  // never returns
  wg.Wait();
}

}  // anonymous namespace

int main(int argc, char *argv[]) {
  int ret;

  if (argc != 5) {
    std::cerr << "usage: [config_file] [#threads] [#n] [worker_spec]"
              << std::endl;
    return -EINVAL;
  }

  threads = std::stoi(argv[2], nullptr, 0);
  n = std::stoul(argv[3], nullptr, 0);
  worker_spec = std::string(argv[4]);
 
  uintr_init();
  
  ret = runtime_init(argv[1], MainHandler, NULL);

  printf("runtime_init ends\n");

  if (ret) {
    printf("failed to start runtime\n");
    return ret;
  }

  return 0;
}
