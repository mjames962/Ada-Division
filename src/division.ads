pragma SPARK_Mode (On);

with AS_Io_Wrapper, SPARK.Text_IO;
use AS_Io_Wrapper, SPARK.Text_IO;

package Division is

   procedure div
     (dividend : in     Integer; divisor : in Integer; remainder : out Integer;
      quotient :    out Integer) with
      Depends => (remainder => (dividend, divisor),
       quotient => (divisor, dividend)),
      Pre  => (dividend >= 0 and divisor >= 1 and dividend >= divisor),
      Post =>
      (remainder < divisor and
       dividend = ((quotient * divisor) + remainder) and remainder >= 0);

   procedure run;

end Division;
