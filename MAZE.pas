var i, j, r, c, steps: integer;
    s: string;
    founded: boolean;
    a: array[-100..100, -100..100] of char;
    f1, f2: text;

BEGIN
 assign(f1, 'MAZE.INP'); reset(f1);
 assign(f2, 'MAZE.OUT'); rewrite(f2);

 fillchar(a, sizeof(a), '#');
 for i := 1 to 10 do
 begin
  for j := 1 to 10 do
  begin
   read(f1, a[i, j]);
   if a[i, j] = 'R' then
   begin
    r := i;
    c := j;
   end;
  end;
  readln(f1);
 end;
 readln(f1, s);
 a[r,c] := '.';

 for i := 1 to length(s) do
 begin
  founded := false;

  if i mod 2 = 1 then val(s[i + 1], steps);

  if (s[i] = 'N') and (r <> 1) then
  begin
   for j := 0 to steps do
    if  (a[r - j, c] = '.') and (a[r - j - 1, c] = '#')  then
    begin
     r := r - j;
     founded := true;
     break;
    end;
   if founded = false then r := r - steps;
  end;

  if (s[i] = 'S') and (r <> 10) then
  begin
   for j := 0 to steps do
    if  (a[r + j, c] = '.') and (a[r + j + 1, c] = '#')  then
    begin
     r := r + j;
     founded := true;
     break;
    end;
   if founded = false then r := r + steps;
  end;

  if (s[i] = 'E') and (c <> 10) then
  begin
   for j := 0 to steps do
    if  (a[r, c + j] = '.') and (a[r, c + j + 1] = '#')  then
    begin
     c := c + j;
     founded := true;
     break;
    end;
   if founded = false then c := c + steps;
  end;

  if (s[i] = 'W') and (c <> 1) then
  begin
   for j := 0 to steps do
    if  (a[r, c - j] = '.') and (a[r, c - j - 1] = '#')  then
    begin
     c := c - j;
     founded := true;
     break;
    end;
   if founded = false then c := c - steps;
  end;

 end;


 writeln(r,' ',c);
 close(f1);
 close(f2);
 readln
END.
