#include "stdio.h"
#include "generated/autoconf.h"

int main(int argc, const char *argv[])
{
	printf("STRING_PARAM is :   "CONFIG_STRING_PARAM"\n");
	int num = CONFIG_NUM_PARAM;
	printf("NUM_PARAM(Integer parameter between 0 an 100) is :  %d\n",num);
	int num2 = CONFIG_NUM_PARAM2;
	printf("NUM_PARAM2 is :  %d\n",num2);
	return 0;
}

