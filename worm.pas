program worm;
uses crt;

var
  running:Boolean;
  x: integer;
  mov: char;
  i,moves: integer;

begin
  clrscr;
  moves := 0;
  x := 5;
  running:= true;

  while running do
  begin
    clrscr;
    for i := 1 to 10 do
    begin
      if i = x then
        write('@')
      else
        write('.');
    end;

    writeln;
    writeln('Position: ', x);
    writeln('Move (a/d): ');
    write('moves: ',moves);

    readln(mov);
    
    if mov = 'q' then
      running := false;

    if mov = 'a' then
    begin
      x := x - 1;
      moves:= moves +1;
    end;

    if mov = 'd' then
    begin
      x := x + 1;
      moves:= moves+1;
    end;

    if x < 1 then
    begin
     write('you hit the left wall.GAME OVER') ;
     running :=false
     end;
    if x > 10 then
    begin
     write('you hit the right wall.GAME');
     running := false;
     end 
  end
end.
