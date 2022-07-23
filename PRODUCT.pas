var sub_num, ans: int64;
    i, head, tail: byte;
    s, sub: string;
    nums: SET OF char;
    f1, f2: text;

BEGIN

 assign(f1, 'PRODUCT.INP'); reset(f1);
 assign(f2, 'PRODUCT.OUT'); rewrite(f2);

 readln(f1, s);

 ans := 1;
 nums := ['0'..'9'];
 s := #32 + s + #32';
 for i := 2 to length(s) - 1 do
 begin
  if (s[i] IN nums) and (not (s[i - 1] IN nums)) then head := i;
  if (s[i] IN nums) and (not (s[i + 1] IN nums)) then
  begin
   tail := i;
   sub := copy(s, head, tail - head + 1);
   val(sub, sub_num);
   ans := ans * sub_num;
  end;
 end;

 writeln(ans);

 close(f1);
 close(f2);

END.
