extern network na310 (terminal A, B, C, Y, vss, vdd)
extern network mu111 (terminal A, B, S, Y, vss, vdd)
extern network ex210 (terminal A, B, Y, vss, vdd)
extern network no210 (terminal A, B, Y, vss, vdd)
extern network na210 (terminal A, B, Y, vss, vdd)
extern network iv110 (terminal A, Y, vss, vdd)
network tank_pix (terminal x_in_3_0_3, x_in_3_0_2, x_in_3_0_1, x_in_3_0_0, 
                           y_in_3_0_3, y_in_3_0_2, y_in_3_0_1, y_in_3_0_0, 
                           theta_1_0_1, theta_1_0_0, x_head_3_0_3, 
                           x_head_3_0_2, x_head_3_0_1, x_head_3_0_0, 
                           y_head_3_0_3, y_head_3_0_2, y_head_3_0_1, 
                           y_head_3_0_0, x_body_3_0_3, x_body_3_0_2, 
                           x_body_3_0_1, x_body_3_0_0, y_body_3_0_3, 
                           y_body_3_0_2, y_body_3_0_1, y_body_3_0_0, 
                           x_left_leg_3_0_3, x_left_leg_3_0_2, 
                           x_left_leg_3_0_1, x_left_leg_3_0_0, 
                           y_left_leg_3_0_3, y_left_leg_3_0_2, 
                           y_left_leg_3_0_1, y_left_leg_3_0_0, 
                           x_right_leg_3_0_3, x_right_leg_3_0_2, 
                           x_right_leg_3_0_1, x_right_leg_3_0_0, 
                           y_right_leg_3_0_3, y_right_leg_3_0_2, 
                           y_right_leg_3_0_1, y_right_leg_3_0_0, 
                           x_left_foot_3_0_3, x_left_foot_3_0_2, 
                           x_left_foot_3_0_1, x_left_foot_3_0_0, 
                           y_left_foot_3_0_3, y_left_foot_3_0_2, 
                           y_left_foot_3_0_1, y_left_foot_3_0_0, 
                           x_right_foot_3_0_3, x_right_foot_3_0_2, 
                           x_right_foot_3_0_1, x_right_foot_3_0_0, 
                           y_right_foot_3_0_3, y_right_foot_3_0_2, 
                           y_right_foot_3_0_1, y_right_foot_3_0_0, vss, vdd)
{
   net {x_body_3_0_3, x_in_3_0_3};
   net {x_body_3_0_2, x_in_3_0_2};
   net {x_body_3_0_1, x_in_3_0_1};
   net {x_body_3_0_0, x_in_3_0_0};
   net {y_body_3_0_3, y_in_3_0_3};
   net {y_body_3_0_2, y_in_3_0_2};
   net {y_body_3_0_1, y_in_3_0_1};
   net {y_body_3_0_0, y_in_3_0_0};
   net {x_left_leg_3_0_3, x_left_leg_3_port};
   net {x_left_leg_3_0_2, x_left_leg_2_port};
   net {x_left_leg_3_0_1, x_left_leg_1_port};
   net {x_left_leg_3_0_0, x_right_leg_0_port};
   net {y_left_leg_3_0_3, y_left_leg_3_port};
   net {y_left_leg_3_0_2, y_left_leg_2_port};
   net {y_left_leg_3_0_1, y_left_leg_1_port};
   net {y_left_leg_3_0_0, y_right_leg_0_port};
   net {x_right_leg_3_0_3, x_right_leg_3_port};
   net {x_right_leg_3_0_2, x_right_leg_2_port};
   net {x_right_leg_3_0_1, x_right_leg_1_port};
   net {x_right_leg_3_0_0, x_right_leg_0_port};
   net {y_right_leg_3_0_3, y_right_leg_3_port};
   net {y_right_leg_3_0_2, y_right_leg_2_port};
   net {y_right_leg_3_0_1, y_right_leg_1_port};
   net {y_right_leg_3_0_0, y_right_leg_0_port};
   net {x_left_foot_3_0_3, x_left_foot_3_port};
   net {x_left_foot_3_0_2, x_left_foot_2_port};
   net {x_left_foot_3_0_1, x_left_foot_1_port};
   net {x_left_foot_3_0_0, x_left_foot_0_port};
   net {y_left_foot_3_0_3, y_left_foot_3_port};
   net {y_left_foot_3_0_2, y_left_foot_2_port};
   net {y_left_foot_3_0_1, y_left_foot_1_port};
   net {y_left_foot_3_0_0, y_left_foot_0_port};
   net {x_right_foot_3_0_3, x_right_foot_3_port};
   net {x_right_foot_3_0_2, x_right_foot_2_port};
   net {x_right_foot_3_0_1, x_right_foot_1_port};
   net {x_right_foot_3_0_0, x_left_foot_0_port};
   net {y_right_foot_3_0_3, y_right_foot_3_port};
   net {y_right_foot_3_0_2, y_right_foot_2_port};
   net {y_right_foot_3_0_1, y_right_foot_1_port};
   net {y_right_foot_3_0_0, y_left_foot_0_port};
   {U173} na310 (n144, n145, n146, y_right_leg_3_port, vss, vdd);
   {U174} na210 (n147, n148, n146, vss, vdd);
   {U175} na210 (n149, n150, n144, vss, vdd);
   {U176} na310 (n151, n152, n153, y_right_leg_2_port, vss, vdd);
   {U177} na210 (n147, n154, n153, vss, vdd);
   {U178} na210 (n149, n155, n151, vss, vdd);
   {U179} na210 (n156, n157, y_right_leg_1_port, vss, vdd);
   {U180} mu111 (n158, n159, n160, n156, vss, vdd);
   {U181} mu111 (n161, n162, y_left_foot_0_port, y_right_leg_0_port, vss, vdd);
   {U182} na210 (n163, n164, y_right_foot_3_port, vss, vdd);
   {U183} na210 (n150, n165, n164, vss, vdd);
   {U184} na210 (n148, n166, n163, vss, vdd);
   {U185} na210 (n167, n168, y_right_foot_2_port, vss, vdd);
   {U186} na210 (n155, n165, n168, vss, vdd);
   {U187} na210 (n154, n166, n167, vss, vdd);
   {U188} mu111 (n165, n166, n160, y_right_foot_1_port, vss, vdd);
   {U189} na310 (n169, n145, n170, y_left_leg_3_port, vss, vdd);
   {U190} na210 (n149, n148, n170, vss, vdd);
   {U191} na210 (n147, n150, n169, vss, vdd);
   {U192} na310 (n171, n152, n172, y_left_leg_2_port, vss, vdd);
   {U193} na210 (n149, n154, n172, vss, vdd);
   {U194} na210 (n147, n155, n171, vss, vdd);
   {U195} na210 (n173, n157, y_left_leg_1_port, vss, vdd);
   {U196} mu111 (n159, n158, n160, n173, vss, vdd);
   {U197} na210 (n174, n175, y_left_foot_3_port, vss, vdd);
   {U198} na210 (n150, n176, n175, vss, vdd);
   {U199} ex210 (n177, y_in_3_0_3, n150, vss, vdd);
   {U200} no210 (n178, y_in_3_0_2, n177, vss, vdd);
   {U201} na210 (n148, n179, n174, vss, vdd);
   {U202} ex210 (y_in_3_0_3, n180, n148, vss, vdd);
   {U203} no210 (n181, n182, n180, vss, vdd);
   {U204} na210 (n183, n184, y_left_foot_2_port, vss, vdd);
   {U205} na210 (n155, n176, n184, vss, vdd);
   {U206} ex210 (n182, n178, n155, vss, vdd);
   {U207} na210 (n185, y_left_foot_0_port, n178, vss, vdd);
   {U208} na210 (n154, n179, n183, vss, vdd);
   {U209} ex210 (n181, n182, n154, vss, vdd);
   {U210} iv110 (y_in_3_0_2, n182, vss, vdd);
   {U211} na210 (y_in_3_0_1, y_in_3_0_0, n181, vss, vdd);
   {U212} mu111 (n176, n179, n160, y_left_foot_1_port, vss, vdd);
   {U213} ex210 (n185, y_left_foot_0_port, n160, vss, vdd);
   {U214} iv110 (y_in_3_0_1, n185, vss, vdd);
   {U215} iv110 (y_in_3_0_0, y_left_foot_0_port, vss, vdd);
   {U216} na210 (n186, n187, y_head_3_0_3, vss, vdd);
   {U217} na210 (n188, n161, n187, vss, vdd);
   {U218} na210 (y_in_3_0_3, n162, n186, vss, vdd);
   {U219} na210 (n189, n190, y_head_3_0_2, vss, vdd);
   {U220} na210 (n191, n161, n190, vss, vdd);
   {U221} na210 (y_in_3_0_2, n162, n189, vss, vdd);
   {U222} na210 (n192, n193, y_head_3_0_1, vss, vdd);
   {U223} na210 (n194, n161, n193, vss, vdd);
   {U224} na210 (y_in_3_0_1, n162, n192, vss, vdd);
   {U225} na210 (n195, n196, y_head_3_0_0, vss, vdd);
   {U226} na210 (n197, n161, n196, vss, vdd);
   {U227} na210 (n162, y_in_3_0_0, n195, vss, vdd);
   {U228} na310 (n198, n199, n200, x_right_leg_3_port, vss, vdd);
   {U229} na210 (n201, n202, n200, vss, vdd);
   {U230} na210 (n203, n204, n198, vss, vdd);
   {U231} na310 (n205, n206, n207, x_right_leg_2_port, vss, vdd);
   {U232} na210 (n201, n208, n207, vss, vdd);
   {U233} na210 (n203, n209, n205, vss, vdd);
   {U234} na210 (n210, n211, x_right_leg_1_port, vss, vdd);
   {U235} mu111 (n212, n213, n214, n210, vss, vdd);
   {U236} mu111 (n162, n161, x_left_foot_0_port, x_right_leg_0_port, vss, vdd);
   {U237} na210 (n215, n216, x_right_foot_3_port, vss, vdd);
   {U238} na210 (n202, n176, n216, vss, vdd);
   {U239} na210 (n204, n179, n215, vss, vdd);
   {U240} na210 (n217, n218, x_right_foot_2_port, vss, vdd);
   {U241} na210 (n208, n176, n218, vss, vdd);
   {U242} na210 (n209, n179, n217, vss, vdd);
   {U243} mu111 (n176, n179, n214, x_right_foot_1_port, vss, vdd);
   {U244} na210 (n212, n159, n176, vss, vdd);
   {U245} na310 (n219, n199, n220, x_left_leg_3_port, vss, vdd);
   {U246} na210 (n203, n202, n220, vss, vdd);
   {U247} na210 (n201, n204, n219, vss, vdd);
   {U248} na310 (n221, n206, n222, x_left_leg_2_port, vss, vdd);
   {U249} na210 (n203, n208, n222, vss, vdd);
   {U250} na210 (n201, n209, n221, vss, vdd);
   {U251} iv110 (n212, n201, vss, vdd);
   {U252} na210 (n223, n211, x_left_leg_1_port, vss, vdd);
   {U253} mu111 (n213, n212, n214, n223, vss, vdd);
   {U254} na210 (n224, n225, x_left_foot_3_port, vss, vdd);
   {U255} na210 (n204, n165, n225, vss, vdd);
   {U256} ex210 (x_in_3_0_3, n226, n204, vss, vdd);
   {U257} no210 (n227, n228, n226, vss, vdd);
   {U258} na210 (n202, n166, n224, vss, vdd);
   {U259} ex210 (n229, x_in_3_0_3, n202, vss, vdd);
   {U260} no210 (n230, x_in_3_0_2, n229, vss, vdd);
   {U261} iv110 (n231, n230, vss, vdd);
   {U262} na210 (n232, n233, x_left_foot_2_port, vss, vdd);
   {U263} na210 (n209, n165, n233, vss, vdd);
   {U264} ex210 (n228, n227, n209, vss, vdd);
   {U265} iv110 (x_in_3_0_2, n227, vss, vdd);
   {U266} na210 (x_in_3_0_1, x_in_3_0_0, n228, vss, vdd);
   {U267} na210 (n208, n166, n232, vss, vdd);
   {U268} ex210 (x_in_3_0_2, n231, n208, vss, vdd);
   {U269} no210 (x_in_3_0_1, x_in_3_0_0, n231, vss, vdd);
   {U270} mu111 (n166, n165, n214, x_left_foot_1_port, vss, vdd);
   {U271} ex210 (x_in_3_0_1, x_in_3_0_0, n214, vss, vdd);
   {U272} na210 (n212, n158, n165, vss, vdd);
   {U273} na210 (n213, n159, n166, vss, vdd);
   {U274} iv110 (x_in_3_0_0, x_left_foot_0_port, vss, vdd);
   {U275} na210 (n234, n235, x_head_3_0_3, vss, vdd);
   {U276} na210 (n188, n162, n235, vss, vdd);
   {U277} ex210 (n236, n237, n188, vss, vdd);
   {U278} na210 (n199, n145, n237, vss, vdd);
   {U279} na210 (y_in_3_0_3, n161, n145, vss, vdd);
   {U280} na210 (x_in_3_0_3, n162, n199, vss, vdd);
   {U281} ex210 (n238, n179, n236, vss, vdd);
   {U282} na210 (n239, n240, n238, vss, vdd);
   {U283} iv110 (n241, n240, vss, vdd);
   {U284} no210 (n242, n243, n241, vss, vdd);
   {U285} no210 (n244, n245, n242, vss, vdd);
   {U286} na210 (n245, n244, n239, vss, vdd);
   {U287} na210 (x_in_3_0_3, n161, n234, vss, vdd);
   {U288} na210 (n246, n247, x_head_3_0_2, vss, vdd);
   {U289} na210 (n191, n162, n247, vss, vdd);
   {U290} ex210 (n248, n245, n191, vss, vdd);
   {U291} na210 (n249, n250, n245, vss, vdd);
   {U292} na210 (n251, n252, n250, vss, vdd);
   {U293} na210 (n243, n253, n251, vss, vdd);
   {U294} na210 (n254, n179, n249, vss, vdd);
   {U295} ex210 (n244, n179, n248, vss, vdd);
   {U296} na210 (n152, n206, n244, vss, vdd);
   {U297} na210 (x_in_3_0_2, n162, n206, vss, vdd);
   {U298} na210 (y_in_3_0_2, n161, n152, vss, vdd);
   {U299} na210 (x_in_3_0_2, n161, n246, vss, vdd);
   {U300} na210 (n255, n256, x_head_3_0_1, vss, vdd);
   {U301} na210 (n194, n162, n256, vss, vdd);
   {U302} ex210 (n257, n253, n194, vss, vdd);
   {U303} iv110 (n254, n253, vss, vdd);
   {U304} na210 (n157, n211, n254, vss, vdd);
   {U305} na210 (x_in_3_0_1, n162, n211, vss, vdd);
   {U306} na210 (y_in_3_0_1, n161, n157, vss, vdd);
   {U307} ex210 (n197, n179, n257, vss, vdd);
   {U308} iv110 (n243, n179, vss, vdd);
   {U309} no210 (n149, n203, n243, vss, vdd);
   {U310} iv110 (n158, n149, vss, vdd);
   {U311} na210 (x_in_3_0_1, n161, n255, vss, vdd);
   {U312} na210 (n258, n259, x_head_3_0_0, vss, vdd);
   {U313} na210 (n197, n162, n259, vss, vdd);
   {U314} iv110 (n252, n197, vss, vdd);
   {U315} na210 (n260, n261, n252, vss, vdd);
   {U316} na210 (n162, x_in_3_0_0, n261, vss, vdd);
   {U317} na210 (n159, n158, n162, vss, vdd);
   {U318} na210 (theta_1_0_0, theta_1_0_1, n158, vss, vdd);
   {U319} iv110 (n147, n159, vss, vdd);
   {U320} no210 (n262, theta_1_0_1, n147, vss, vdd);
   {U321} na210 (n161, y_in_3_0_0, n260, vss, vdd);
   {U322} na210 (n161, x_in_3_0_0, n258, vss, vdd);
   {U323} na210 (n212, n213, n161, vss, vdd);
   {U324} iv110 (n203, n213, vss, vdd);
   {U325} no210 (theta_1_0_0, theta_1_0_1, n203, vss, vdd);
   {U326} na210 (theta_1_0_1, n262, n212, vss, vdd);
   {U327} iv110 (theta_1_0_0, n262, vss, vdd);
}



