// `include "LED\led.v"   
// 不写这个include在vscode里面会报错因为语法检测器找不到在另外一个文件里面已经定义过的module
// 但是这个include如果放到仿真软件可能会出错因为已经指出来要编译的文件了
// 仿真激励：给LED模块发使能信号
module led_tb();

reg en;         // 模拟输入的使能信号
wire led;       // 观察LED的输出状态

// 实例化LED模块（把激励和LED模块连起来）
led_ctrl u_led(
    .en(en),
    .led(led)
);

// 模拟使能信号的变化（关键：让LED“灭→亮→灭”）
initial begin
    en = 1'b0;  // 初始：不使能→LED灭
    #100;       // 等待100ns
    en = 1'b1;  // 使能→LED亮
    #200;       // 保持亮200ns
    en = 1'b0;  // 不使能→LED灭
    #100;       // 再等100ns
    $stop;      // 仿真结束
end

endmodule