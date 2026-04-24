within FingerJointTwin.Components;

model JointSpring
  parameter Real k = 1.0 "Stiffness [Nm/rad]";
  parameter Real phi0 = 0 "Rest angle [rad]";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

equation
  // Passive restoring torque (resists displacement)
  joint.tau = k*(joint.phi - phi0);

annotation(
  Icon(graphics={
    // Background (green for passive elastic element)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={0,140,0}, 
      fillColor={235,255,235}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Spring coil (improved visual)
    Line(points={{-80,0},{-60,0}}, color={0,140,0}, thickness=2),
    Line(points={{-60,0},{-55,15},{-45,-15},{-35,15},{-25,-15},{-15,15},{-5,-15},{5,15},{15,-15},{25,15},{35,-15},{45,15},{55,-15},{60,0}}, 
      color={0,140,0}, 
      thickness=2,
      smooth=Smooth.Bezier),
    Line(points={{60,0},{80,0}}, color={0,140,0}, thickness=2),
    
    // Anchor points
    Rectangle(extent={{-85,-5},{-75,5}}, 
      lineColor={0,100,0},
      fillColor={100,180,100},
      fillPattern=FillPattern.Solid),
    Rectangle(extent={{75,-5},{85,5}}, 
      lineColor={0,100,0},
      fillColor={100,180,100},
      fillPattern=FillPattern.Solid),
    
    // Deflection indicator
    Line(points={{0,-30},{0,30}}, 
      color={0,140,0}, 
      thickness=1,
      pattern=LinePattern.Dash),
    Polygon(points={{-5,-35},{0,-30},{5,-35},{-5,-35}}, 
      lineColor={0,140,0},
      fillColor={0,140,0},
      fillPattern=FillPattern.Solid),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Spring", 
      textColor={0,140,0},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="τ = k·(φ-φ₀)", 
      textColor={0,100,0})
  }),
  Documentation(info="
<html><body>
<h4>JointSpring</h4>
<p>Passive elastic restoring torque representing joint capsule stiffness, ligament tension, and passive tissue properties. Provides natural return-to-rest behavior.</p>

<p><b>Equation:</b></p>
<ul>
  <li><code>τ = +k · (φ - φ₀)</code></li>
</ul>

<p><b>Sign Convention:</b> When φ > φ₀ (stretched), positive torque creates restoring effect through Modelica flow summation. This appears opposite to free-body diagram convention but produces physically correct behavior.</p>

<p><b>Parameters:</b></p>
<ul>
  <li><code>k</code> [Nm/rad]: Rotational stiffness coefficient</li>
  <li><code>phi0</code> [rad]: Rest angle (equilibrium position with no external loads)</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>Larger k: Stiffer joint, stronger restoring force</li>
  <li>Smaller k: More compliant joint, weaker restoring force</li>
  <li>φ₀ typically near 0 rad (slightly flexed neutral posture)</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Human finger: k ≈ 0.5-2.0 Nm/rad, φ₀ ≈ -0.1 to 0 rad</li>
  <li>Prosthetic finger: k ≈ 2.0-5.0 Nm/rad (stiffer bearings/joints)</li>
  <li>Robotic finger: k ≈ 1.0-3.0 Nm/rad</li>
</ul>
</body></html>
"));
end JointSpring;
