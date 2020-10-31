#include <stdio.h>
#include <stdlib.h>

#define Ensure(Code) if (!(Code)) return 0;

int main(int argc, char **argv)
{
	Ensure(argc == 3);

	unsigned long long start, end, diff;
	Ensure(sscanf(argv[1], "%llu", &start) == 1);
	Ensure(sscanf(argv[2], "%llu", &end) == 1);
	Ensure(start != end);
 	
	/* use diff as temporary variable */
	if (start > end) { diff = start; start = end; end = diff; }
	diff = end - start;

	char const* names[] = { "s", "min", "h" };
	int it = 0;
	for (; diff >= 60 && it < 3; ++it) {
		diff /= 60;
	}

	if (diff == 0) diff = 1;
	printf(" took %llu%s\n", diff, names[it]);
	return 0;
}

