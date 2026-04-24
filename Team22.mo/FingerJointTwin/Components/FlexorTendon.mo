within FingerJointTwin.Components;

model FlexorTendon
  parameter Real tauMax = 0.2 "Max flexor torque [Nm]";
  input Real u "Activation 0..1";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

equation
  joint.tau = tauMax*u;

annotation(
  Icon(graphics={
    // Background (warm red tone for flexor)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={180,0,0}, 
      fillColor={255,230,230}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Muscle fiber representation (multiple lines)
    Line(points={{-85,-25},{-45,0}}, color={200,100,100}, thickness=1.5),
    Line(points={{-85,-15},{-45,10}}, color={200,100,100}, thickness=1.5),
    Line(points={{-85,-5},{-45,20}}, color={200,100,100}, thickness=1.5),
    
    // Tendon (thick cable pulling downward = flexion)
    Line(points={{-45,5},{60,-25}}, 
      color={180,0,0}, 
      thickness=3),
    
    // Force arrow showing pull direction
    Polygon(points={{50,-30},{60,-25},{50,-20},{50,-30}}, 
      lineColor={180,0,0}, 
      fillColor={180,0,0}, 
      fillPattern=FillPattern.Solid),
    
    // Activation indicator box
    Rectangle(extent={{65,-40},{95,-10}}, 
      lineColor={180,0,0},
      fillColor={255,200,200},
      fillPattern=FillPattern.Solid),
    Text(extent={{65,-40},{95,-10}}, 
      textString="u", 
      textColor={180,0,0},
      textStyle={TextStyle.Bold}),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Flexor", 
      textColor={180,0,0},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="τ = +τₘₐₓ·u", 
      textColor={150,0,0})
  }),
  Documentation(info="
<html><body>
<h4>FlexorTendon</h4>
<p>Active flexor tendon actuator that closes the finger joint. Models the combined effect of flexor digitorum profundus and superficialis muscles transmitted via tendon.</p>

<p><b>Equation:</b></p>
<ul>
  <li><code>τ = +τ_max · u</code></li>
</ul>

<p><b>Sign Convention:</b> Positive torque causes negative joint angle (flexion/closing). This follows Modelica flow variable semantics.</p>

<p><b>Parameters:</b></p>
<ul>
  <li><code>tauMax</code> [Nm]: Maximum flexor torque capacity</li>
</ul>

<p><b>Input:</b></p>
<ul>
  <li><code>u</code> [-]: Activation signal (0 = relaxed, 1 = fully activated)</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>u = 0: Tendon slack, no force</li>
  <li>u = 0.5: Partial muscle activation (50% max force)</li>
  <li>u = 1.0: Full muscle contraction (100% max force)</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Human finger: τ_max ≈ 0.15-0.25 Nm</li>
  <li>Prosthetic finger: τ_max ≈ 0.20-0.30 Nm</li>
  <li>Robotic finger: τ_max ≈ 0.40-0.80 Nm</li>
</ul>
</body></html>
"));
end FlexorTendon;
