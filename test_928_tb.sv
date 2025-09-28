module counter_tb;

    // 输入信号
    logic clk;      // 使用 logic 类型（SystemVerilog 推荐）
    logic rst_n;
    // 输出信号
    logic [3:0] q;

    // 实例化被测模块（DUT: Design Under Test）
    counter uut (
        .clk(clk),
        .rst_n(rst_n),
        .q(q)
    );

    // 生成时钟（周期 10ns）
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 测试过程
    initial begin
        // 初始化
        rst_n = 0;         // 复位有效
        @(posedge clk);    // 等待第一个时钟上升沿
        @(posedge clk);    // 再等一个时钟周期

        // 释放复位
        rst_n = 1;

        // 运行一段时间
        repeat (20) @(posedge clk);

        // 中途再次复位
        rst_n = 0;
        repeat (5) @(posedge clk);

        // 再次释放复位
        rst_n = 1;
        repeat (10) @(posedge clk);

        // 结束仿真
        $stop;
    end

    // 波形记录（可选）
    initial begin
        $dumpfile("waveform.vcd");   // 生成波形文件
        $dumpvars(0, counter_tb);    // 记录所有信号
    end

endmodule