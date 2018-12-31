# PWM_DAC
PWM based DAC implementation in Verilog

simplePWM.v - Contains the pwm module with 8b duty cycle register, and input glich cancellation.
testPWM.v - Contains the verilog test module for the PWM implementation.
sine_lut.v - Contains a 8b LUT based sine wave generator with 30 samples.
top_pwm.v - Contains the top module with internal oscillator and clock divider.
