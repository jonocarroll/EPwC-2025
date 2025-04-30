unit U_unique_count;

interface

  procedure unique_count_main;


implementation
uses
  System.SysUtils, Spring, Spring.Collections, U_Gen_Data;

const
  N    = 20000;
  crlf = #13#10;


  function uniq_spring_set : string;
  begin
  var s := TCollections.CreateSet(data);
      exit('Spring Set : ' + s.Count.ToString + crlf);
  end;


  function uniq_spring_list : string;
  begin
  var l := TCollections.CreateList(data);
      exit('Spring List : ' + l.Distinct.Count.ToString + crlf);
  end;


  function uniq_spring_sortedlist : string;
  begin
  var l := TCollections.CreateSortedList(data);
      exit('Spring SortedList : ' + l.Distinct.Count.ToString + crlf);
  end;


  function uniq_spring_enum : string;
  begin
      exit('Spring Enumerable : ' + TEnumerable.From(data)
                                               .Distinct
                                               .Count
                                               .ToString  + crlf);
  end;


  function uniq_array_int : string;
  begin
  var last:= -1;
  var cnt :=  0;
      TArray.Sort<integer>(data);
      for var i in data do
          if i<>last then begin
                            inc(cnt); last := i;
                          end;
      exit('TArray : ' + cnt.ToString + crlf);
  end;



  procedure unique_count_main;
  begin
     generate_uniq_data(N);

     writeln(uniq_spring_set);
     writeln(uniq_spring_list);
     writeln(uniq_spring_sortedlist);
     writeln(uniq_spring_enum);
     writeln(uniq_array_int);
  end;

end.




