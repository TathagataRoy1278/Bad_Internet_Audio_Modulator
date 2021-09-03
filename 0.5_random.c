#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int main(int argc, char *argv[])
{
	srand(time(0));
	int n = atoi(argv[1]);

	for(int i = 0;i<n*1000;i++)
		printf("%.2f\n", fabs((float)rand()/(float)RAND_MAX - 0.5));
}
