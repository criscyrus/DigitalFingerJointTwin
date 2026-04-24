within FingerJointTwin.Components;

model JointDamper
  parameter Real d = 0.3 "Damping [Nms/rad]";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

equation
  // Viscous damping opposes angular velocity
  joint.tau = d*der(joint.phi);

annotation(
  Icon(graphics={
    // Background (orange for dissipative element)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={200,100,0}, 
      fillColor={255,245,230}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Damper housing (piston cylinder)
    Rectangle(extent={{-20,25},{40,-25}}, 
      lineColor={150,80,0},
      fillColor={240,220,200},
      fillPattern=FillPattern.Solid,
      lineThickness=2),
    
    // Piston rod
    Rectangle(extent={{40,-5},{70,5}}, 
      lineColor={150,80,0},
      fillColor={200,160,120},
      fillPattern=FillPattern.Solid),
    
    // Left connection
    Line(points={{-80,0},{-20,0}}, 
      color={200,100,0}, 
      thickness=2),
    
    // Right connection (moving)
    Line(points={{70,0},{80,0}}, 
      color={200,100,0}, 
      thickness=2),
    
    // Internal piston head
    Rectangle(extent={{-5,18},{5,-18}}, 
      lineColor={150,80,0},
      fillColor={180,120,60},
      fillPattern=FillPattern.Solid),
    
    // Viscous fluid representation (wavy lines)
    Line(points={{-15,10},{-10,12},{-5,10},{0,12},{5,10}}, 
      color={200,150,100}, 
      thickness=0.5),
    Line(points={{-15,0},{-10,2},{-5,0},{0,2},{5,0}}, 
      color={200,150,100}, 
      thickness=0.5),
    Line(points={{-15,-10},{-10,-8},{-5,-10},{0,-8},{5,-10}}, 
      color={200,150,100}, 
      thickness=0.5),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Damper", 
      textColor={200,100,0},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="τ = d·φ̇", 
      textColor={150,80,0})
  }),
  Documentation(info="
<html><body>
<h4>JointDamper</h4>
<p>Viscous damping torque representing tissue friction, synovial fluid damping, and energy dissipation in the joint. Opposes motion and stabilizes dynamics.</p>

<p><b>Equation:</b></p>
<ul>
  <li><code>τ = +d · dφ/dt</code></li>
</ul>

<p><b>Sign Convention:</b> When angular velocity is positive, positive damping torque creates energy dissipation through Modelica flow summation. This follows flow variable semantics and produces physically correct damping.</p>

<p><b>Parameter:</b></p>
<ul>
  <li><code>d</code> [Nm·s/rad]: Viscous damping coefficient</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>Larger d: More damping, slower motion, less oscillation</li>
  <li>Smaller d: Less damping, faster motion, more oscillation</li>
  <li>Critical damping: ζ = 1 when d = 2√(k·J)</li>
</ul>

<p><b>Energy Dissipation:</b></p>
<ul>
  <li>Power dissipated: P = τ · ω = d · ω²</li>
  <li>Always removes energy from system (stabilizing effect)</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Human finger: d ≈ 0.1-0.5 Nm·s/rad</li>
  <li>Prosthetic finger: d ≈ 0.15-0.30 Nm·s/rad (bearing friction)</li>
  <li>Robotic finger: d ≈ 0.05-0.20 Nm·s/rad (can be very low with good bearings)</li>
</ul>
</body></html>
"));
end JointDamper;
