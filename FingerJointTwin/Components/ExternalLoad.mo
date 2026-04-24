within FingerJointTwin.Components;

model ExternalLoad
  parameter Real tauLoad = 0.0 "Opposing load torque [Nm]";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

equation
  joint.tau = tauLoad;

annotation(
  Icon(graphics={
    // Background (purple for external disturbance)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={120,0,120}, 
      fillColor={250,240,250}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // External object/weight representation
    Rectangle(extent={{50,-25},{85,25}}, 
      lineColor={100,0,100},
      fillColor={200,150,200},
      fillPattern=FillPattern.Solid,
      lineThickness=2),
    
    // Weight label
    Text(extent={{50,-25},{85,25}}, 
      textString="W", 
      textColor={255,255,255},
      textStyle={TextStyle.Bold}),
    
    // Force arrow (constant disturbance)
    Line(points={{50,0},{-20,0}}, 
      color={120,0,120}, 
      thickness=4,
      arrow={Arrow.None, Arrow.Filled},
      arrowSize=8),
    
    // Torque symbol
    Ellipse(extent={{-30,30},{10,-30}}, 
      lineColor={120,0,120}, 
      lineThickness=2,
      startAngle=90,
      endAngle=270),
    Polygon(points={{-25,-20},{-30,-30},{-20,-25},{-25,-20}}, 
      lineColor={120,0,120},
      fillColor={120,0,120},
      fillPattern=FillPattern.Solid),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Load", 
      textColor={120,0,120},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="τ = τₗₒₐd", 
      textColor={100,0,100})
  }),
  Documentation(info="
<html><body>
<h4>ExternalLoad</h4>
<p>Constant external disturbance torque applied to the joint. Represents sustained loading such as holding an object, supporting a weight, or resisting an external force.</p>

<p><b>Equation:</b></p>
<ul>
  <li><code>τ = +τ_load</code></li>
</ul>

<p><b>Parameter:</b></p>
<ul>
  <li><code>tauLoad</code> [Nm]: Magnitude and direction of constant load torque</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>Positive τ_load: Assists extension (opposes flexor)</li>
  <li>Negative τ_load: Assists flexion (opposes extensor)</li>
  <li>Magnitude: Total external moment about the joint</li>
</ul>

<p><b>Use Cases:</b></p>
<ul>
  <li>Modeling tool weight held in hand</li>
  <li>Resistance training or rehabilitation exercises</li>
  <li>Sustained external disturbance testing</li>
  <li>Set to 0 to disable external loading</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Light load: τ_load ≈ 0.05-0.10 Nm (e.g., pen, smartphone)</li>
  <li>Moderate load: τ_load ≈ 0.10-0.30 Nm (e.g., cup, small tool)</li>
  <li>Heavy load: τ_load ≈ 0.30-0.60 Nm (e.g., hammer, weight)</li>
</ul>

<p><b>Note:</b> For time-varying loads or contact forces, use ContactLoad component instead.</p>
</body></html>
"));
end ExternalLoad;
