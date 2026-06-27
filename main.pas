program wormika;
uses crt;
var
   mov:char;
   i,x,moves:integer;
   running:boolean;
begin
   clrscr;
   x:=5;
   moves:= 0;
   running:= true;
   while running do
   begin
      clrscr;
      for i:= 1 to 10 do
      begin
	 if i = x then
	    write('$')
	 else
	    write('.');
   end;
   writeln('moves: ',moves);
   writeln('type a/d');
   read(mov);
   if mov = 'a' then
   begin
	x:= x-1;
	moves := moves + 1;
   end;
   if mov = 'd' then
   begin
      x := x+1;
      moves:= moves + 1;
   end;
   if mov = 'q' then
      running := false;
   end;
end.
