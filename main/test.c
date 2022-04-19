/***********************************************************************
 * @file      test.c
 * @brief     c file
 * @history
 * Date       Version Author    description
 * ========== ======= ========= =======================================
 * 2018-07-06 V1.0    weihui.jia   Create
 *
 * @Copyright (C)  2018  orignal.Co.Ltd all right reserved
 ***********************************************************************/
/*@{*/

#include <stdio.h>
#include "version.h"


void print_version(void)
{
	printf("\n\n================================================================================\n");
	printf("********************************************************************************\n");
	printf ("%s\n", version_string);
	printf("********************************************************************************\n");
	printf("================================================================================\n\n");
}

int main(int argc, const char *argv[])
{
	print_version();

	return 0;
}
