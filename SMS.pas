var i, n, cost: integer;
    cost_1, cost_2, cost_3: SET OF char;
    a: array[1..1000] of char;
    f1, f2: text;

BEGIN

 assign(f1, 'SMS.INP'); reset(f1);
 assign(f2, 'SMS.OUT'); rewrite(f2);

 cost_1 := ['a', 'd', 'g', 'j', 'm', 'p', 's', 'v', 'y', '.', #32];
 cost_2 := ['b', 'e', 'h', 'k', 'n', 'q', 't', 'w', 'z', ','];
 cost_3 := ['c', 'f', 'i', 'l', 'o', 'r', 'u', 'x', '!'];

 while not eof(f1) do
 begin
  inc(i);
  read(f1, a[i]);
 end;
 n := i;

 cost := 0;
 for i := 1 to n do
 begin
  if a[i] IN cost_1 then cost := cost + 1
   else if a[i] IN cost_2 then cost := cost + 2
    else cost := cost + 3;
 end;

 writeln(f2, cost);

 close(f1);
 close(f2);

END.