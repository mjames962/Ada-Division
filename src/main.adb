pragma SPARK_Mode (On);

with AS_Io_Wrapper, Division;
use AS_Io_Wrapper, Division;

procedure Main is

   valid : Boolean;
   value : Integer;

begin

   loop
      Division.run;

      AS_Put_Line ("Run again?");

      loop
         AS_Put_Line ("Enter: YES(1) / NO(0)");
   -- ask for an  integer (in variable value) until an integer has been entered
         --   if something else has been entered ask again
         AS_Get (value, "Please type in an integer; please try again");

         if value = 0 or value = 1 then
            valid := True;
         else
            valid := False;
         end if;

         exit when valid;
      end loop;

      exit when value = 0;
   end loop;

   null;
end Main;
