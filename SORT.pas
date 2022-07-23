var i, j, left, right, count, temp: integer;
    s, sub,stemp: string;
    a: array[1..100] of string;
    b: array[1..100] of integer;
    f1, f2: text;

BEGIN

 assign(f1, 'SORT.INP'); reset(f1);
 assign(f2, 'SORT.OUT'); rewrite(f2);

 readln(f1, s);

 count := 1;
 s:= #32 + s + #32;
 for i := 2 to length(s) - 1 do
 begin
  if (s[i] <> #32) and (s[i - 1] = #32) then left := i;
  if (s[i] <> #32) and (s[i + 1] = #32) then
  begin
   right := i;
   sub := copy(s, left, right - left + 1);
   inc(count);
   a[count] := sub;
   b[count] := length(sub);
  end;
 end;

 for i := count downto 2 do
  for j := 1 to i - 1 do
  if b[i] > b[j] then
  begin

   temp := b[i];
   b[i] := b[j];
   b[j] := temp;

   stemp := a[i];
   a[i] := a[j];
   a[j] := stemp;

  end;


 for i := 1 to count do write(f2, a[i], #32);
 close(f1);
 close(f2);

END.