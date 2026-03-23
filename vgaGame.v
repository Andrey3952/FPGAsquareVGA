`timescale 1ns / 1ps
module vgaGame(
    input wire clk, rts,
    output wire h_sync, v_sync,
    output wire red, green, blue
);

reg pixel_en;

parameter H_DISPLAY = 640;
parameter H_MAX = 800;

parameter V_DISPLAY = 480;
parameter V_MAX = 525;

parameter H_SIZE = 50; // Довжина квадрата 
parameter V_SIZE = 50; // Висота квадрата 

parameter SPEED = 1;


reg [9:0] h_count = 0;
reg [9:0] v_count = 0;

always @(posedge clk or negedge rts)begin
    if(!rts)begin
        pixel_en <= 0;
    end else begin
        pixel_en <= ~pixel_en;
    end
end 

always @(posedge clk or negedge  rts)begin
    if(!rts)begin
        h_count <= 0;
        v_count <= 0;
    end else begin
        if(pixel_en)begin
            if(h_count == (H_MAX - 1)) begin 
                h_count <= 0;
                if(v_count == (V_MAX - 1))begin
                    v_count <=0;
                end else begin
                    v_count <= v_count + 1;
                end
            end else begin 
                h_count <= h_count + 1;
            end
        end
    end
end

assign h_sync = (h_count >= 656 && h_count < 752) ? 1'b0 : 1'b1;
assign v_sync = (v_count >= 490 && v_count < 492) ? 1'b0 : 1'b1;
wire video_on;
assign video_on = (h_count < H_DISPLAY && v_count < V_DISPLAY);





reg [9:0] y_pos = 190;  // Початкова координата верхнього краю квадрата
reg [9:0] x_pos = 270;
reg [25:0] counter = 0;
reg dir_down = 1;       // 1 - падаємо вниз, 0 - летимо вгору
reg dir_right = 1;
reg [2:0] box_color = 3'b111;

always @(posedge clk or negedge rts) begin
    if(!rts) begin
        y_pos <= 190;
        x_pos <= 270;
        counter <= 0;
        dir_down <= 1;
        dir_right <= 1;
    end else begin
        if(counter >= 833_333 - 1) begin
            counter <= 0;
            if(dir_down) begin
                if(y_pos + V_SIZE + SPEED >= 480) begin // 100 - це висота твого квадрата. Якщо нижній край торкнувся 480...
                    dir_down <= ~dir_down;           // ...міняємо напрямок на "вгору"
                    box_color <= (box_color == 3'b111) ? 3'b001 : box_color + 1;
                end else begin
                    y_pos <= y_pos + SPEED;      // Інакше продовжуємо падати
                end
            end else begin
                if(y_pos < SPEED) begin         // Якщо верхній край торкнувся стелі (0)...
                    dir_down <= ~dir_down;           // ...міняємо напрямок на "вниз"
                    box_color <= (box_color == 3'b111) ? 3'b001 : box_color + 1;
                end else begin
                    y_pos <= y_pos - SPEED;      // Інакше продовжуємо летіти вгору
                end
            end 
            if(dir_right)begin
                if(x_pos + H_SIZE + SPEED >= 640) begin
                    dir_right <= ~dir_right;
                    box_color <= (box_color == 3'b111) ? 3'b001 : box_color + 1;
                end else begin
                    x_pos <= x_pos + SPEED;
                end
            end else begin
                if(x_pos < SPEED) begin
                    dir_right <= ~dir_right;
                    box_color <= (box_color == 3'b111) ? 3'b001 : box_color + 1;
                end else begin
                    x_pos <= x_pos - SPEED;
                end
            end          
        end else begin
            counter <= counter + 1;
        end
    end
end

assign red = (video_on && v_count >= y_pos && v_count < (y_pos + V_SIZE) && h_count >= x_pos && h_count < (x_pos + H_SIZE)) ? box_color[2] : 1'b0;
assign green = (video_on && v_count >= y_pos && v_count < (y_pos + V_SIZE) && h_count >= x_pos && h_count < (x_pos + H_SIZE)) ? box_color[1] : 1'b0;
assign blue = (video_on && v_count >= y_pos && v_count < (y_pos + V_SIZE) && h_count >= x_pos && h_count < (x_pos + H_SIZE)) ? box_color[0] : 1'b0;


// assign green = (video_on) ? 1'b1 : 1'b0;
// assign blue = (video_on) ? 1'b1 : 1'b0;


// v_count висота 480 
// h_count довжина 640

endmodule

