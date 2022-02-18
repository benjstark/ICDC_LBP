/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : S-2021.06-SP2
// Date      : Fri Feb 18 15:48:52 2022
/////////////////////////////////////////////////////////////


module LBP_DW01_inc_0_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_1_DW01_inc_2 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP_DW01_inc_2_DW01_inc_3 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2XL U1 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
  INVXL U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module LBP ( clk, reset, gray_addr, gray_req, gray_ready, gray_data, lbp_addr, 
        lbp_valid, lbp_data, finish );
  output [13:0] gray_addr;
  input [7:0] gray_data;
  output [13:0] lbp_addr;
  output [7:0] lbp_data;
  input clk, reset, gray_ready;
  output gray_req, lbp_valid, finish;
  wire   n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, N53,
         N54, N55, N56, N57, N58, N59, N60, N61, N62, N63, N64, N65, N66, N127,
         N128, N129, N130, N131, N132, N134, N135, N136, N137, N138, N139,
         N154, N155, N156, N157, N158, N159, N160, N175, N176, N177, N178,
         N179, N180, N181, N222, N225, n9, n10, n11, n15, n17, n19, n21, n23,
         n25, n26, n28, n30, n31, n32, n34, n36, n38, n40, n42, n43, n46, n47,
         n48, n49, n50, n51, n52, n54, n55, n57, n61, n62, n63, n64, n65, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n79, n80, n81, n83, n85, n87,
         n88, n89, n91, n93, n95, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n189, n191, n193, n203, n206, n208,
         n210, n214, n219, n222, n223, n224, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n281;
  wire   [2:0] ns;
  wire   [7:0] gray_center;

  LBP_DW01_inc_0_DW01_inc_1 add_68 ( .A({n282, n283, n281, n285, n214, n189, 
        n288, n289, n290, n210, n292, n293, n294, n295}), .SUM({N66, N65, N64, 
        N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53}) );
  LBP_DW01_inc_1_DW01_inc_2 r411 ( .A({n282, n283, n281, n285, n214, n189, 
        n288}), .SUM({N181, N180, N179, N178, N177, N176, N175}) );
  LBP_DW01_inc_2_DW01_inc_3 r410 ( .A({n208, n290, n210, n292, n206, n294, 
        n219}), .SUM({N160, N159, N158, N157, N156, N155, N154}) );
  DFFRX1 \lbp_reg[7]  ( .D(n168), .CK(clk), .RN(n264), .QN(n145) );
  DFFRX1 \lbp_reg[6]  ( .D(n167), .CK(clk), .RN(n264), .QN(n146) );
  DFFRX1 \lbp_reg[5]  ( .D(n166), .CK(clk), .RN(n233), .QN(n147) );
  DFFRX1 \lbp_reg[4]  ( .D(n165), .CK(clk), .RN(n233), .QN(n148) );
  DFFRX1 \lbp_reg[3]  ( .D(n164), .CK(clk), .RN(n233), .QN(n149) );
  DFFRX1 \lbp_reg[2]  ( .D(n163), .CK(clk), .RN(n264), .QN(n150) );
  DFFRX1 \lbp_reg[1]  ( .D(n162), .CK(clk), .RN(n232), .QN(n151) );
  DFFRX1 \lbp_reg[0]  ( .D(n161), .CK(clk), .RN(n232), .QN(n152) );
  DFFRX1 \cs_reg[2]  ( .D(ns[2]), .CK(clk), .RN(n232), .Q(n187), .QN(n110) );
  DFFRX1 \cs_reg[0]  ( .D(ns[0]), .CK(clk), .RN(n232), .Q(n186), .QN(n126) );
  DFFRX1 \cnt_reg[2]  ( .D(n121), .CK(clk), .RN(n233), .Q(n184), .QN(n109) );
  DFFRX1 \cnt_reg[0]  ( .D(n123), .CK(clk), .RN(n264), .QN(n143) );
  DFFRX1 \cnt_reg[1]  ( .D(n120), .CK(clk), .RN(n233), .Q(n185), .QN(n142) );
  DFFRX1 \pos_x_reg[0]  ( .D(n181), .CK(clk), .RN(n233), .Q(n295), .QN(n133)
         );
  DFFRX1 \pos_y_reg[0]  ( .D(n174), .CK(clk), .RN(n233), .Q(n288), .QN(n140)
         );
  DFFRX1 \pos_x_reg[5]  ( .D(n176), .CK(clk), .RN(n233), .Q(n290), .QN(n128)
         );
  DFFRX1 \pos_y_reg[5]  ( .D(n169), .CK(clk), .RN(n233), .Q(n283), .QN(n135)
         );
  DFFRX1 \pos_x_reg[3]  ( .D(n178), .CK(clk), .RN(n232), .Q(n292), .QN(n130)
         );
  DFFRX1 \pos_y_reg[3]  ( .D(n171), .CK(clk), .RN(n233), .Q(n285), .QN(n137)
         );
  DFFRX1 \pos_y_reg[2]  ( .D(n172), .CK(clk), .RN(n233), .Q(n286), .QN(n138)
         );
  DFFRX1 \pos_y_reg[6]  ( .D(n182), .CK(clk), .RN(n232), .Q(n282), .QN(n134)
         );
  DFFRX1 \pos_x_reg[4]  ( .D(n177), .CK(clk), .RN(n233), .Q(n291), .QN(n129)
         );
  DFFRX1 \pos_y_reg[4]  ( .D(n170), .CK(clk), .RN(n233), .Q(n284), .QN(n136)
         );
  DFFRX1 \pos_x_reg[2]  ( .D(n179), .CK(clk), .RN(n233), .Q(n293), .QN(n131)
         );
  DFFRX1 finish_reg ( .D(ns[2]), .CK(clk), .RN(n232), .QN(n203) );
  DFFRX1 \lbp_data_reg[0]  ( .D(n153), .CK(clk), .RN(n232), .Q(n303), .QN(n108) );
  DFFRX1 \lbp_data_reg[1]  ( .D(n154), .CK(clk), .RN(n232), .Q(n302), .QN(n107) );
  DFFRX1 \lbp_data_reg[2]  ( .D(n155), .CK(clk), .RN(n232), .Q(n301), .QN(n106) );
  DFFRX1 \lbp_data_reg[3]  ( .D(n156), .CK(clk), .RN(n232), .Q(n300), .QN(n105) );
  DFFRX1 \lbp_data_reg[4]  ( .D(n157), .CK(clk), .RN(n232), .Q(n299), .QN(n104) );
  DFFRX1 \lbp_data_reg[5]  ( .D(n158), .CK(clk), .RN(n232), .Q(n298), .QN(n103) );
  DFFRX1 \lbp_data_reg[6]  ( .D(n159), .CK(clk), .RN(n232), .Q(n297), .QN(n102) );
  DFFRX1 \lbp_data_reg[7]  ( .D(n160), .CK(clk), .RN(n232), .Q(n296), .QN(n101) );
  DFFRX1 lbp_valid_reg ( .D(n124), .CK(clk), .RN(n232), .QN(n193) );
  DFFRX1 gray_req_reg ( .D(n183), .CK(clk), .RN(n233), .QN(n191) );
  DFFRX1 \pos_x_reg[1]  ( .D(n180), .CK(clk), .RN(n232), .Q(n294), .QN(n132)
         );
  DFFRX1 \pos_y_reg[1]  ( .D(n173), .CK(clk), .RN(n233), .Q(n287), .QN(n139)
         );
  DFFRX1 \gray_center_reg[0]  ( .D(n111), .CK(clk), .RN(n264), .Q(
        gray_center[0]), .QN(n258) );
  DFFRX1 \gray_center_reg[7]  ( .D(n118), .CK(clk), .RN(n264), .Q(
        gray_center[7]) );
  DFFRX1 \gray_center_reg[5]  ( .D(n116), .CK(clk), .RN(n264), .Q(
        gray_center[5]) );
  DFFRX1 \gray_center_reg[3]  ( .D(n114), .CK(clk), .RN(n264), .Q(
        gray_center[3]) );
  DFFRX1 \gray_center_reg[1]  ( .D(n112), .CK(clk), .RN(n264), .Q(
        gray_center[1]) );
  DFFRX1 \gray_center_reg[4]  ( .D(n115), .CK(clk), .RN(n264), .Q(
        gray_center[4]) );
  DFFRX1 \gray_center_reg[2]  ( .D(n113), .CK(clk), .RN(n264), .Q(
        gray_center[2]) );
  DFFRX1 \gray_center_reg[6]  ( .D(n117), .CK(clk), .RN(n264), .Q(
        gray_center[6]), .QN(n259) );
  DFFRXL \cs_reg[1]  ( .D(ns[1]), .CK(clk), .RN(n264), .Q(n278), .QN(n125) );
  DFFRX1 \cnt_reg[3]  ( .D(n119), .CK(clk), .RN(n264), .Q(n276), .QN(n141) );
  DFFRX1 \pos_x_reg[6]  ( .D(n175), .CK(clk), .RN(n264), .Q(n289), .QN(n127)
         );
  DFFRX2 compare_reg ( .D(N225), .CK(clk), .RN(n264), .QN(n144) );
  AOI222X1 U160 ( .A0(n77), .A1(lbp_addr[3]), .B0(N136), .B1(n79), .C0(N157), 
        .C1(n80), .Y(n85) );
  AOI222X1 U161 ( .A0(n71), .A1(lbp_addr[7]), .B0(N175), .B1(n72), .C0(n140), 
        .C1(n73), .Y(n75) );
  INVX3 U162 ( .A(reset), .Y(n264) );
  AOI32X2 U163 ( .A0(n126), .A1(n125), .A2(gray_ready), .B0(n55), .B1(n186), 
        .Y(n54) );
  AOI222X1 U164 ( .A0(n71), .A1(lbp_addr[10]), .B0(N178), .B1(n72), .C0(N129), 
        .C1(n73), .Y(n95) );
  AOI222X1 U165 ( .A0(n71), .A1(n281), .B0(N179), .B1(n72), .C0(N130), .C1(n73), .Y(n93) );
  AOI222X1 U166 ( .A0(n71), .A1(n214), .B0(N177), .B1(n72), .C0(N128), .C1(n73), .Y(n70) );
  AOI222X1 U167 ( .A0(n71), .A1(n189), .B0(N176), .B1(n72), .C0(N127), .C1(n73), .Y(n74) );
  AOI222X1 U168 ( .A0(n71), .A1(lbp_addr[12]), .B0(N180), .B1(n72), .C0(N131), 
        .C1(n73), .Y(n91) );
  NAND3X2 U169 ( .A(n34), .B(n26), .C(n48), .Y(n73) );
  AOI222X1 U170 ( .A0(n77), .A1(lbp_addr[4]), .B0(N137), .B1(n79), .C0(N158), 
        .C1(n80), .Y(n83) );
  AOI222X1 U171 ( .A0(n77), .A1(lbp_addr[2]), .B0(N135), .B1(n79), .C0(N156), 
        .C1(n80), .Y(n87) );
  AOI222X1 U172 ( .A0(n77), .A1(lbp_addr[1]), .B0(N134), .B1(n79), .C0(N155), 
        .C1(n80), .Y(n88) );
  AOI222X1 U173 ( .A0(n77), .A1(lbp_addr[5]), .B0(N138), .B1(n79), .C0(N159), 
        .C1(n80), .Y(n81) );
  AOI222X1 U174 ( .A0(n77), .A1(n219), .B0(n133), .B1(n79), .C0(N154), .C1(n80), .Y(n98) );
  NAND3X2 U175 ( .A(n268), .B(n48), .C(n267), .Y(n79) );
  INVX12 U176 ( .A(n83), .Y(gray_addr[4]) );
  INVX12 U177 ( .A(n93), .Y(gray_addr[11]) );
  INVX12 U178 ( .A(n87), .Y(gray_addr[2]) );
  NAND3X2 U179 ( .A(n26), .B(n274), .C(n270), .Y(n80) );
  INVX12 U180 ( .A(n70), .Y(gray_addr[9]) );
  INVX12 U181 ( .A(n88), .Y(gray_addr[1]) );
  INVX12 U182 ( .A(n74), .Y(gray_addr[8]) );
  INVX12 U183 ( .A(n81), .Y(gray_addr[5]) );
  INVX12 U184 ( .A(n91), .Y(gray_addr[12]) );
  INVX12 U185 ( .A(n75), .Y(gray_addr[7]) );
  NAND3X2 U186 ( .A(n274), .B(n271), .C(n267), .Y(n72) );
  INVX12 U187 ( .A(n98), .Y(gray_addr[0]) );
  INVX12 U188 ( .A(n95), .Y(gray_addr[10]) );
  NAND4X2 U189 ( .A(n97), .B(n270), .C(n268), .D(n273), .Y(n71) );
  INVX12 U190 ( .A(n85), .Y(gray_addr[3]) );
  NAND4X2 U191 ( .A(n97), .B(n34), .C(n271), .D(n273), .Y(n77) );
  BUFX12 U192 ( .A(n287), .Y(lbp_addr[8]) );
  CLKBUFX3 U193 ( .A(n287), .Y(n189) );
  BUFX12 U194 ( .A(n294), .Y(lbp_addr[1]) );
  INVX12 U195 ( .A(n191), .Y(gray_req) );
  INVX12 U196 ( .A(n193), .Y(lbp_valid) );
  BUFX12 U197 ( .A(n296), .Y(lbp_data[7]) );
  BUFX12 U198 ( .A(n297), .Y(lbp_data[6]) );
  BUFX12 U199 ( .A(n298), .Y(lbp_data[5]) );
  BUFX12 U200 ( .A(n299), .Y(lbp_data[4]) );
  BUFX12 U201 ( .A(n300), .Y(lbp_data[3]) );
  BUFX12 U202 ( .A(n301), .Y(lbp_data[2]) );
  BUFX12 U203 ( .A(n302), .Y(lbp_data[1]) );
  BUFX12 U204 ( .A(n303), .Y(lbp_data[0]) );
  INVX12 U205 ( .A(n203), .Y(finish) );
  BUFX12 U206 ( .A(n293), .Y(lbp_addr[2]) );
  CLKBUFX3 U207 ( .A(n293), .Y(n206) );
  BUFX12 U208 ( .A(n289), .Y(lbp_addr[6]) );
  CLKBUFX3 U209 ( .A(n289), .Y(n208) );
  BUFX12 U210 ( .A(n284), .Y(lbp_addr[11]) );
  CLKBUFX3 U211 ( .A(n291), .Y(n210) );
  BUFX12 U212 ( .A(n291), .Y(lbp_addr[4]) );
  BUFX12 U213 ( .A(n282), .Y(lbp_addr[13]) );
  BUFX12 U214 ( .A(n286), .Y(lbp_addr[9]) );
  CLKBUFX3 U215 ( .A(n286), .Y(n214) );
  BUFX12 U216 ( .A(n285), .Y(lbp_addr[10]) );
  AO21XL U217 ( .A0(n235), .A1(n285), .B0(n236), .Y(N129) );
  BUFX12 U218 ( .A(n292), .Y(lbp_addr[3]) );
  AO21XL U219 ( .A0(n240), .A1(n292), .B0(n241), .Y(N136) );
  BUFX12 U220 ( .A(n283), .Y(lbp_addr[12]) );
  XNOR2XL U221 ( .A(n283), .B(n237), .Y(N131) );
  NOR2XL U222 ( .A(n283), .B(n237), .Y(n238) );
  BUFX12 U223 ( .A(n290), .Y(lbp_addr[5]) );
  XNOR2XL U224 ( .A(n290), .B(n242), .Y(N138) );
  NOR2XL U225 ( .A(n290), .B(n242), .Y(n243) );
  INVX16 U226 ( .A(n140), .Y(lbp_addr[7]) );
  CLKBUFX3 U227 ( .A(n295), .Y(n219) );
  BUFX12 U228 ( .A(n295), .Y(lbp_addr[0]) );
  OR2XL U229 ( .A(n287), .B(n288), .Y(n234) );
  OR2XL U230 ( .A(n294), .B(n219), .Y(n239) );
  NAND2BX1 U231 ( .AN(n239), .B(n131), .Y(n240) );
  INVX12 U232 ( .A(n76), .Y(gray_addr[6]) );
  NAND2X1 U233 ( .A(n77), .B(n289), .Y(n222) );
  NAND2X1 U234 ( .A(N139), .B(n79), .Y(n223) );
  NAND2X1 U235 ( .A(N160), .B(n80), .Y(n224) );
  AND3X2 U236 ( .A(n222), .B(n223), .C(n224), .Y(n76) );
  XOR2XL U237 ( .A(n208), .B(n243), .Y(N139) );
  INVX12 U238 ( .A(n89), .Y(gray_addr[13]) );
  NAND2X1 U239 ( .A(n71), .B(lbp_addr[13]), .Y(n226) );
  NAND2X1 U240 ( .A(N181), .B(n72), .Y(n227) );
  NAND2X1 U241 ( .A(N132), .B(n73), .Y(n228) );
  AND3X2 U242 ( .A(n226), .B(n227), .C(n228), .Y(n89) );
  XOR2XL U243 ( .A(n282), .B(n238), .Y(N132) );
  OR2XL U244 ( .A(n234), .B(n286), .Y(n235) );
  OAI2BB1XL U245 ( .A0N(lbp_addr[0]), .A1N(n294), .B0(n239), .Y(N134) );
  OAI2BB1XL U246 ( .A0N(n239), .A1N(n206), .B0(n240), .Y(N135) );
  OAI2BB1XL U247 ( .A0N(n288), .A1N(lbp_addr[8]), .B0(n234), .Y(N127) );
  OAI2BB1XL U248 ( .A0N(n234), .A1N(lbp_addr[9]), .B0(n235), .Y(N128) );
  NOR2BXL U249 ( .AN(ns[1]), .B(ns[0]), .Y(n183) );
  NAND4X1 U250 ( .A(n294), .B(n206), .C(n219), .D(n61), .Y(n9) );
  INVX3 U251 ( .A(n229), .Y(n273) );
  CLKINVX1 U252 ( .A(n36), .Y(n268) );
  NAND4X2 U253 ( .A(n124), .B(n31), .C(n9), .D(n11), .Y(n30) );
  AND2X2 U254 ( .A(ns[1]), .B(ns[0]), .Y(n124) );
  CLKINVX1 U255 ( .A(n47), .Y(n275) );
  CLKBUFX3 U256 ( .A(n15), .Y(n229) );
  NOR2X1 U257 ( .A(n276), .B(n99), .Y(n15) );
  CLKINVX1 U258 ( .A(n42), .Y(n271) );
  NAND2X1 U259 ( .A(n276), .B(n99), .Y(n97) );
  NOR3X1 U260 ( .A(n185), .B(n269), .C(n25), .Y(n36) );
  CLKINVX1 U261 ( .A(n38), .Y(n270) );
  CLKINVX1 U262 ( .A(n43), .Y(n274) );
  CLKINVX1 U263 ( .A(n40), .Y(n267) );
  NAND2X1 U264 ( .A(n100), .B(n269), .Y(n26) );
  AOI2BB2X1 U265 ( .B0(n279), .B1(n9), .A0N(n278), .A1N(n9), .Y(n57) );
  CLKINVX1 U266 ( .A(n11), .Y(n279) );
  CLKINVX1 U267 ( .A(n17), .Y(n277) );
  NAND3BX2 U268 ( .AN(n28), .B(n273), .C(n48), .Y(n32) );
  CLKBUFX3 U269 ( .A(n49), .Y(n230) );
  NOR2X1 U270 ( .A(n51), .B(n187), .Y(n49) );
  AOI2BB1X1 U271 ( .A0N(n269), .A1N(n276), .B0(n17), .Y(n23) );
  NOR4X1 U272 ( .A(n9), .B(n10), .C(n11), .D(n187), .Y(ns[2]) );
  NAND2X1 U273 ( .A(n186), .B(n278), .Y(n10) );
  CLKBUFX3 U274 ( .A(n264), .Y(n232) );
  CLKBUFX3 U275 ( .A(n264), .Y(n233) );
  AND2X2 U276 ( .A(N222), .B(n273), .Y(N225) );
  CLKINVX1 U277 ( .A(gray_data[7]), .Y(n263) );
  CLKINVX1 U278 ( .A(gray_data[1]), .Y(n260) );
  CLKINVX1 U279 ( .A(gray_data[5]), .Y(n262) );
  CLKINVX1 U280 ( .A(gray_data[3]), .Y(n261) );
  CLKINVX1 U281 ( .A(n136), .Y(n281) );
  OAI32X1 U282 ( .A0(n52), .A1(n184), .A2(n269), .B0(n54), .B1(n187), .Y(ns[0]) );
  NAND3X1 U283 ( .A(n185), .B(n276), .C(n277), .Y(n52) );
  OAI211X1 U284 ( .A0(n125), .A1(n279), .B0(n31), .C0(n57), .Y(n55) );
  OAI22XL U285 ( .A0(n108), .A1(n124), .B0(n152), .B1(n30), .Y(n153) );
  OAI22XL U286 ( .A0(n107), .A1(n124), .B0(n151), .B1(n30), .Y(n154) );
  OAI22XL U287 ( .A0(n106), .A1(n124), .B0(n150), .B1(n30), .Y(n155) );
  OAI22XL U288 ( .A0(n105), .A1(n124), .B0(n149), .B1(n30), .Y(n156) );
  OAI22XL U289 ( .A0(n104), .A1(n124), .B0(n148), .B1(n30), .Y(n157) );
  OAI22XL U290 ( .A0(n103), .A1(n124), .B0(n147), .B1(n30), .Y(n158) );
  OAI22XL U291 ( .A0(n102), .A1(n124), .B0(n146), .B1(n30), .Y(n159) );
  OAI22XL U292 ( .A0(n101), .A1(n124), .B0(n145), .B1(n30), .Y(n160) );
  AO22X1 U293 ( .A0(gray_data[6]), .A1(n229), .B0(n273), .B1(gray_center[6]), 
        .Y(n117) );
  AO22X1 U294 ( .A0(gray_data[2]), .A1(n229), .B0(n273), .B1(gray_center[2]), 
        .Y(n113) );
  AO22X1 U295 ( .A0(gray_data[4]), .A1(n229), .B0(n273), .B1(gray_center[4]), 
        .Y(n115) );
  AO22X1 U296 ( .A0(gray_data[1]), .A1(n229), .B0(n273), .B1(gray_center[1]), 
        .Y(n112) );
  AO22X1 U297 ( .A0(gray_data[3]), .A1(n229), .B0(n273), .B1(gray_center[3]), 
        .Y(n114) );
  AO22X1 U298 ( .A0(gray_data[5]), .A1(n229), .B0(n273), .B1(gray_center[5]), 
        .Y(n116) );
  AO22X1 U299 ( .A0(gray_data[7]), .A1(n229), .B0(n273), .B1(gray_center[7]), 
        .Y(n118) );
  AO22X1 U300 ( .A0(gray_data[0]), .A1(n229), .B0(n273), .B1(gray_center[0]), 
        .Y(n111) );
  OAI2BB2XL U301 ( .B0(n134), .B1(n230), .A0N(N66), .A1N(n231), .Y(n182) );
  OAI2BB2XL U302 ( .B0(n135), .B1(n230), .A0N(N65), .A1N(n231), .Y(n169) );
  OAI2BB2XL U303 ( .B0(n136), .B1(n230), .A0N(N64), .A1N(n231), .Y(n170) );
  OAI2BB2XL U304 ( .B0(n137), .B1(n230), .A0N(N63), .A1N(n231), .Y(n171) );
  OAI2BB2XL U305 ( .B0(n138), .B1(n230), .A0N(N62), .A1N(n231), .Y(n172) );
  OAI2BB2XL U306 ( .B0(n139), .B1(n230), .A0N(N61), .A1N(n231), .Y(n173) );
  OAI2BB2XL U307 ( .B0(n140), .B1(n230), .A0N(N60), .A1N(n231), .Y(n174) );
  NAND2X1 U308 ( .A(n275), .B(n143), .Y(n99) );
  NAND2X1 U309 ( .A(n142), .B(n109), .Y(n47) );
  NAND2X1 U310 ( .A(n141), .B(n184), .Y(n25) );
  NOR3X1 U311 ( .A(n143), .B(n142), .C(n25), .Y(n42) );
  OAI2BB2XL U312 ( .B0(n127), .B1(n230), .A0N(N59), .A1N(n231), .Y(n175) );
  NOR3X1 U313 ( .A(n185), .B(n143), .C(n25), .Y(n38) );
  NOR2X1 U314 ( .A(n99), .B(n141), .Y(n43) );
  NOR3X1 U315 ( .A(n269), .B(n142), .C(n25), .Y(n40) );
  NOR3X1 U316 ( .A(n184), .B(n142), .C(n276), .Y(n100) );
  OAI2BB2XL U317 ( .B0(n128), .B1(n230), .A0N(N58), .A1N(n231), .Y(n176) );
  NAND2X1 U318 ( .A(n100), .B(n143), .Y(n34) );
  INVX3 U319 ( .A(n143), .Y(n269) );
  NAND3X1 U320 ( .A(n275), .B(n269), .C(n141), .Y(n48) );
  OAI2BB2XL U321 ( .B0(n129), .B1(n230), .A0N(N57), .A1N(n231), .Y(n177) );
  OAI2BB2XL U322 ( .B0(n130), .B1(n230), .A0N(N56), .A1N(n231), .Y(n178) );
  OAI2BB2XL U323 ( .B0(n131), .B1(n230), .A0N(N55), .A1N(n231), .Y(n179) );
  OAI2BB2XL U324 ( .B0(n132), .B1(n230), .A0N(N54), .A1N(n231), .Y(n180) );
  NOR4X1 U325 ( .A(n127), .B(n128), .C(n129), .D(n130), .Y(n61) );
  OAI2BB2XL U326 ( .B0(n133), .B1(n230), .A0N(N53), .A1N(n231), .Y(n181) );
  NAND4X1 U327 ( .A(n189), .B(n286), .C(lbp_addr[7]), .D(n69), .Y(n11) );
  NOR4X1 U328 ( .A(n134), .B(n135), .C(n136), .D(n137), .Y(n69) );
  OA22X1 U329 ( .A0(n62), .A1(n63), .B0(n64), .B1(n65), .Y(n31) );
  NAND4X1 U330 ( .A(n130), .B(n131), .C(n132), .D(n133), .Y(n62) );
  NAND3X1 U331 ( .A(n128), .B(n129), .C(n127), .Y(n63) );
  NAND4X1 U332 ( .A(n137), .B(n138), .C(n139), .D(n140), .Y(n64) );
  NAND3X1 U333 ( .A(n135), .B(n136), .C(n134), .Y(n65) );
  NAND3X2 U334 ( .A(n110), .B(n278), .C(n126), .Y(n17) );
  OAI32X1 U335 ( .A0(n32), .A1(n152), .A2(n272), .B0(n144), .B1(n34), .Y(n161)
         );
  CLKINVX1 U336 ( .A(n34), .Y(n272) );
  OAI32X1 U337 ( .A0(n32), .A1(n151), .A2(n266), .B0(n144), .B1(n26), .Y(n162)
         );
  CLKINVX1 U338 ( .A(n26), .Y(n266) );
  OAI32X1 U339 ( .A0(n32), .A1(n150), .A2(n36), .B0(n144), .B1(n268), .Y(n163)
         );
  OAI32X1 U340 ( .A0(n32), .A1(n149), .A2(n38), .B0(n144), .B1(n270), .Y(n164)
         );
  OAI32X1 U341 ( .A0(n32), .A1(n148), .A2(n40), .B0(n144), .B1(n267), .Y(n165)
         );
  OAI32X1 U342 ( .A0(n32), .A1(n147), .A2(n42), .B0(n144), .B1(n271), .Y(n166)
         );
  OAI32X1 U343 ( .A0(n32), .A1(n146), .A2(n43), .B0(n144), .B1(n274), .Y(n167)
         );
  OAI33X1 U344 ( .A0(n32), .A1(n145), .A2(n265), .B0(n46), .B1(n144), .B2(n47), 
        .Y(n168) );
  CLKINVX1 U345 ( .A(n46), .Y(n265) );
  NAND2X1 U346 ( .A(n276), .B(n269), .Y(n46) );
  XNOR2X1 U347 ( .A(n186), .B(n125), .Y(n51) );
  AND2X2 U348 ( .A(n51), .B(n110), .Y(ns[1]) );
  NOR2X1 U349 ( .A(n141), .B(n275), .Y(n28) );
  CLKBUFX3 U350 ( .A(n50), .Y(n231) );
  NOR2BX1 U351 ( .AN(n230), .B(n126), .Y(n50) );
  OAI222XL U352 ( .A0(n109), .A1(n23), .B0(n185), .B1(n25), .C0(n17), .C1(n26), 
        .Y(n121) );
  OAI22XL U353 ( .A0(n17), .A1(n271), .B0(n141), .B1(n19), .Y(n119) );
  NOR2X1 U354 ( .A(n275), .B(n17), .Y(n19) );
  OAI32X1 U355 ( .A0(n21), .A1(n17), .A2(n185), .B0(n142), .B1(n23), .Y(n120)
         );
  OAI21XL U356 ( .A0(n109), .A1(n141), .B0(n269), .Y(n21) );
  OAI32X1 U357 ( .A0(n269), .A1(n28), .A2(n17), .B0(n143), .B1(n277), .Y(n123)
         );
  NOR2X1 U358 ( .A(n235), .B(n285), .Y(n236) );
  NAND2X1 U359 ( .A(n236), .B(n136), .Y(n237) );
  OAI21XL U360 ( .A0(n236), .A1(n136), .B0(n237), .Y(N130) );
  NOR2X1 U361 ( .A(n240), .B(n292), .Y(n241) );
  NAND2X1 U362 ( .A(n241), .B(n129), .Y(n242) );
  OAI21XL U363 ( .A0(n241), .A1(n129), .B0(n242), .Y(N137) );
  NAND2BX1 U364 ( .AN(gray_center[4]), .B(gray_data[4]), .Y(n244) );
  OAI222XL U365 ( .A0(gray_center[5]), .A1(n262), .B0(gray_center[5]), .B1(
        n244), .C0(n262), .C1(n244), .Y(n245) );
  OAI222XL U366 ( .A0(gray_data[6]), .A1(n245), .B0(n259), .B1(n245), .C0(
        gray_data[6]), .C1(n259), .Y(n256) );
  NOR2BX1 U367 ( .AN(gray_center[4]), .B(gray_data[4]), .Y(n246) );
  OAI22XL U368 ( .A0(n246), .A1(n262), .B0(gray_center[5]), .B1(n246), .Y(n254) );
  NAND2BX1 U369 ( .AN(gray_center[2]), .B(gray_data[2]), .Y(n252) );
  OAI2BB2XL U370 ( .B0(gray_data[0]), .B1(n258), .A0N(n260), .A1N(
        gray_center[1]), .Y(n247) );
  OAI21XL U371 ( .A0(gray_center[1]), .A1(n260), .B0(n247), .Y(n250) );
  NOR2BX1 U372 ( .AN(gray_center[2]), .B(gray_data[2]), .Y(n248) );
  OAI22XL U373 ( .A0(n248), .A1(n261), .B0(gray_center[3]), .B1(n248), .Y(n249) );
  AOI2BB2X1 U374 ( .B0(n250), .B1(n249), .A0N(n252), .A1N(n261), .Y(n251) );
  OAI221XL U375 ( .A0(gray_center[3]), .A1(n252), .B0(gray_center[3]), .B1(
        n261), .C0(n251), .Y(n253) );
  OAI211X1 U376 ( .A0(gray_data[6]), .A1(n259), .B0(n254), .C0(n253), .Y(n255)
         );
  AO22X1 U377 ( .A0(n263), .A1(gray_center[7]), .B0(n256), .B1(n255), .Y(n257)
         );
  OAI21XL U378 ( .A0(gray_center[7]), .A1(n263), .B0(n257), .Y(N222) );
endmodule

