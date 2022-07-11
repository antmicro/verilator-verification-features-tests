#include <verilated.h>
#include <Vtop.h>
#define MAX_TIME 1000

uint64_t main_time = 0;
double sc_time_stamp() { return main_time; }

int main(int argc, char *argv[]) {
    Verilated::commandArgs(argc, argv);
    Verilated::debug(0);
    Vtop *top = new Vtop;
    while (!Verilated::gotFinish()) {
        top->eval();
        top->clk = 1 & ~top->clk;
        main_time++;
        if (main_time > MAX_TIME) {
            VL_WRITEF("Test timed out!");
            return -15;
        }
    }
    top->final();
    delete top;
    return 0;
}
