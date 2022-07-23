var n, i, j, left, right, count, temp: integer;
    nums: SET OF char;
    si, sub: string;
    a: array[1..10000] of longint;
    s: array[1..500] of string;
    f1, f2: text;

BEGIN

 assign(f1, 'SORT1.INP'); reset(f1);
 assign(f2, 'SORT1.OUT'); rewrite(f2);

 readln(f1, n);
 for i := 1 to n do readln(f1, s[i]);

 count := 0;
 nums := ['0'..'9'];
 for i := 1 to n do
 begin
  si := s[i];
  si := #32 + si + #32;
  for j := 1 to length(si) - 1 do
  begin
   if (si[j] IN nums) and (not (si[j - 1] IN nums)) then left := j;
   if (si[j] IN nums) and (not (si[j + 1] IN nums)) then
   begin
    right := j;
    sub := copy(si, left, right - left + 1);
    inc(count);
    val(sub, a[count]);
   end;
  end;
 end;

 for i := 1 to count - 1 do
  for j := i + 1 to count do
   if a[i] > a[j] then
   begin
    temp := a[i];
    a[i] := a[j];
    a[j] := temp;
   end;

 for i := 1 to count do writeln(f2, a[i]);

 close(f1);
 close(f2);

END.