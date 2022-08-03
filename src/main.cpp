#include <verilated.h>
#include <Vtop.h>
#define MAX_TIME 1000

int main(int argc, char *argv[]) {
    Verilated::debug(0);
    Verilated::commandArgs(argc, argv);
    Vtop *top = new Vtop;
    while (!Verilated::gotFinish()) {
        top->eval();
        top->clk = 1 & ~top->clk;
        top->contextp()->timeInc(1);
        if (top->contextp()->time() > MAX_TIME) {
            VL_WRITEF("Test timed out!");
            return -15;
        }
    }
    top->final();
    delete top;
    return 0;
}
