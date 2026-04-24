within FingerJointTwin.Components;

model ExtensorTendon
  parameter Real tauMax = 0.2 "Max extensor torque [Nm]";

  Modelica.Blocks.Interfaces.RealInput u "Activation signal [0..1]" annotation(
    Placement(transformation(origin={0,100}, extent={{-20,-20},{20,20}}, rotation=270)));

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

equation
  joint.tau = -tauMax*u;

annotation(
  Icon(graphics={
    // Background (cool blue tone for extensor)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={0,70,180}, 
      fillColor={230,240,255}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Muscle fiber representation (multiple lines)
    Line(points={{-85,25},{-45,0}}, color={100,140,200}, thickness=1.5),
    Line(points={{-85,15},{-45,-10}}, color={100,140,200}, thickness=1.5),
    Line(points={{-85,5},{-45,-20}}, color={100,140,200}, thickness=1.5),
    
    // Tendon (thick cable pulling upward = extension)
    Line(points={{-45,-5},{60,25}}, 
      color={0,70,180}, 
      thickness=3),
    
    // Force arrow showing pull direction
    Polygon(points={{50,20},{60,25},{50,30},{50,20}}, 
      lineColor={0,70,180}, 
      fillColor={0,70,180}, 
      fillPattern=FillPattern.Solid),
    
    // Activation indicator box
    Rectangle(extent={{65,10},{95,40}}, 
      lineColor={0,70,180},
      fillColor={200,220,255},
      fillPattern=FillPattern.Solid),
    Text(extent={{65,10},{95,40}}, 
      textString="u", 
      textColor={0,70,180},
      textStyle={TextStyle.Bold}),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Extensor", 
      textColor={0,70,180},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="τ = -τₘₐₓ·u", 
      textColor={0,50,150})
  }),
  Documentation(info="
<html><body>
<h4>ExtensorTendon</h4>
<p>Active extensor tendon actuator that opens the finger joint. Models the extensor digitorum communis muscle transmitted via tendon. Acts antagonistically to the flexor.</p>

<p><b>Equation:</b></p>
<ul>
  <li><code>τ = -τ_max · u</code></li>
</ul>

<p><b>Sign Convention:</b> Negative torque causes positive joint angle (extension/opening). This follows Modelica flow variable semantics.</p>

<p><b>Parameters:</b></p>
<ul>
  <li><code>tauMax</code> [Nm]: Maximum extensor torque capacity</li>
</ul>

<p><b>Input:</b></p>
<ul>
  <li><code>u</code> [-]: Activation signal (0 = relaxed, 1 = fully activated)</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>Antagonistic control: Flexor and extensor work in opposition</li>
  <li>Co-activation (both u > 0): Increases joint stiffness without net torque</li>
  <li>Reciprocal activation: Flexor high + extensor low = closing, and vice versa</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Human finger: τ_max ≈ 0.10-0.20 Nm (typically weaker than flexor)</li>
  <li>Prosthetic finger: τ_max ≈ 0.15-0.25 Nm</li>
  <li>Robotic finger: τ_max ≈ 0.40-0.80 Nm (often symmetric with flexor)</li>
</ul>
</body></html>
"));
end ExtensorTendon;
