
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of tank_pix is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   signal x_left_leg_3_port, x_left_leg_2_port, x_left_leg_1_port, 
      y_left_leg_3_port, y_left_leg_2_port, y_left_leg_1_port, 
      x_right_leg_3_port, x_right_leg_2_port, x_right_leg_1_port, 
      x_right_leg_0_port, y_right_leg_3_port, y_right_leg_2_port, 
      y_right_leg_1_port, y_right_leg_0_port, x_left_foot_3_port, 
      x_left_foot_2_port, x_left_foot_1_port, y_left_foot_3_port, 
      y_left_foot_2_port, y_left_foot_1_port, x_right_foot_3_port, 
      x_right_foot_2_port, x_right_foot_1_port, y_right_foot_3_port, 
      y_right_foot_2_port, y_right_foot_1_port, x_left_foot_0_port, 
      y_left_foot_0_port, n144, n145, n146, n147, n148, n149, n150, n151, n152,
      n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, 
      n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, 
      n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, 
      n189, n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, 
      n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, 
      n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, 
      n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, 
      n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, 
      n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, 
      n261, n262 : std_logic;

begin
   x_body <= ( x_in(3), x_in(2), x_in(1), x_in(0) );
   y_body <= ( y_in(3), y_in(2), y_in(1), y_in(0) );
   x_left_leg <= ( x_left_leg_3_port, x_left_leg_2_port, x_left_leg_1_port, 
      x_right_leg_0_port );
   y_left_leg <= ( y_left_leg_3_port, y_left_leg_2_port, y_left_leg_1_port, 
      y_right_leg_0_port );
   x_right_leg <= ( x_right_leg_3_port, x_right_leg_2_port, x_right_leg_1_port,
      x_right_leg_0_port );
   y_right_leg <= ( y_right_leg_3_port, y_right_leg_2_port, y_right_leg_1_port,
      y_right_leg_0_port );
   x_left_foot <= ( x_left_foot_3_port, x_left_foot_2_port, x_left_foot_1_port,
      x_left_foot_0_port );
   y_left_foot <= ( y_left_foot_3_port, y_left_foot_2_port, y_left_foot_1_port,
      y_left_foot_0_port );
   x_right_foot <= ( x_right_foot_3_port, x_right_foot_2_port, 
      x_right_foot_1_port, x_left_foot_0_port );
   y_right_foot <= ( y_right_foot_3_port, y_right_foot_2_port, 
      y_right_foot_1_port, y_left_foot_0_port );
   
   U173 : na310 port map( A => n144, B => n145, C => n146, Y => 
                           y_right_leg_3_port);
   U174 : na210 port map( A => n147, B => n148, Y => n146);
   U175 : na210 port map( A => n149, B => n150, Y => n144);
   U176 : na310 port map( A => n151, B => n152, C => n153, Y => 
                           y_right_leg_2_port);
   U177 : na210 port map( A => n147, B => n154, Y => n153);
   U178 : na210 port map( A => n149, B => n155, Y => n151);
   U179 : na210 port map( A => n156, B => n157, Y => y_right_leg_1_port);
   U180 : mu111 port map( A => n158, B => n159, S => n160, Y => n156);
   U181 : mu111 port map( A => n161, B => n162, S => y_left_foot_0_port, Y => 
                           y_right_leg_0_port);
   U182 : na210 port map( A => n163, B => n164, Y => y_right_foot_3_port);
   U183 : na210 port map( A => n150, B => n165, Y => n164);
   U184 : na210 port map( A => n148, B => n166, Y => n163);
   U185 : na210 port map( A => n167, B => n168, Y => y_right_foot_2_port);
   U186 : na210 port map( A => n155, B => n165, Y => n168);
   U187 : na210 port map( A => n154, B => n166, Y => n167);
   U188 : mu111 port map( A => n165, B => n166, S => n160, Y => 
                           y_right_foot_1_port);
   U189 : na310 port map( A => n169, B => n145, C => n170, Y => 
                           y_left_leg_3_port);
   U190 : na210 port map( A => n149, B => n148, Y => n170);
   U191 : na210 port map( A => n147, B => n150, Y => n169);
   U192 : na310 port map( A => n171, B => n152, C => n172, Y => 
                           y_left_leg_2_port);
   U193 : na210 port map( A => n149, B => n154, Y => n172);
   U194 : na210 port map( A => n147, B => n155, Y => n171);
   U195 : na210 port map( A => n173, B => n157, Y => y_left_leg_1_port);
   U196 : mu111 port map( A => n159, B => n158, S => n160, Y => n173);
   U197 : na210 port map( A => n174, B => n175, Y => y_left_foot_3_port);
   U198 : na210 port map( A => n150, B => n176, Y => n175);
   U199 : ex210 port map( A => n177, B => y_in(3), Y => n150);
   U200 : no210 port map( A => n178, B => y_in(2), Y => n177);
   U201 : na210 port map( A => n148, B => n179, Y => n174);
   U202 : ex210 port map( A => y_in(3), B => n180, Y => n148);
   U203 : no210 port map( A => n181, B => n182, Y => n180);
   U204 : na210 port map( A => n183, B => n184, Y => y_left_foot_2_port);
   U205 : na210 port map( A => n155, B => n176, Y => n184);
   U206 : ex210 port map( A => n182, B => n178, Y => n155);
   U207 : na210 port map( A => n185, B => y_left_foot_0_port, Y => n178);
   U208 : na210 port map( A => n154, B => n179, Y => n183);
   U209 : ex210 port map( A => n181, B => n182, Y => n154);
   U210 : iv110 port map( A => y_in(2), Y => n182);
   U211 : na210 port map( A => y_in(1), B => y_in(0), Y => n181);
   U212 : mu111 port map( A => n176, B => n179, S => n160, Y => 
                           y_left_foot_1_port);
   U213 : ex210 port map( A => n185, B => y_left_foot_0_port, Y => n160);
   U214 : iv110 port map( A => y_in(1), Y => n185);
   U215 : iv110 port map( A => y_in(0), Y => y_left_foot_0_port);
   U216 : na210 port map( A => n186, B => n187, Y => y_head(3));
   U217 : na210 port map( A => n188, B => n161, Y => n187);
   U218 : na210 port map( A => y_in(3), B => n162, Y => n186);
   U219 : na210 port map( A => n189, B => n190, Y => y_head(2));
   U220 : na210 port map( A => n191, B => n161, Y => n190);
   U221 : na210 port map( A => y_in(2), B => n162, Y => n189);
   U222 : na210 port map( A => n192, B => n193, Y => y_head(1));
   U223 : na210 port map( A => n194, B => n161, Y => n193);
   U224 : na210 port map( A => y_in(1), B => n162, Y => n192);
   U225 : na210 port map( A => n195, B => n196, Y => y_head(0));
   U226 : na210 port map( A => n197, B => n161, Y => n196);
   U227 : na210 port map( A => n162, B => y_in(0), Y => n195);
   U228 : na310 port map( A => n198, B => n199, C => n200, Y => 
                           x_right_leg_3_port);
   U229 : na210 port map( A => n201, B => n202, Y => n200);
   U230 : na210 port map( A => n203, B => n204, Y => n198);
   U231 : na310 port map( A => n205, B => n206, C => n207, Y => 
                           x_right_leg_2_port);
   U232 : na210 port map( A => n201, B => n208, Y => n207);
   U233 : na210 port map( A => n203, B => n209, Y => n205);
   U234 : na210 port map( A => n210, B => n211, Y => x_right_leg_1_port);
   U235 : mu111 port map( A => n212, B => n213, S => n214, Y => n210);
   U236 : mu111 port map( A => n162, B => n161, S => x_left_foot_0_port, Y => 
                           x_right_leg_0_port);
   U237 : na210 port map( A => n215, B => n216, Y => x_right_foot_3_port);
   U238 : na210 port map( A => n202, B => n176, Y => n216);
   U239 : na210 port map( A => n204, B => n179, Y => n215);
   U240 : na210 port map( A => n217, B => n218, Y => x_right_foot_2_port);
   U241 : na210 port map( A => n208, B => n176, Y => n218);
   U242 : na210 port map( A => n209, B => n179, Y => n217);
   U243 : mu111 port map( A => n176, B => n179, S => n214, Y => 
                           x_right_foot_1_port);
   U244 : na210 port map( A => n212, B => n159, Y => n176);
   U245 : na310 port map( A => n219, B => n199, C => n220, Y => 
                           x_left_leg_3_port);
   U246 : na210 port map( A => n203, B => n202, Y => n220);
   U247 : na210 port map( A => n201, B => n204, Y => n219);
   U248 : na310 port map( A => n221, B => n206, C => n222, Y => 
                           x_left_leg_2_port);
   U249 : na210 port map( A => n203, B => n208, Y => n222);
   U250 : na210 port map( A => n201, B => n209, Y => n221);
   U251 : iv110 port map( A => n212, Y => n201);
   U252 : na210 port map( A => n223, B => n211, Y => x_left_leg_1_port);
   U253 : mu111 port map( A => n213, B => n212, S => n214, Y => n223);
   U254 : na210 port map( A => n224, B => n225, Y => x_left_foot_3_port);
   U255 : na210 port map( A => n204, B => n165, Y => n225);
   U256 : ex210 port map( A => x_in(3), B => n226, Y => n204);
   U257 : no210 port map( A => n227, B => n228, Y => n226);
   U258 : na210 port map( A => n202, B => n166, Y => n224);
   U259 : ex210 port map( A => n229, B => x_in(3), Y => n202);
   U260 : no210 port map( A => n230, B => x_in(2), Y => n229);
   U261 : iv110 port map( A => n231, Y => n230);
   U262 : na210 port map( A => n232, B => n233, Y => x_left_foot_2_port);
   U263 : na210 port map( A => n209, B => n165, Y => n233);
   U264 : ex210 port map( A => n228, B => n227, Y => n209);
   U265 : iv110 port map( A => x_in(2), Y => n227);
   U266 : na210 port map( A => x_in(1), B => x_in(0), Y => n228);
   U267 : na210 port map( A => n208, B => n166, Y => n232);
   U268 : ex210 port map( A => x_in(2), B => n231, Y => n208);
   U269 : no210 port map( A => x_in(1), B => x_in(0), Y => n231);
   U270 : mu111 port map( A => n166, B => n165, S => n214, Y => 
                           x_left_foot_1_port);
   U271 : ex210 port map( A => x_in(1), B => x_in(0), Y => n214);
   U272 : na210 port map( A => n212, B => n158, Y => n165);
   U273 : na210 port map( A => n213, B => n159, Y => n166);
   U274 : iv110 port map( A => x_in(0), Y => x_left_foot_0_port);
   U275 : na210 port map( A => n234, B => n235, Y => x_head(3));
   U276 : na210 port map( A => n188, B => n162, Y => n235);
   U277 : ex210 port map( A => n236, B => n237, Y => n188);
   U278 : na210 port map( A => n199, B => n145, Y => n237);
   U279 : na210 port map( A => y_in(3), B => n161, Y => n145);
   U280 : na210 port map( A => x_in(3), B => n162, Y => n199);
   U281 : ex210 port map( A => n238, B => n179, Y => n236);
   U282 : na210 port map( A => n239, B => n240, Y => n238);
   U283 : iv110 port map( A => n241, Y => n240);
   U284 : no210 port map( A => n242, B => n243, Y => n241);
   U285 : no210 port map( A => n244, B => n245, Y => n242);
   U286 : na210 port map( A => n245, B => n244, Y => n239);
   U287 : na210 port map( A => x_in(3), B => n161, Y => n234);
   U288 : na210 port map( A => n246, B => n247, Y => x_head(2));
   U289 : na210 port map( A => n191, B => n162, Y => n247);
   U290 : ex210 port map( A => n248, B => n245, Y => n191);
   U291 : na210 port map( A => n249, B => n250, Y => n245);
   U292 : na210 port map( A => n251, B => n252, Y => n250);
   U293 : na210 port map( A => n243, B => n253, Y => n251);
   U294 : na210 port map( A => n254, B => n179, Y => n249);
   U295 : ex210 port map( A => n244, B => n179, Y => n248);
   U296 : na210 port map( A => n152, B => n206, Y => n244);
   U297 : na210 port map( A => x_in(2), B => n162, Y => n206);
   U298 : na210 port map( A => y_in(2), B => n161, Y => n152);
   U299 : na210 port map( A => x_in(2), B => n161, Y => n246);
   U300 : na210 port map( A => n255, B => n256, Y => x_head(1));
   U301 : na210 port map( A => n194, B => n162, Y => n256);
   U302 : ex210 port map( A => n257, B => n253, Y => n194);
   U303 : iv110 port map( A => n254, Y => n253);
   U304 : na210 port map( A => n157, B => n211, Y => n254);
   U305 : na210 port map( A => x_in(1), B => n162, Y => n211);
   U306 : na210 port map( A => y_in(1), B => n161, Y => n157);
   U307 : ex210 port map( A => n197, B => n179, Y => n257);
   U308 : iv110 port map( A => n243, Y => n179);
   U309 : no210 port map( A => n149, B => n203, Y => n243);
   U310 : iv110 port map( A => n158, Y => n149);
   U311 : na210 port map( A => x_in(1), B => n161, Y => n255);
   U312 : na210 port map( A => n258, B => n259, Y => x_head(0));
   U313 : na210 port map( A => n197, B => n162, Y => n259);
   U314 : iv110 port map( A => n252, Y => n197);
   U315 : na210 port map( A => n260, B => n261, Y => n252);
   U316 : na210 port map( A => n162, B => x_in(0), Y => n261);
   U317 : na210 port map( A => n159, B => n158, Y => n162);
   U318 : na210 port map( A => theta(0), B => theta(1), Y => n158);
   U319 : iv110 port map( A => n147, Y => n159);
   U320 : no210 port map( A => n262, B => theta(1), Y => n147);
   U321 : na210 port map( A => n161, B => y_in(0), Y => n260);
   U322 : na210 port map( A => n161, B => x_in(0), Y => n258);
   U323 : na210 port map( A => n212, B => n213, Y => n161);
   U324 : iv110 port map( A => n203, Y => n213);
   U325 : no210 port map( A => theta(0), B => theta(1), Y => n203);
   U326 : na210 port map( A => theta(1), B => n262, Y => n212);
   U327 : iv110 port map( A => theta(0), Y => n262);

end synthesised;



