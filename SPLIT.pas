uses crt;
var i, j, n, half, sum, tc, tr, count: integer;
    a, ans: array[-100..100] of integer;
    dp: array[-100..100, -100..100] of integer;

BEGIN
 clrscr;
 readln(n);
 for i := 1 to n do readln(a[i]);

 for i := 1 to n do sum := sum + a[i];

 half := sum div 2;

 fillchar(dp[0], sizeof(dp[0]), 0);
 for i := 1 to n do
  for j := 0 to half do
  begin
   dp[i, j] := dp[i - 1, j];
   if j - a[i] = dp[i - 1, j - a[i]] then dp[i, j] := j;
  end;

 for i := half downto 1 do
  if dp[n, i] <> 0 then
  begin
   tc := i;
   break;
  end;

 writeln(abs(tc-(sum-tc)));

 readln;
END.