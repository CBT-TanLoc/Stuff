var i, j, len: byte;
    count: byte;
    s: string;
    f1, f2: text;
    isTrue: boolean;

BEGIN

 assign(f1, 'ISO.INP'); reset(f1);
 assign(f2, 'ISO.OUT'); rewrite(f2);

 isTrue := false;
 readln(f1, s);

 len := length(s);

 for i := 1 to len do
 begin
  for j := 1 to len do
   if s[i] = s[j] then inc(count);
  if count <> 2 then isTrue := false;
 end;

 if isTrue then writeln(f2, 'YES') else writeln(f2, 'NO');

 close(f1);
 close(f2);

END.