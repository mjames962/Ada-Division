pragma SPARK_Mode (On);

with AS_Io_Wrapper, SPARK.Text_IO;
use AS_Io_Wrapper, SPARK.Text_IO;

package body Division is

   procedure div
     (dividend : in     Integer; divisor : in Integer; remainder : out Integer;
      quotient :    out Integer)
   is

   -- Dividend = (quotient * divisor) + remainder
   -- quotient = (dividend - remainder)/divisor

   begin

      remainder := dividend;
      quotient  := 0;

      loop

         exit when divisor > remainder;

         pragma Loop_Invariant
           (dividend = (quotient * divisor) + remainder and
            divisor <= remainder);

         remainder := remainder - divisor;
         quotient  := quotient + 1;

      end loop;

   end div;

   procedure run is
      dividend  : Integer;
      divisor   : Integer;
      remainder : Integer;
      quotient  : Integer;

   begin

      -- First we initialise standard_input and standard output
      AS_Init_Standard_Output;
      AS_Init_Standard_Input;
      AS_Put_Line ("Calculate quotient and remainder");

      loop
         -- Print on screen "Type in some number"
         AS_Put_Line ("Type in a positive dividend");
-- ask for an  integer (in variable dividend) until an integer has been entered
         --   if something else has been entered ask again
         AS_Get (dividend, "Please type in an integer; please try again");
         exit when dividend >= 0 and dividend <= Integer'Last;
      end loop;

      loop
         AS_Put_Line ("Type in a positive divisor");
         AS_Get (divisor, "Please type in an integer; please try again");
         exit when divisor >= 1 and divisor <= Integer'Last;
      end loop;

      Division.div
        (dividend => dividend, divisor => divisor, remainder => remainder,
         quotient => quotient);

      AS_Put_Line ("Quotient:");
      AS_Put_Line (quotient);
      AS_Put_Line ("Remainder:");
      AS_Put_Line (remainder);

      null;
   end run;

end Division;
