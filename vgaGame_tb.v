`timescale 1ns/1ps

module vgaGame_tb();

    reg clk;
    reg rts;

    vgaGame uut (
        .clk(clk),
        .rts(rts)
    );

    initial begin

        $dumpfile("waveform.vcd");
        $dumpvars(0, vgaGame_tb);
        clk = 0;
        rts = 0; // Початковий стан - reset активний

        #20; // Зачекаємо трохи перед зняттям reset
        rts = 1; // Знімаємо reset

        #400000; // Достатньо часу для кількох циклів лічильника

        $finish; // Завершуємо симуляцію
    end

    always #5 clk = ~clk; // Генерація тактового сигналу з періодом 20 нс
endmodule