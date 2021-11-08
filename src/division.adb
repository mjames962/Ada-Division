pragma SPARK_Mode (On);

with AS_Io_Wrapper, SPARK.Text_IO;
use AS_Io_Wrapper, SPARK.Text_IO;

package body Division is

   procedure div (dividend : in Integer; divisor : in Integer) is

      remainder : Integer;
      quotient  : Integer;

   begin
      remainder := dividend;
      quotient  := 0;

      loop
         exit when divisor > remainder;

         remainder := remainder - divisor;
         quotient  := quotient + 1;

      end loop;

      AS_Put_Line ("Quotient:");
      AS_Put_Line (quotient);
      AS_Put_Line ("Remainder:");
      AS_Put_Line (remainder);

   end div;

   procedure run is
      dividend : Integer;
      divisor  : Integer;

   begin

      -- First we initialise standard_input and standard output
      AS_Init_Standard_Output;
      AS_Init_Standard_Input;
      AS_Put_Line ("Calculate quotient and remainder");

      -- Print on screen "Type in some number"
      AS_Put_Line ("Type in dividend");
-- ask for an  integer (in variable dividend) until an integer has been entered
      --   if something else has been entered ask again
      AS_Get (dividend, "Please type in an integer; please try again");

      AS_Put_Line ("Type in divisor");
      AS_Get (divisor, "Please type in an integer; please try again");

      Division.div (dividend => dividend, divisor => divisor);

      null;
   end run;

end Division;
