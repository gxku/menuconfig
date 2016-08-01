#include "stdio.h"
#include "generated/autoconf.h"

int main(int argc, const char *argv[])
{
#ifdef CONFIG_LED_ON 
    {
        printf("led on!\n");
    }
#endif

#ifdef CONFIG_LED_OFF 
    {
        printf("led off, led conf no");
    }
#endif
#	if(CONFIG_SHOW_MORE)
		printf("it seems led off,you can turn on it! \n");
#endif 
   return 0;
}
