var d, m, y, db, mb, yb, age: integer;
    s, sub: string;
    f1, f2: text;

BEGIN

 assign(f1, 'AGE.INP'); reset(f1);
 assign(f2, 'AGE.OUT'); rewrite(f2);

 readln(f1, s);
 sub := copy(s, 1, 2);
 val(sub, d);
 sub := copy(s, 4, 2);
 val(sub, m);
 sub := copy(s, 7, 4);
 val(sub, y);

 readln(f1, s);
 sub := copy(s, 1, 2);
 val(sub, db);
 sub := copy(s, 4, 2);
 val(sub, mb);
 sub := copy(s, 7, 4);
 val(sub, yb);

 age := y - yb;
 if m < mb then dec(age)
  else if m = mb then
   if (d < db) then dec(age);

 if age < 0 then writeln(f2, '-1')
  else if age > 130 then writeln(f2, '-2')
   else writeln(f2, age);

 close(f1);
 close(f2);

END.