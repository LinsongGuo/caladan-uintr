#include "stdio.h"
#include "programs.h"

const int N = 1e5;
int sum() {
	long long res = 0;
	int i, j;
	for (i = 0; i < N; ++i) {
		for (j = N - 1; j >= 0; --j) {
			res += i | j;
		}
	}
	printf("%lld\n", res);
	return 0;
}
