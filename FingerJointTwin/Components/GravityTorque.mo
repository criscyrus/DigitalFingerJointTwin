within FingerJointTwin.Components;

model GravityTorque
  parameter Real m = 0.015 "Finger segment mass [kg]";
  parameter Real r = 0.05 "COM distance from joint [m]";
  parameter Real g = 9.81 "Gravity [m/s^2]";
  parameter Real phiRef = 0 "Reference angle [rad]";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

equation
  joint.tau = -m*g*r*sin(joint.phi - phiRef);

annotation(
  Icon(graphics={
    // Background (light blue for environmental)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={0,100,150}, 
      fillColor={240,250,255}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Finger segment (simplified)
    Ellipse(extent={{-40,15},{40,-15}}, 
      lineColor={100,100,100},
      fillColor={220,220,220},
      fillPattern=FillPattern.Solid),
    
    // Center of mass indicator
    Ellipse(extent={{-8,8},{8,-8}}, 
      lineColor={200,0,0},
      fillColor={255,100,100},
      fillPattern=FillPattern.Solid,
      lineThickness=1.5),
    Text(extent={{-8,8},{8,-8}}, 
      textString="CM", 
      textColor={255,255,255},
      textStyle={TextStyle.Bold}),
    
    // Gravity force arrow (pointing down)
    Line(points={{0,-15},{0,-45}}, 
      color={0,100,200}, 
      thickness=3,
      arrow={Arrow.None, Arrow.Filled},
      arrowSize=6),
    
    // Weight symbol
    Text(extent={{-15,-30},{15,-50}}, 
      textString="mg", 
      textColor={0,100,200},
      textStyle={TextStyle.Bold}),
    
    // Moment arm indicator
    Line(points={{0,0},{35,0}}, 
      color={150,0,150}, 
      thickness=1,
      pattern=LinePattern.Dash),
    Text(extent={{20,-15},{50,5}}, 
      textString="r", 
      textColor={150,0,150}),
    
    // Curved arrow for torque
    Ellipse(extent={{-50,50},{50,-50}}, 
      lineColor={0,150,0}, 
      lineThickness=1.5,
      startAngle=45,
      endAngle=135),
    Polygon(points={{-30,35},{-25,40},{-35,38},{-30,35}}, 
      lineColor={0,150,0},
      fillColor={0,150,0},
      fillPattern=FillPattern.Solid),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Gravity", 
      textColor={0,100,150},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="τ = -mgr·sin(φ)", 
      textColor={0,80,120})
  }),
  Documentation(info="
<html><body>
<h4>GravityTorque</h4>
<p>Gravitational torque acting on the finger segment due to its mass and center of mass location. Creates position-dependent loading on the joint.</p>

<p><b>Equation:</b></p>
<ul>
  <li><code>τ = -m · g · r · sin(φ - φ_ref)</code></li>
</ul>

<p><b>Parameters:</b></p>
<ul>
  <li><code>m</code> [kg]: Mass of the finger segment</li>
  <li><code>r</code> [m]: Distance from joint to center of mass</li>
  <li><code>g</code> [m/s²]: Gravitational acceleration (default: 9.81)</li>
  <li><code>phiRef</code> [rad]: Reference angle where gravity torque = 0 (horizontal)</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>Torque magnitude: τ_max = m · g · r (when finger vertical)</li>
  <li>φ = φ_ref: Finger horizontal, no gravity torque</li>
  <li>φ < φ_ref: Gravity assists flexion (negative torque)</li>
  <li>φ > φ_ref: Gravity assists extension (positive torque)</li>
  <li>Nonlinear: Torque varies as sin(φ)</li>
</ul>

<p><b>Coordinate System:</b></p>
<ul>
  <li>Typical: φ_ref = 0 assumes horizontal finger is the reference</li>
  <li>For vertical hand: Adjust φ_ref to ±π/2 as appropriate</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Human finger segment: m ≈ 0.01-0.02 kg, r ≈ 0.02-0.05 m</li>
  <li>Gravity torque range: ±0.005 to ±0.010 Nm</li>
  <li>Prosthetic: m ≈ 0.02-0.05 kg (heavier materials)</li>
  <li>Robotic: m ≈ 0.05-0.15 kg (motors, sensors, structure)</li>
</ul>
</body></html>
"));
end GravityTorque;
