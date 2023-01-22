// Address of GPIO18' config register
volatile unsigned int * GPIO18_CFG = (unsigned int *) 0x2000090C;

void led_setup(void) {
    // funcsel gpio and output enable
    *GPIO18_CFG |= 11 << 8 | (1 << 6);
    // not input enable, pull-down or pull-up
    *GPIO18_CFG &= ~( 1<<0 | 1<<4 | 1<<5 );
}

void led_on(void) {
    // Set output high
    *GPIO18_CFG |= 1 << 24;
}


void led_off(void) {
    // Set output low
    *GPIO18_CFG &= ~(1<<24);
}

void simple_delay(void) {
    volatile unsigned int count = 1000000;
    while(--count != 0){};
}

int main(int argc, char** argv) {
    led_setup();
    while(1) {
        led_on();
        simple_delay();
        led_off();
        simple_delay();
    }
    return 0;
}

void SystemInit(void) {
    // Perform any pre-main setup here.
    // Or don't.
}