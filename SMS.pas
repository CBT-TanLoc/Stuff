var i, cost, x : integer;
    s: string;
    Button0: SET OF char;
    f1, f2: text;

BEGIN

 assign(f1, 'SMS.INP'); reset(f1);
 assign(f2, 'SMS.OUT'); rewrite(f2);

 Button0 := ['.',',','!'];

 readln(f1, s);

 for i := 1 to length(s) do
 begin
  if s[i] = ' ' then x := 1 else
   if s[i] IN Button0 then
   begin
    case s[i] of
     '.': x := 1;
     ',': x := 2;
     '!': x := 3;
    end;
   end else
   begin
    x := (ord(s[i]) - 96) mod 3;
    if x = 0 then x := 3;
   end;
  cost := cost + x;
 end;

 writeln(f2, cost);

 close(f1);
 close(f2);

END.
