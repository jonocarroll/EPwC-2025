unit U_Test_Instrumented;

interface

  procedure Instrumented_Main;



implementation
uses System.SysUtils, System.Types, System.Generics.Collections, System.Generics.Defaults, U_Instrumented;


   procedure ByValue                 (rec: TInstrum<integer>);  begin writeln('Called by value')      end;
   procedure ByConstValue (const      rec: TInstrum<integer>);  begin writeln('Called as const')      end;
   procedure ByRef        (var        rec: TInstrum<integer>);  begin writeln('Called as ref')        end;
   procedure ByConstRef   (const[ref] rec: TInstrum<integer>);  begin writeln('Called as const ref')  end;
   function  Returned : TInstrum<integer>;                      begin writeln('Returned by function') end;



  procedure Instrumented_Main;
  type
     TInsInt = TInstrum<integer>;
  begin
     begin
       var a:= TInsInt.Create(1);
       var b:= TInsInt.Create(2);

       writeln;    ByValue      (a);
       writeln;    ByConstValue (a);
       writeln;    ByRef        (a);
       writeln;    ByConstRef   (a);
       writeln;    b := Returned;
       writeln;
     end;

     writeln('---');

     TInstrum<integer>.Tally;
  end;

end.






{
     var x:TArray< integer >;              // TInsInt
     Setlength(x,10);

     for var i:= 0 to 9 do x[i] := (10-i); // TInsInt.Create(10-i);

//     TArray.Sort<TInsInt>(x,  TComparer<TInsInt>.Construct(
//                                  function(const Left, Right: TInsInt): Integer
//                                  begin
//                                    Result := Left.value - Right.value;
//                                  end
//                              )
//                         );
     TArray.Sort<integer>(x);              // weird errors for TInsInt


}
