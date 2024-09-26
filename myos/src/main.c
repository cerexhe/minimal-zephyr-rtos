#include <zephyr/kernel.h>
#include <stdio.h>
#include <zephyr/drivers/uart.h>

#define CONSOLE_DEVICE DEVICE_DT_GET(DT_CHOSEN(zephyr_console))

void main(void) {
  printf("Hello World!\n");
}

