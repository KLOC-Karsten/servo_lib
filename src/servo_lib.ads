with HAL;
package Servo_Lib is

   type Servo_Set_Point is range 0 .. 180;

   subtype Period is HAL.UInt16;

   type Servo_Motor is limited interface;

   procedure Set_Angle (This  : in out Servo_Motor;
                        Angle : Servo_Set_Point)
   is abstract;

   procedure Set_Pulse (This  : in out Servo_Motor;
                        Pulse : Period)
   is abstract;

end Servo_Lib;
