within FingerJointTwin.Interfaces;

connector RotationalPort
  Real phi "Angle [rad]";
  flow Real tau "Torque [Nm]";
  annotation(
    Icon(graphics = {Ellipse(lineColor = {95, 95, 95}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-100, 100}, {100, -100}}), Ellipse( lineColor = {135, 135, 135}, fillColor = {245, 245, 245}, fillPattern = FillPattern.Solid, extent = {{-70, 70}, {70, -70}}), Ellipse(lineColor = {95, 95, 95}, fillColor = {200, 200, 200}, fillPattern = FillPattern.Solid, lineThickness = 1.5, extent = {{-40, 40}, {40, -40}}), Ellipse(lineColor = {28, 108, 200}, lineThickness = 2, extent = {{-55, 55}, {55, -55}}, startAngle = 30, endAngle = 150), Polygon(lineColor = {28, 108, 200}, fillColor = {28, 108, 200}, fillPattern = FillPattern.Solid, points = {{-35, 40}, {-30, 48}, {-42, 43}, {-35, 40}}), Text(textColor = {28, 108, 200}, extent = {{-25, 20}, {25, -20}}, textString = "φ", textStyle = {TextStyle.Bold}), Text(textColor = {95, 95, 95}, extent = {{-90, 120}, {90, 90}}, textString = "τ", textStyle = {TextStyle.Italic})}),
    Documentation(info = "
<html><body>
<h4>RotationalPort</h4>
<p>Bidirectional connector for rotational mechanical systems. Defines the interface between components in the finger joint digital twin.</p>

<p><b>Variables:</b></p>
<ul>
  <li><code>phi</code> [rad]: Joint angle (across variable / potential)</li>
  <li><code>tau</code> [Nm]: Torque (through variable / flow)</li>
</ul>

<p><b>Modelica Flow Semantics:</b></p>
<ul>
  <li>Potential variable (φ): Same value at all connected ports</li>
  <li>Flow variable (τ): Sum of all connected τ = 0 (Kirchhoff's law)</li>
  <li>Components contribute torque; segment receives net torque</li>
</ul>

<p><b>Sign Convention:</b></p>
<ul>
  <li>Negative φ: Flexion (finger closing)</li>
  <li>Positive φ: Extension (finger opening)</li>
  <li>Torque signs follow flow summation</li>
</ul>

<p><b>Connection Behavior:</b></p>
<ul>
  <li>Multiple components connect to same port</li>
  <li>All share the same φ value</li>
  <li>Each contributes its τ to the sum</li>
  <li>Result: <code>J·dω/dt = Σ τ_i</code> at segment</li>
</ul>
</body></html>
    "));
end RotationalPort;
