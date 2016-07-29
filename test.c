#include "stdio.h"
#include "include/generated/autoconf.h"

int main(int argc, const char *argv[])
{
    if (CONFIG_LEDON == 1)
    {
        printf("led on!\n");
    }
    else
    {
        printf("led off, led conf no");
    }

    return 0;
}
