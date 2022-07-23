var i, j, n, count: integer;
    temp: char;
    s: array[1..1000] of char;
    f1, f2: text;

BEGIN

 assign(f1, 'NUMBER.INP'); reset(f1);
 assign(f2, 'NUMBER.OUT'); rewrite(f2);

 i := 0;
 while not eof(f1) do
 begin
  inc(i);
  read(f1, s[i]);
 end;
 n := i;

 for i := 1 to n - 1 do
  for j := i + 1 to n do
   if s[i] > s[j] then
   begin
    temp := s[i];
    s[i] := s[j];
    s[j] := temp;
   end;

 for i := 1 to n do
  if s[i] <> '0' then write(f2, s[i]);
 readln;

 close(f1);
 close(f2);

END.
