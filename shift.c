#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    int a = 0x1fb6;

    printf("%x\n", (a >> 4) & 0xf);
    printf("%x\n", (a >> 8) & 0xf);
    printf("%x\n", (a >> 12) & 0xf);
    printf("%x\n", (a) & 0xf);
}
