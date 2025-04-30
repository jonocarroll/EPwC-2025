unit U_Gen_Data;

interface
uses System.SysUtils, Spring, Spring.Collections;

type
  TPairs = TPair<integer,integer>;

var
  data     : TArray<integer>;
  data_arr : TArray<TPairs>;
  data_lst : IList<integer>;

procedure generate_pair_data(N,N2:integer);
procedure generate_series_data (N:integer);
procedure generate_uniq_data   (N:integer);


implementation

procedure generate_pair_data(N,N2:integer);
  begin
      setlength(data_arr,N);
      TEnumerable.Range(0,N-1)
                 .ForEach( procedure (const i:integer)
                              begin data_arr[i] := TPairs.Create(random(N2),random(N2)) end );
      writeln;
  end;


procedure generate_series_data(N:integer);
  begin
      data_lst := TCollections.CreateList<integer>;
      TEnumerable.Range(1,N)
                 .ForEach( procedure (const i:integer)
                              begin data_lst.Add( random(N) ) end );
      writeln;
  end;


  procedure generate_uniq_data(N:integer);
  begin
      setlength(data, N);
      TEnumerable.Range(0,N-1)
                 .ForEach( procedure (const i:integer) begin data[i] := random(N) end );
      writeln;
  end;

end.



//type
//  rng_fn = reference to function (start, count: Integer): IReadOnlyList<Integer>;
//var
//  rng := TEnumerable.Range;
//  for var i in rng(0,N-1) do data[i] := random(N);

//type
//  chunk_fn<T> = reference to function (const source: IEnumerable<T>; size: Integer) : IEnumerable<TArray<T>>;
//var
//  chunk : chunk_fn<integer> := TEnumerable.Chunk<integer>;
//  for var ch in chunk(data_lst,2) do z:= minmax(z,ch);


