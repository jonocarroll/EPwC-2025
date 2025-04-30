unit U_MinMax_Element;

interface

  procedure minmax_main;


implementation
uses
  System.SysUtils, Spring, Spring.Collections, U_Gen_Data;

const
  N1   = 10000;
  N2   = 20000;
  crlf = #13#10;
  zero : TPairs = (Key:N2; Value:0);
  zarr : TArray<integer> = [N2,0];



function minmax(a,b:TPairs) : TPairs;                     overload;
  begin
      result := a;
      if b.Value < b.Key   then b:= TPairs.Create(b.Value,b.Key);
      if b.Key   < a.Key   then result.Key   := b.Key;
      if b.Value > a.Value then result.Value := b.Value;
  end;

function minmax(a,b:TArray<integer>) : TArray<Integer>;   overload;     // actually Tuple of size 2 😥
begin
      result := a;
      if b[1] < b[0] then b:= [ b[1],b[0] ];
      if b[0] < a[0] then result[0] := b[0];
      if b[1] > a[1] then result[1] := b[1];
end;



function minmax_element_pairs : string;
  begin
  var z := zero;
      for var e in data_arr do z:= minmax(z,e);
      exit('Array MinMax : Min ' + z.Key.ToString + ' Max ' + z.Value.ToString + crlf);
  end;


function minmax_element_IList : string;
  begin
      exit('List MinMax  : Min ' + data_lst.Min.ToString + ' Max ' + data_lst.Max.ToString + crlf);
  end;


function minmax_element_chunk : string;
  var z :TArray<integer>;
  begin
      z := zarr;
      for var ch in TEnumerable.Chunk<integer>(data_lst,2) do z:= minmax(z,ch);
      exit('Chunk MinMax : Min ' + z[0].ToString + ' Max ' + z[1].ToString + crlf);
  end;



procedure minmax_main;
  begin
      generate_pair_data(N1,N2);
      generate_series_data(N2);

      writeln( minmax_element_pairs );
      writeln( minmax_element_IList);
      writeln( minmax_element_chunk );
  end;

end.




