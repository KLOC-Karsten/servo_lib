package Servo_Lib.PWM_Driver is

   type PWM_Servo is new Servo_Motor with
      record
         Set_Period : access procedure (P : Period);
      end record;

   overriding
   procedure Set_Angle (This  : in out PWM_Servo;
                        Angle : Servo_Set_Point);

   overriding
   procedure Set_Pulse (This  : in out PWM_Servo;
                        Pulse : Period);

end Servo_Lib.PWM_Driver;
