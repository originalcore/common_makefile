#include <stdio.h>
#include "version.h"

const char version_string[] = TEST_VERSION " " TEST_COMPILE_BY "@" TEST_COMPILE_HOST" (" TEST_DATE " - " TEST_TIME ")";

int main(int argc, const char *argv[])
{
	printf("\n\n*********************************************************************\n");
	printf ("\n%s\n", version_string);
	printf("\n*********************************************************************\n\n");

	return 0;
}
