cd ~/Tanks-EPO3
git pull

cp ~/Tanks-EPO3/BulletManagement/*.vhd ~/game_top/VHDL
cp ~/Tanks-EPO3/input/*.vhd ~/game_top/VHDL
cp ~/Tanks-EPO3/pixelgenerator/VHDL\ files/*.vhd ~/game_top/VHDL
cp ~/Tanks-EPO3/tankPosition/*.vhd ~/game_top/VHDL
cp ~/Tanks-EPO3/video-output/*.vhd ~/game_top/VHDL
cp ~/Tanks-EPO3/pixelgenerator/VHDL\ files/cfgs/*.vhd ~/game_top/VHDL
cp ~/Tanks-EPO3/*.vhd ~/game_top/VHDL

rm ~/game_top/VHDL/*tb*
rm ~/game_top/VHDL/*syn*
rm ~/game_top/VHDL/*ext*
rm ~/game_top/VHDL/*test*


