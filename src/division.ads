pragma SPARK_Mode (On);

with AS_Io_Wrapper, SPARK.Text_IO;
use AS_Io_Wrapper, SPARK.Text_IO;

package Division is

   procedure div (dividend : in Integer; divisor : in Integer) with
      Global  => (In_Out => Standard_Output),
      Depends => (Standard_Output => (Standard_Output, dividend, divisor));

   procedure run;

end Division;
