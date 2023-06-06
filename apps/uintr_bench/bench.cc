extern "C" {
#include "programs/programs.h"
}

#include "uintr.h"

#include "runtime.h"
#include "sync.h"
#include "thread.h"
#include "timer.h"

#include <chrono>
#include <iostream>

barrier_t barrier;

bool synth_barrier_wait() { return barrier_wait(&barrier); }

namespace {

int threads;
uint64_t n;
std::string worker_spec;

void MainHandler(void *arg) {
  rt::WaitGroup wg(1);
  uint64_t cnt[threads] = {};

  barrier_init(&barrier, threads);

  enable_uintr_preempt();

  rt::Spawn([&]() {
    base64();
    // linpack();
  });

  disable_uintr_preempt();

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

  ret = runtime_init(argv[1], MainHandler, NULL);
  if (ret) {
    printf("failed to start runtime\n");
    return ret;
  }

  return 0;
}
