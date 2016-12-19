
library ieee,CellsLib;

use ieee.std_logic_1164.all;
use CellsLib.CellsLib_DECL_PACK.all;

architecture synthesised of pg_pxg is

   component iv110
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component ex210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component no210
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component na310
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component mu111
      port( A, B, S : in std_logic;  Y : out std_logic);
   end component;
   
   signal y_left_foot_3_port, y_left_foot_2_port, y_left_foot_1_port, 
      x_right_foot_3_port, x_right_foot_2_port, x_right_foot_1_port, N49, N50, 
      N51, N53, N54, x_left_foot_3_port, x_left_foot_0_port, 
      y_right_foot_0_port, n190, n191, n192, n193, n194, n195, n196, n197, n198
      , n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209, n210,
      n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, 
      n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, 
      n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, 
      n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, 
      n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, 
      n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, 
      n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, 
      n295, n296, n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, 
      n307, n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318, 
      n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, 
      n331, n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, 
      n343, n344, n345, n346 : std_logic;

begin
   x_left_foot <= ( x_left_foot_3_port, N54, N53, x_left_foot_0_port );
   y_left_foot <= ( y_left_foot_3_port, y_left_foot_2_port, y_left_foot_1_port,
      y_right_foot_0_port );
   x_right_foot <= ( x_right_foot_3_port, x_right_foot_2_port, 
      x_right_foot_1_port, x_left_foot_0_port );
   y_right_foot <= ( N51, N50, N49, y_right_foot_0_port );
   
   U207 : no210 port map( A => n250, B => theta(0), Y => n190);
   U208 : na210 port map( A => n191, B => n192, Y => y_right_leg(3));
   U209 : na210 port map( A => N51, B => n193, Y => n192);
   U210 : na210 port map( A => n194, B => n195, Y => y_right_leg(2));
   U211 : na210 port map( A => N50, B => n193, Y => n195);
   U212 : na210 port map( A => n196, B => n197, Y => y_right_leg(1));
   U213 : na210 port map( A => N49, B => n193, Y => n197);
   U214 : mu111 port map( A => theta(0), B => n193, S => y_right_foot_0_port, Y
                           => y_right_leg(0));
   U215 : na210 port map( A => n198, B => n191, Y => y_left_leg(3));
   U216 : na210 port map( A => y_in(3), B => theta(0), Y => n191);
   U217 : na210 port map( A => n199, B => n194, Y => y_left_leg(2));
   U218 : na210 port map( A => y_in(2), B => theta(0), Y => n194);
   U219 : na210 port map( A => n200, B => n196, Y => y_left_leg(1));
   U220 : na210 port map( A => y_in(1), B => theta(0), Y => n196);
   U221 : na310 port map( A => n201, B => n202, C => n203, Y => y_left_leg(0));
   U222 : na210 port map( A => n204, B => n205, Y => n203);
   U223 : na210 port map( A => n206, B => n207, Y => n202);
   U224 : na210 port map( A => theta(0), B => y_in(0), Y => n201);
   U225 : na210 port map( A => n198, B => n208, Y => y_left_foot_3_port);
   U226 : na210 port map( A => N51, B => theta(0), Y => n208);
   U227 : iv110 port map( A => n209, Y => n198);
   U228 : na210 port map( A => n210, B => n211, Y => n209);
   U229 : na210 port map( A => n212, B => n190, Y => n211);
   U230 : na210 port map( A => n205, B => n213, Y => n210);
   U231 : na210 port map( A => n199, B => n214, Y => y_left_foot_2_port);
   U232 : na210 port map( A => theta(0), B => N50, Y => n214);
   U233 : iv110 port map( A => n215, Y => n199);
   U234 : na210 port map( A => n216, B => n217, Y => n215);
   U235 : na210 port map( A => n218, B => n207, Y => n217);
   U236 : na210 port map( A => n219, B => n205, Y => n216);
   U237 : na210 port map( A => n200, B => n220, Y => y_left_foot_1_port);
   U238 : na210 port map( A => N49, B => theta(0), Y => n220);
   U239 : iv110 port map( A => n221, Y => n200);
   U240 : na210 port map( A => n222, B => n223, Y => n221);
   U241 : na210 port map( A => n190, B => n224, Y => n223);
   U242 : na210 port map( A => n225, B => n205, Y => n222);
   U243 : na210 port map( A => n226, B => n227, Y => y_head(3));
   U244 : na210 port map( A => y_in(3), B => n193, Y => n227);
   U245 : na210 port map( A => theta(0), B => n213, Y => n226);
   U246 : na210 port map( A => n228, B => n229, Y => y_head(2));
   U247 : na210 port map( A => y_in(2), B => n193, Y => n229);
   U248 : na210 port map( A => n219, B => theta(0), Y => n228);
   U249 : na210 port map( A => n230, B => n231, Y => y_head(1));
   U250 : na210 port map( A => y_in(1), B => n193, Y => n231);
   U251 : na210 port map( A => n225, B => theta(0), Y => n230);
   U252 : na210 port map( A => n232, B => n233, Y => y_head(0));
   U253 : na210 port map( A => n193, B => y_in(0), Y => n233);
   U254 : na210 port map( A => n204, B => theta(0), Y => n232);
   U255 : na210 port map( A => n234, B => n235, Y => x_right_leg(3));
   U256 : na210 port map( A => n236, B => n237, Y => x_right_leg(2));
   U257 : na210 port map( A => n238, B => n239, Y => x_right_leg(1));
   U258 : na210 port map( A => n240, B => n241, Y => x_right_leg(0));
   U259 : na210 port map( A => n193, B => x_in(0), Y => n241);
   U260 : na210 port map( A => n206, B => theta(0), Y => n240);
   U261 : na210 port map( A => n234, B => n242, Y => x_right_foot_3_port);
   U262 : na210 port map( A => x_left_foot_3_port, B => n193, Y => n242);
   U263 : na210 port map( A => n212, B => theta(0), Y => n234);
   U264 : na210 port map( A => n236, B => n243, Y => x_right_foot_2_port);
   U265 : na210 port map( A => N54, B => n193, Y => n243);
   U266 : na210 port map( A => n218, B => theta(0), Y => n236);
   U267 : na210 port map( A => n238, B => n244, Y => x_right_foot_1_port);
   U268 : na210 port map( A => N53, B => n193, Y => n244);
   U269 : na210 port map( A => theta(0), B => n224, Y => n238);
   U270 : na210 port map( A => n245, B => n235, Y => x_left_leg(3));
   U271 : na210 port map( A => x_in(3), B => n193, Y => n235);
   U272 : na210 port map( A => theta(0), B => x_left_foot_3_port, Y => n245);
   U273 : na210 port map( A => n246, B => n237, Y => x_left_leg(2));
   U274 : na210 port map( A => x_in(2), B => n193, Y => n237);
   U275 : na210 port map( A => theta(0), B => N54, Y => n246);
   U276 : na210 port map( A => n247, B => n239, Y => x_left_leg(1));
   U277 : na210 port map( A => x_in(1), B => n193, Y => n239);
   U278 : na210 port map( A => N53, B => theta(0), Y => n247);
   U279 : mu111 port map( A => n193, B => theta(0), S => x_left_foot_0_port, Y 
                           => x_left_leg(0));
   U280 : iv110 port map( A => n248, Y => n193);
   U281 : no210 port map( A => n207, B => n205, Y => n248);
   U282 : ex210 port map( A => n249, B => n250, Y => x_left_foot_3_port);
   U283 : ex210 port map( A => n251, B => x_in(3), Y => n249);
   U284 : na210 port map( A => n252, B => n253, Y => n251);
   U285 : na210 port map( A => x_in(2), B => n254, Y => n253);
   U286 : na210 port map( A => n255, B => n256, Y => n254);
   U287 : iv110 port map( A => n257, Y => n255);
   U288 : na210 port map( A => n250, B => n257, Y => n252);
   U289 : na310 port map( A => n258, B => n259, C => n260, Y => x_head(3));
   U290 : na210 port map( A => x_in(3), B => theta(0), Y => n260);
   U291 : na210 port map( A => n205, B => n212, Y => n259);
   U292 : ex210 port map( A => n261, B => n262, Y => n212);
   U293 : no210 port map( A => n263, B => n264, Y => n262);
   U294 : no210 port map( A => n265, B => n266, Y => n264);
   U295 : iv110 port map( A => n267, Y => n263);
   U296 : na210 port map( A => n268, B => n269, Y => n267);
   U297 : na210 port map( A => n266, B => n265, Y => n269);
   U298 : ex210 port map( A => n270, B => n271, Y => n261);
   U299 : na210 port map( A => n272, B => n273, Y => n270);
   U300 : na210 port map( A => x_in(3), B => n274, Y => n273);
   U301 : na210 port map( A => n190, B => y_in(3), Y => n272);
   U302 : na210 port map( A => n207, B => n213, Y => n258);
   U303 : ex210 port map( A => n275, B => n276, Y => n213);
   U304 : ex210 port map( A => n277, B => n278, Y => n276);
   U305 : na210 port map( A => n279, B => n280, Y => n277);
   U306 : na210 port map( A => n274, B => y_in(3), Y => n280);
   U307 : na210 port map( A => n190, B => x_in(3), Y => n279);
   U308 : na210 port map( A => n281, B => n282, Y => n275);
   U309 : na210 port map( A => n278, B => n283, Y => n282);
   U310 : iv110 port map( A => n284, Y => n283);
   U311 : no210 port map( A => n285, B => n286, Y => n284);
   U312 : na210 port map( A => n285, B => n286, Y => n281);
   U313 : na310 port map( A => n287, B => n288, C => n289, Y => x_head(2));
   U314 : na210 port map( A => x_in(2), B => theta(0), Y => n289);
   U315 : na210 port map( A => n218, B => n205, Y => n288);
   U316 : iv110 port map( A => n290, Y => n218);
   U317 : ex210 port map( A => n291, B => n266, Y => n290);
   U318 : na210 port map( A => n292, B => n293, Y => n266);
   U319 : na210 port map( A => x_in(2), B => n274, Y => n293);
   U320 : na210 port map( A => n207, B => y_in(2), Y => n292);
   U321 : ex210 port map( A => n265, B => n268, Y => n291);
   U322 : no210 port map( A => n294, B => n295, Y => n265);
   U323 : no210 port map( A => n296, B => n271, Y => n295);
   U324 : iv110 port map( A => n297, Y => n296);
   U325 : na210 port map( A => n298, B => n299, Y => n297);
   U326 : no210 port map( A => n298, B => n299, Y => n294);
   U327 : na210 port map( A => n219, B => n190, Y => n287);
   U328 : ex210 port map( A => n300, B => n286, Y => n219);
   U329 : iv110 port map( A => n301, Y => n286);
   U330 : na210 port map( A => n302, B => n303, Y => n301);
   U331 : na210 port map( A => y_in(2), B => n274, Y => n303);
   U332 : na210 port map( A => x_in(2), B => n207, Y => n302);
   U333 : ex210 port map( A => n285, B => n304, Y => n300);
   U334 : no210 port map( A => n305, B => n306, Y => n285);
   U335 : no210 port map( A => n307, B => n204, Y => n306);
   U336 : no210 port map( A => n304, B => n308, Y => n307);
   U337 : no210 port map( A => n309, B => n278, Y => n305);
   U338 : na310 port map( A => n310, B => n311, C => n312, Y => x_head(1));
   U339 : na210 port map( A => x_in(1), B => theta(0), Y => n312);
   U340 : na210 port map( A => n205, B => n224, Y => n311);
   U341 : ex210 port map( A => n313, B => n299, Y => n224);
   U342 : na210 port map( A => n314, B => n315, Y => n299);
   U343 : na210 port map( A => x_in(1), B => n274, Y => n315);
   U344 : na210 port map( A => n190, B => y_in(1), Y => n314);
   U345 : ex210 port map( A => n206, B => n268, Y => n313);
   U346 : na210 port map( A => n225, B => n207, Y => n310);
   U347 : ex210 port map( A => n316, B => n309, Y => n225);
   U348 : iv110 port map( A => n308, Y => n309);
   U349 : na210 port map( A => n317, B => n318, Y => n308);
   U350 : na210 port map( A => y_in(1), B => n274, Y => n318);
   U351 : na210 port map( A => n190, B => x_in(1), Y => n317);
   U352 : ex210 port map( A => n204, B => n304, Y => n316);
   U353 : iv110 port map( A => n278, Y => n304);
   U354 : no210 port map( A => n250, B => n207, Y => n278);
   U355 : na310 port map( A => n319, B => n320, C => n321, Y => x_head(0));
   U356 : na210 port map( A => n204, B => n190, Y => n321);
   U357 : iv110 port map( A => n322, Y => n204);
   U358 : na210 port map( A => n323, B => n324, Y => n322);
   U359 : na210 port map( A => n274, B => y_in(0), Y => n324);
   U360 : na210 port map( A => n207, B => x_in(0), Y => n323);
   U361 : na210 port map( A => n205, B => n206, Y => n320);
   U362 : iv110 port map( A => n298, Y => n206);
   U363 : na210 port map( A => n325, B => n326, Y => n298);
   U364 : na210 port map( A => n274, B => x_in(0), Y => n326);
   U365 : na210 port map( A => n256, B => n268, Y => n274);
   U366 : na210 port map( A => n190, B => y_in(0), Y => n325);
   U367 : no210 port map( A => n256, B => theta(0), Y => n205);
   U368 : na210 port map( A => theta(0), B => x_in(0), Y => n319);
   U369 : ex210 port map( A => n327, B => n250, Y => N54);
   U370 : ex210 port map( A => x_in(2), B => n257, Y => n327);
   U371 : na210 port map( A => n328, B => n329, Y => n257);
   U372 : na210 port map( A => x_in(1), B => n330, Y => n329);
   U373 : na210 port map( A => n256, B => x_left_foot_0_port, Y => n330);
   U374 : na210 port map( A => n250, B => x_in(0), Y => n328);
   U375 : ex210 port map( A => n331, B => n256, Y => N53);
   U376 : ex210 port map( A => x_in(1), B => x_left_foot_0_port, Y => n331);
   U377 : iv110 port map( A => x_in(0), Y => x_left_foot_0_port);
   U378 : ex210 port map( A => n332, B => n333, Y => N51);
   U379 : ex210 port map( A => y_in(3), B => n334, Y => n333);
   U380 : na210 port map( A => n335, B => n336, Y => n332);
   U381 : na210 port map( A => n337, B => n338, Y => n336);
   U382 : na210 port map( A => n339, B => n340, Y => n337);
   U383 : na210 port map( A => n341, B => n334, Y => n335);
   U384 : ex210 port map( A => n341, B => n342, Y => N50);
   U385 : ex210 port map( A => n338, B => n339, Y => n342);
   U386 : iv110 port map( A => y_in(2), Y => n338);
   U387 : iv110 port map( A => n340, Y => n341);
   U388 : na210 port map( A => n343, B => n344, Y => n340);
   U389 : na210 port map( A => y_in(1), B => n345, Y => n344);
   U390 : na210 port map( A => n334, B => y_right_foot_0_port, Y => n345);
   U391 : na210 port map( A => n339, B => y_in(0), Y => n343);
   U392 : iv110 port map( A => n334, Y => n339);
   U393 : ex210 port map( A => n346, B => n334, Y => N49);
   U394 : no210 port map( A => n271, B => n207, Y => n334);
   U395 : no210 port map( A => n250, B => theta(0), Y => n207);
   U396 : iv110 port map( A => n268, Y => n271);
   U397 : na210 port map( A => n256, B => theta(0), Y => n268);
   U398 : iv110 port map( A => n250, Y => n256);
   U399 : ex210 port map( A => theta(0), B => theta(1), Y => n250);
   U400 : ex210 port map( A => y_in(1), B => y_right_foot_0_port, Y => n346);
   U401 : iv110 port map( A => y_in(0), Y => y_right_foot_0_port);

end synthesised;



