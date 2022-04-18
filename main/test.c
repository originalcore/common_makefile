#include <stdio.h>
//#include "version.h"

//const char version_string[] = TEST_VERSION " " TEST_COMPILE_BY "@" TEST_COMPILE_HOST" (" TEST_DATE " - " TEST_TIME ")";
const char version_string[] = "1.0.0.2022-04-18 23:26:00";

int main(int argc, const char *argv[])
{
	printf("\n\n***********************************************************\n");
	printf ("\n\n\n%s\n\n\n", version_string);
	printf("\n***********************************************************\n\n");

	return 0;
}
