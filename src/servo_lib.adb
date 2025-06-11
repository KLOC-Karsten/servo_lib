with HAL; use HAL;
package body Servo_Lib is

   function To_PWM (Angle: Servo_Set_Point;
                    Lower,  Upper : Period) return Period is
      Diff  : UInt32 := UInt32 (Angle) * UInt32 (Upper - Lower);
   begin
      return Period (Diff / 180);
   end To_PWM;

   function To_PWM (Angle: Servo_Set_Point) return Period is
   begin
      return To_PWM (Angle, 1000, 2000);
   end To_PWM;

end Servo_Lib;
