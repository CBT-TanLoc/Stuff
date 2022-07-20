var i, count: int64;
    n, a, b: int64;
    sn, sa, sb, si: string;
    f1, f2: text;

BEGIN

 assign(f1, 'NUMBER.INP'); reset(f1);
 assign(f2, 'NUMBER.OUT'); rewrite(f2);

 count := 0;

 readln(f1, n);
 readln(f1, a, b);

 str(n, sn);
 str(a, sa);
 str(b, sb);

 i := a;
 while i <= b do
 begin
  str(i, si);
  if pos(sn, si) <> 0 then inc(count);
  inc(i);
 end;

 writeln(f2, count);

 close(f1);
 close(f2);

END.
