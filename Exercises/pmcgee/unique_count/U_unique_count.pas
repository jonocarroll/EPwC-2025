unit U_unique_count;

interface

  procedure unique_count_main;


implementation
uses Spring, Spring.Collections, System.SysUtils;

const
  N = 20000;
  crlf = #13#10;
var
  data : TArray<integer>;

  procedure generate_data;
  begin
     setlength(data, 20000);
     for var i:= 0 to high(data) do data[i] := random(N);
     writeln;
  end;


  function spring_set : string;
  var s : ISet<integer>;
  begin
     s := TCollections.CreateSet<integer>(data);
     exit('Spring Set : ' + s.Count.ToString + crlf);
  end;


  function spring_list : string;
  var l : IList<integer>;
  begin
     l := TCollections.CreateList<integer>(data);
     exit('Spring List : ' + l.Distinct.Count.ToString + crlf);
  end;


  function spring_sortedlist : string;
  var l : IList<integer>;
  begin
     l := TCollections.CreateSortedList<integer>(data);
     exit('Spring SortedList : ' + l.Distinct.Count.ToString + crlf);
  end;


  function array_int : string;
  begin
     var lst := -1;
     var cnt :=  0;
     TArray.Sort<integer>(data);
     for var i in data do
         if i<>lst then
            begin inc(cnt); lst := i; end;
     exit('Array : ' + cnt.ToString + crlf);
  end;



  procedure unique_count_main;
  begin
     generate_data;

     writeln(spring_set);
     writeln(spring_list);
     writeln(spring_sortedlist);
     writeln(array_int);
  end;

end.
