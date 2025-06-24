with Servo_Lib.Utils; use Servo_Lib.Utils;

package body Servo_Lib.PWM_Driver is

   overriding
   procedure Set_Angle (This  : in out PWM_Servo;
                        Angle : Servo_Set_Point) is
   begin
      This.Set_Period (To_PWM (Angle));
   end Set_Angle;

   overriding
   procedure Set_Pulse (This  : in out PWM_Servo;
                        Pulse : Period) is
   begin
      This.Set_Period (Pulse);
   end Set_Pulse;

end Servo_Lib.PWM_Driver;
