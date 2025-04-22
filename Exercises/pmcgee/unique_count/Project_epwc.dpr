{$APPTYPE CONSOLE}
program Project_epwc;
uses
  System.SysUtils,
  U_unique_count in 'U_unique_count.pas',
  U_MinMax_Element in '..\minmax_elem\U_MinMax_Element.pas';

begin
   Unique_Count_Main;
   MinMax_Main;

   readln;
end.
