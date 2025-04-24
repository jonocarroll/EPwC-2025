{$APPTYPE CONSOLE}
program Project_epwc;
uses
  System.SysUtils,
  U_unique_count   in 'unique_count\U_unique_count.pas',
  U_MinMax_Element in 'minmax_elem\U_MinMax_Element.pas',
  U_Gen_Data       in 'U_Gen_Data.pas';

begin
   Unique_Count_Main;
   MinMax_Main;

   readln;
end.






