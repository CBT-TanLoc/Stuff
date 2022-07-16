var i: byte;
    s_origin, s, s_rev: string;
    vow: SET OF char;
    isTrue: boolean;
    f1, f2: text;

BEGIN

 assign(f1, 'PALIN1.INP'); reset(f1);
 assign(f2, 'PALIN1.OUT'); rewrite(f2);

 vow := ['A', 'E', 'I', 'O', 'U', 'Y'];
 isTrue := true;

 readln(f1, s_origin);

 for i := 1 to length(s_origin) do
  if s_origin[i] IN vow then s := s + s_origin[i];

 for i := 1 to length(s) do
  s[i] := upcase(s[i]);

 for i := length(s) downto 1 do
  s_rev := s_rev + s[i];

 for i := 1 to length(s) do
  if s[i] <> s_rev[i] then isTrue := false;

 if isTrue then writeln(f2, s) else writeln(f2, 'No');

 close(f1);
 close(f2);

END.
