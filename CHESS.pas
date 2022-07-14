uses crt;
const  mv_r: array[1..8] of integer = (-2, -1, 1, 2, 2, 1, -1, -2);
       mv_c: array[1..8] of integer = (1, 2, 2, 1, -1, -2, -2, -1);

var x, y, chess: byte;
    a: array[-100..100, -100..100] of byte;
    f1, f2: text;

procedure print_ans();
var i, j: integer;
begin
 for i := 1 to chess do
 begin
  for j := 1 to chess do write(a[i, j]:4);
  writeln;
 end;
 writeln;
end;

procedure move(n, x, y: integer);
var j, r, c: integer;
begin

  for j := 1 to 8 do
  begin

   r := x + mv_r[j];
   c := y + mv_c[j];

   if (r >= 1) and (r <= chess) and (c >= 1) and (c <=chess) and (a[r, c] = 0) then
   begin
    a[r, c] := n;
    if (n = chess * chess) then print_ans() else  move(n + 1, r, c);
    a[r, c] := 0;
   end;

  end;

end;

BEGIN
 clrscr;
 assign(f1, 'CHESS.INP'); reset(f1);
 assign(f2, 'CHESS.OUT'); rewrite(f2);

 readln(f1,chess);
 readln(f1, x, y);
 fillchar(a, sizeof(a), 0);

 a[x, y] := 1;
 move(2, x, y);

 close(f1);
 close(f2);
 readln;
END.

