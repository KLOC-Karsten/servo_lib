with HAL;
package Servo_Lib is
   type Servo_Set_Point is range 0 .. 180;

   subtype Period is HAL.UInt16;

   function To_PWM (Angle: Servo_Set_Point) return Period;

   function To_PWM (Angle: Servo_Set_Point;
                    Lower,  Upper : Period) return Period;                   
end Servo_Lib;
