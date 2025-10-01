// LED控制模块：使能时亮，不使能时灭
module led_ctrl(
    input en,        // 使能信号（1=亮，0=灭）
    output reg led   // LED输出（1=高电平亮，0=低电平灭）
);

// 组合逻辑：en变了，led立刻跟着变
always @(*) begin
    if(en == 1'b1) begin
        led = 1'b1;  // 使能→LED亮
    end else begin
        led = 1'b0;  // 不使能→LED灭
    end
end

endmodule