package Servo_Lib.Utils is

   function To_PWM (Angle : Servo_Set_Point) return Period;

   function To_PWM (Angle : Servo_Set_Point;
                    Lower,  Upper : Period) return Period;

end Servo_Lib.Utils;
