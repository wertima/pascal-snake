program sas;
uses crt;
var
	snakeX,snakeY:array[1..100] of integer;
	mov,choice,diffchoice,dir:char;
	i,j,moves,foodX,foodY,score,len,k,del:integer;
	running,snakePart:boolean;
procedure initgame;
begin
        foodX:= random(18)+2;
        foodY:= random(8)+2;
        len:= 1;
        snakeX[1]:= 10;
        snakeY[1]:= 5;
        score:=0;
        dir := 'd';
        running:= true;
        moves:=0;
end;
begin
	randomize;
	cursoroff;
	foodX:= random(18)+2;
        foodY:= random(8)+2;
	len:= 1;
	snakeX[1]:= 10;
	snakeY[1]:= 5;
	score:=0;
	dir := 'd';
	del:=200;
	running:= true;
	moves:=0;
	repeat
		clrscr;
		gotoxy(screenwidth div 2 - 7,screenheight div 2 - 2);
		writeln('#### SNAKEE ####');
		gotoxy(screenwidth div 2 - 7,screenheight div 2);
		writeln('1 Start Game');
		gotoxy(screenwidth div 2 - 7,screenheight div 2 +1);
		writeln('2 Difficulty');
		gotoxy(screenwidth div 2 - 7,screenheight div 2 + 2);
		writeln('3 Controls');
		gotoxy(screenwidth div 2 - 7,screenheight div 2 + 3);
		writeln('4 Exit');

		choice := readkey;
		case choice of
		'1':
		begin
	initgame;
	while running do
	begin
	if keypressed then 
	begin
	   mov := readkey;
	   if (mov = 'w') and (dir <> 's') then dir :='w';
	   if (mov = 'a') and (dir <> 'd') then dir :='a';
	   if (mov = 's') and (dir <> 'w') then dir :='s';
	   if (mov = 'd') and (dir <> 'a') then dir :='d';

	   if mov = 'q' then running := false;
	   if mov = 'p' then 
	   begin
		   repeat
	           until readkey = 'p';
           end;
	end;
	for i := len downto 2 do
        begin
          snakeX[i] := snakeX[i-1];
          snakeY[i] := snakeY[i-1];
        end;
	 if dir = 'a' then
        begin
                snakeX[1] := snakeX[1]-1;
                moves:= moves+1;
        end;
        if dir = 'd' then
        begin
                snakeX[1] := snakeX[1]+1;
                moves:= moves+1;
        end;
        if dir = 's' then
        begin
                snakeY[1]:=snakeY[1]+1;
                moves:= moves +1;
        end;
        if dir = 'w' then
        begin
                snakeY[1]:=snakeY[1] -1;
                moves:= moves+1;
        end;
        for k:= 2 to len do
		if (snakeX[1] = snakeX[k]) and (snakeY[1] = snakeY[k]) then
		   running := false;
         if (snakeX[1] = foodX) and (snakeY[1] = foodY) then
        begin
                len:=len+1;

                snakeX[len] := snakeX[len-1];
                snakeY[len] := snakeY[len-1];

                score:= score+1;

                repeat

                foodX:= random(18) + 2;
                foodY:= random(8) + 2;
                snakePart:= false;
                for k := 1 to len do
                   if (foodY = snakeY[k]) and (foodX = snakeX[k]) then
                           snakePart:= true
                until not snakePart;

        end;
	clrscr;

		for i := 1 to 10 do
		begin
			for j := 1 to 20 do
			begin
				snakePart:=false;

				for k:= 1 to len do
                                if (snakeX[k] = j) and (snakeY[k] = i) then
                                        snakePart:=true;

				if (i = 1) or (i = 10) or (j = 1) or (j = 20) then
				begin
			           textcolor(lightgray);
				   write('#');
				   textcolor(white);
				end
				else if (snakeX[1]=j) and (snakeY[1] = i) then
				begin
					textcolor(green);
					write('O');
					textcolor(white);
				end
				else if snakePart then
				begin
				   textcolor(green);
				   write('o');
				   textcolor(white);
				end
		                else if (i=foodY) and (j=foodX) then
				begin
			           textcolor(red);
				   write('*');
				   textcolor(white);
				end
			        else
				begin
		                  write('.');
			        end;
	                 end;
			 writeln
	        end;		 
	writeln('moves',moves);
	writeln('score: ',score);
	writeln('len = ',len);
	writeln('moves a/s/d/w: ');
	if (snakeX[1] <= 1) or (snakeX[1] >= 20) or (snakeY[1] <= 1) or (snakeY[1] >= 10) then
	begin 
		write('END you left the field');
		running := false;
	end;
	if running = false then
	begin
		clrscr;

                   gotoXY((screenwidth - length('GAME OVER')) div 2,screenheight div 2);
                   write('GAME OVER');

                   gotoXY((screenwidth - 10) div 2,
                      screenheight div 2 + 1);
                   write('score: ', score);
                   readkey;
        end;
	if del - score > 20 then
	   delay(del - score)
        else 
	   delay(20);
        end;
	      end;
	      
	      '2':
	       begin
		     clrscr;
		     writeln('DIFFICULTY');
		     writeln;
		     writeln('1 Easy');
		     writeln('2 Normal');
		     writeln('3 HARD');
		     writeln(' Press any key...');

		     diffchoice := readkey;

		     case diffchoice of 
		     '1':    del := 300;
	             '2':    del := 200;
		     '3':    del := 100;
	              end;
	       end;
	       '3':
	        begin
			clrscr;
                       writeln('Controls:');
                       writeln('W A S D - move');
                       writeln('P - pause');
                       writeln('Q - quit');
                       writeln;
                       writeln('Press any key...');
                       readkey;
		end;
		'4': halt;
	end;
	until false;
end.
