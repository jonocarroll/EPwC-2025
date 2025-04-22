unit U_MinMax_Element;

interface

  procedure minmax_main;


implementation
uses Spring, Spring.Collections, System.SysUtils, System.Generics.Collections;

const
  N = 20000;
  crlf = #13#10;

type
  TElems = TPair<integer,integer>;

var
  data : TArray< TElems >;


// Compiler was giving me grief over the Record Helper class  😭

//  TPairHelper = record helper for TElems
//     class function minmax(a,b:TElems) : TElems;
//  end;
//
//  class function TPairHelper.minmax(a,b:TElems) : TElems;
//  begin
//     result := a;
//     if b.Key   <  a.Key   then result.Key   := b.Key;
//     if b.Value >= a.Value then result.Value := b.Value;
//  end;



procedure generate_data;
  var x,y:integer;
  begin
     setlength(data, 10000);
     for var i:= 0 to high(data) do begin
         x := random(N);
         y := random(N);
         data[i] := TElems.Create(x,y);
     end;
     writeln;
  end;


function minmax(a,b:TElems) : TElems;
begin
     result := a;
     if b.Key   <  a.Key   then result.Key   := b.Key;
     if b.Value >= a.Value then result.Value := b.Value;
end;



function minmax_element : string;
var z:TElems;
begin
  z := data[0];
  for var e in data do
      z:= minmax(z,e); //TElems.minmax(z,e);

  exit('MinMax by helper : Min ' + z.Key.ToString + ' Max ' + z.Value.ToString + crlf);
end;




  procedure minmax_main;
  begin
     generate_data;

     writeln( minmax_element );
  end;

end.
