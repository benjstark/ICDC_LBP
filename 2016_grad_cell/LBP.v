
`timescale 1ns/10ps
module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, lbp_valid, lbp_data, finish);
input           clk;
input           reset;
output [13:0]   gray_addr;
output         	gray_req;
input   	    gray_ready;
input  [7:0] 	gray_data;
output [13:0] 	lbp_addr;
output  	    lbp_valid;
output [7:0] 	lbp_data;
output      	finish;

reg [6:0] pos_x, pos_y;
reg [3:0] cnt;
//====================================================================
// state
reg [2:0] cs, ns;
parameter [2:0] IDLE        = 3'h0,
                READ        = 3'h1,
                PROCESS     = 3'h2,
                OUT_DATA    = 3'h3,
                DONE        = 3'h4;

always @(posedge clk or posedge reset)begin
    if(reset)begin
        cs <= IDLE;
    end
    else begin
        cs <= ns;
    end
end

always @(*)begin
    case(cs)
        IDLE:begin
            if(gray_ready)  ns <= READ;
            else            ns <= IDLE;
        end
        READ:begin
            if((!(| pos_x)) || (& pos_x) || (!(| pos_y)) || (& pos_y))   ns <= OUT_DATA;
            else                                                         ns <= PROCESS;
        end
        PROCESS:begin
            if(cnt == 4'ha) ns <= OUT_DATA;
            else            ns <= PROCESS;
            // ns <= OUT_DATA;
        end
        OUT_DATA:begin
            if((& pos_y) && (& pos_x))  ns <= DONE;
            else            ns <= READ;
        end
        default:            ns <= IDLE;
    endcase
end
//====================================================================
// position

always @(posedge clk or posedge reset)begin
    if(reset)begin
        {pos_y, pos_x} <= 14'h0;
    end
    else begin
        case(cs)
            IDLE:   {pos_y, pos_x} <= 14'h0;
            OUT_DATA:begin
                {pos_y, pos_x} <= {pos_y, pos_x} + 14'h1;
            end
        endcase
    end
end

//====================================================================
// gray
reg gray_req;
reg [13:0] gray_addr;

always @(posedge clk or posedge reset)begin
    if(reset)begin
        gray_req <= 1'h0;
    end
    else begin
        if(ns == PROCESS)  gray_req <= 1'h1;
        else            gray_req <= 1'h0;
    end
end

always @(*)begin
    case(cnt)
        4'h0:   gray_addr <= {pos_y, pos_x};
        4'h1:   gray_addr <= {pos_y - 4'h1, pos_x - 4'h1};
        4'h2:   gray_addr <= {pos_y - 4'h1, pos_x};
        4'h3:   gray_addr <= {pos_y - 4'h1, pos_x + 4'h1};
        4'h4:   gray_addr <= {pos_y, pos_x - 4'h1};
        4'h5:   gray_addr <= {pos_y, pos_x + 4'h1};
        4'h6:   gray_addr <= {pos_y + 4'h1, pos_x - 4'h1};
        4'h7:   gray_addr <= {pos_y + 4'h1, pos_x};
        4'h8:   gray_addr <= {pos_y + 4'h1, pos_x + 4'h1};
        default:gray_addr <= {pos_y, pos_x};
    endcase
end
//====================================================================
// LBP_PROCESS
reg [7:0] lbp;
reg [7:0] gray_center;
// wire compare;
reg compare;

// assign gray_center = (!cnt) ? gray_data : gray_center;

always @(posedge clk or posedge reset)begin
    if(reset)begin
        cnt <= 4'h0;
    end
    else begin
        if(cs == PROCESS)begin
            if(cnt < 4'ha)  cnt <= cnt + 4'h1;
            else            cnt <= 4'h0;
        end
    end
end

always @(posedge clk or posedge reset)begin
    if(reset)begin
        compare <= 1'h0;
    end
    else begin
        if(!cnt)    compare <= 1'h0;
        else        compare <= (gray_data >= gray_center) ? 1'h1 : 1'h0;
    end
end

always @(posedge clk or posedge reset)begin
    if(reset)begin
        gray_center <= 8'h0;
    end
    else begin
        gray_center <= (!cnt) ? gray_data : gray_center;
    end
end

always @(posedge clk or posedge reset)begin
    if(reset)begin
        lbp <= 8'h0;
    end
    else begin
        case(cnt)
            0:          lbp <= 8'h0;
            1:          lbp <= 8'h0;
            2:          lbp[0] <= compare;
            3:          lbp[1] <= compare;
            4:          lbp[2] <= compare;
            5:          lbp[3] <= compare;
            6:          lbp[4] <= compare;
            7:          lbp[5] <= compare;
            8:          lbp[6] <= compare;
            9:          lbp[7] <= compare;
            default:    lbp <= 8'h0;
        endcase
    end
end
//====================================================================
// LBP_OUTPUT
reg lbp_valid;
reg [7:0] lbp_data;
wire [13:0] lbp_addr;

assign lbp_addr = {pos_y, pos_x};

always @(posedge clk or posedge reset)begin
    if(reset)begin
        lbp_valid <= 1'h0;
    end
    else begin
        if(ns == OUT_DATA)  lbp_valid <= 1'h1;
        else                lbp_valid <= 1'h0;
    end
end

always @(posedge clk or posedge reset)begin
    if(reset)begin
        lbp_data <= 8'h0;
    end
    else begin
        if(ns == OUT_DATA)begin
            if((!(| pos_x)) || (& pos_x) || (!(| pos_y)) || (& pos_y))   lbp_data <= 8'h0;
            else                                                         lbp_data <= lbp;
        end
    end
end
//====================================================================
// finish
reg finish;

always @(posedge clk or posedge reset)begin
    if(reset)begin
        finish <= 1'h0;
    end
    else begin
        if(ns == DONE)  finish <= 1'h1;
        else            finish <= 1'h0;
    end
end
//====================================================================
endmodule
