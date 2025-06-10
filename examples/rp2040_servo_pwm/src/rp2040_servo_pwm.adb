--
--  Copyright 2025 (C) Karsten Lueth
--
--  SPDX-License-Identifier: BSD-3-Clause
--

with HAL; use HAL;
with RP.Timer; use RP.Timer;
with RP.PWM; use RP.PWM;
with RP.Device;
with RP.Clock;
with RP.GPIO;
with Pico;

procedure Rp2040_Servo_Pwm is
   GP18 : constant PWM_Point := To_PWM (Pico.GP18);
   LED  : constant PWM_Point := To_PWM (Pico.LED);

   --  The PWM will count up at Frequency until it reaches Reload
   --  While the counter is less than Duty_Cycle, the output is High
   Frequency  : constant RP.Hertz := 1_000_000;
   Reload     : constant Period := 20_000;
   Duty_Cycle : Period := Reload / 2; --  start at 50%
   T          : RP.Timer.Time := RP.Timer.Clock;
begin
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   RP.Device.Timer.Enable;
   RP.PWM.Initialize;

   Pico.LED.Configure
      (RP.GPIO.Output, RP.GPIO.Floating, RP.GPIO.PWM);
   Pico.GP18.Configure
      (RP.GPIO.Output, RP.GPIO.Floating, RP.GPIO.PWM);

   Set_Frequency (LED.Slice, Frequency);
   Set_Interval (LED.Slice, Reload);
   Enable (LED.Slice);

   Set_Frequency (GP18.Slice, Frequency);
   Set_Interval (GP18.Slice, Reload);
   Enable (GP18.Slice);

   Set_Duty_Cycle (GP18.Slice, GP18.Channel, Duty_Cycle);
   Set_Duty_Cycle (LED.Slice, LED.Channel, Duty_Cycle);

   loop
      T := T + Milliseconds (10);
      RP.Device.Timer.Delay_Until (T);
   end loop;
end Rp2040_Servo_Pwm;