unit U_Instrumented;

interface
      uses Spring.SystemUtils;
type
  TInstrum<T> = record
    type
       TCounting = (new,kill,assign);

    public
       value : T;
       class function  Create(const _t: T): TInstrum<T>; static;
       class procedure Tally;                            static;

    private
       class var counts: array [TCounting] of integer;

       class operator initialize    (out Dest: TInstrum<T>);
       class operator finalize      (var Dest: TInstrum<T>);
       class operator assign        (var Dest: TInstrum<T>; const[ref] Src: TInstrum<T>);
  end;




implementation
uses System.SysUtils;

   class function TInstrum<T>.Create(const _t: T): TInstrum<T>;
   begin
      Result.value := _t;
   end;


   class procedure TInstrum<T>.Tally;
   begin
      writeln('Created   : ', counts[new]   );
      writeln('Destroyed : ', counts[kill]  );
      writeln('Assigned  : ', counts[assign]);
   end;


   class operator TInstrum<T>.Assign(var        Dest: TInstrum<T>; const[ref] Src: TInstrum<T>  );
   begin
      inc(counts[assign]);
      writeln('assign  ' + IntPtr(@Src).ToHexString +' -> '+ IntPtr(@Dest).ToHexString);
   end;


   class operator TInstrum<T>.Initialize(out Dest:TInstrum<T>);
   begin
      inc(counts[new]);
      writeln('create  ' + IntPtr(@Dest).ToHexString);
   end;


   class operator TInstrum<T>.Finalize(var Dest:TInstrum<T>);
   begin
      inc(counts[kill]);
      writeln('destroy ' + IntPtr(@Dest).ToHexString);
   end;


end.
