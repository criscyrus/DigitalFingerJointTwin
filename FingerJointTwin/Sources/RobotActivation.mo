within FingerJointTwin.Sources;

model RobotActivation "Fast controlled activation for robotic fingers"
  extends Modelica.Blocks.Interfaces.SO;

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
<p>Fast controlled trapezoid activation for robotic fingers (ramp 0.1 s, 5× faster than human).</p>
<p><b>Key features:</b></p>
<ul>
  <li>Fast ramp time: 0.1 s</li>
  <li>Full amplitude: 1.0</li>
  <li>Suitable for high-performance robotic grippers</li>
</ul>
<p><b>Use:</b> connect <code>y</code> to <code>sys.uFlex</code> or <code>sys.uExt</code>.</p>
</body></html>"));
end RobotActivation;
