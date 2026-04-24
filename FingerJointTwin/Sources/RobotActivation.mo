within FingerJointTwin.Sources;

model RobotActivation "Fast controlled activation for robotic fingers"
  Modelica.Blocks.Interfaces.RealOutput y "Activation signal [0..1]" annotation(
    Placement(transformation(extent={{100,-10},{120,10}})));

  parameter Real amplitude = 1.0 "Maximum activation level";
  parameter Real rampTime  = 0.1 "Ramp time [s] — 5x faster than human";
  parameter Real holdTime  = 0.8 "Hold duration [s]";
  parameter Real period    = 2.0 "Cycle period [s]";

equation
  y = amplitude * (
    if mod(time, period) < rampTime then
      mod(time, period) / rampTime
    else if mod(time, period) < rampTime + holdTime then
      1.0
    else if mod(time, period) < 2*rampTime + holdTime then
      1.0 - (mod(time, period) - rampTime - holdTime) / rampTime
    else
      0.0
  );

annotation(
  Icon(graphics={
    Rectangle(extent={{-80,40},{80,-40}}, lineColor={0,0,0},
      fillColor={235,235,235}, fillPattern=FillPattern.Solid),
    Text(extent={{-80,10},{80,-10}}, textString="Robot", textColor={0,0,0}),
    Line(points={{-60,-10},{-50,10},{-20,10},{-10,-10},{20,-10},{30,10},{60,10}},
      color={255,150,0}, thickness=2)
  }),
  Documentation(info="
<html><body>
<h4>RobotActivation</h4>
<p>Fast trapezoid activation for robotic fingers (rise 0.1 s, hold 0.8 s, fall 0.1 s, amplitude 1.0, period 2 s). The fast ramp (0.1 s) represents the high-bandwidth motion control typical of electric or pneumatic robotic actuators — 3× faster than the human voluntary movement speed. Full amplitude (1.0) reflects that robotic systems are not power-limited in the same way as prosthetics.</p>
<p><b>Key features:</b></p>
<ul>
  <li>Fast movement speed: 0.1 s ramp (vs 0.3 s human, 0.6 s prosthetic)</li>
  <li>Full amplitude: 1.0 (no current limiting)</li>
  <li>Suitable for high-performance robotic grippers</li>
</ul>
<p><b>Use:</b> connect <code>y</code> to <code>sys.uFlex</code> or <code>sys.uExt</code>. Adjust ramp time to match your actuator's velocity profile.</p>
</body></html>"));
end RobotActivation;
