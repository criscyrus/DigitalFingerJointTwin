within FingerJointTwin.Components;

model ContactLoad
  parameter Real phiContact = -0.3 "Contact begins when phi < phiContact [rad]";
  parameter Real kContact = 10.0   "Object stiffness [Nm/rad]";
  parameter Real dContact = 0.5    "Object damping [Nms/rad]";
  parameter Real eps = 1e-3        "Smoothing";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

protected
  Real penetration;

equation
  // penetration > 0 when joint goes beyond contact threshold
  penetration = FingerJointTwin.Functions.smoothMax(phiContact - joint.phi, eps); 

  // Resist penetration (restoring torque)
  joint.tau = -(kContact*penetration + dContact*der(penetration));
annotation(
  Icon(graphics={
    // Background (yellow-orange for contact interaction)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={200,120,0}, 
      fillColor={255,250,235}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Finger surface (left side)
    Line(points={{-80,-35},{-50,0},{-80,35}}, 
      color={100,100,100}, 
      thickness=2,
      smooth=Smooth.Bezier),
    Ellipse(extent={{-85,-5},{-75,5}}, 
      lineColor={100,100,100},
      fillColor={200,200,200},
      fillPattern=FillPattern.Solid),
    
    // Object surface (right side)
    Rectangle(extent={{60,-40},{70,40}}, 
      lineColor={150,80,0},
      fillColor={220,180,140},
      fillPattern=FillPattern.Solid),
    Line(points={{70,-40},{80,-45}}, color={150,80,0}, thickness=1),
    Line(points={{70,-20},{80,-25}}, color={150,80,0}, thickness=1),
    Line(points={{70,0},{80,-5}}, color={150,80,0}, thickness=1),
    Line(points={{70,20},{80,15}}, color={150,80,0}, thickness=1),
    Line(points={{70,40},{80,35}}, color={150,80,0}, thickness=1),
    
    // Contact spring elements (showing compliance)
    Line(points={{-5,0},{0,8},{10,-8},{20,8},{30,-8},{40,8},{45,0}}, 
      color={200,120,0}, 
      thickness=2),
    Line(points={{-5,15},{0,23},{10,7},{20,23},{30,7},{40,23},{45,15}}, 
      color={200,120,0}, 
      thickness=1.5),
    Line(points={{-5,-15},{0,-7},{10,-23},{20,-7},{30,-23},{40,-7},{45,-15}}, 
      color={200,120,0}, 
      thickness=1.5),
    
    // Contact force arrows
    Line(points={{-10,0},{-40,0}}, 
      color={255,0,0}, 
      thickness=2,
      arrow={Arrow.None, Arrow.Filled},
      arrowSize=5),
    Line(points={{50,0},{20,0}}, 
      color={255,0,0}, 
      thickness=2,
      arrow={Arrow.None, Arrow.Filled},
      arrowSize=5),
    
    // Contact indicator
    Text(extent={{-5,-25},{35,-45}}, 
      textString="F", 
      textColor={255,0,0},
      textStyle={TextStyle.Bold}),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Contact", 
      textColor={200,120,0},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="φ < φ_contact", 
      textColor={150,80,0})
  }),
  Documentation(info="
<html><body>
<h4>ContactLoad</h4>
<p>Compliant contact model for finger-object interaction. Implements a Hunt-Crossley contact formulation with smooth penetration-based activation. Enables grasping simulation and contact force estimation.</p>

<p><b>Equations:</b></p>
<ul>
  <li>Penetration: <code>penetration = smoothMax(φ_contact - φ, ε)</code></li>
  <li>Contact torque: <code>τ = -(k_contact · penetration + d_contact · d(penetration)/dt)</code></li>
</ul>

<p><b>Parameters:</b></p>
<ul>
  <li><code>phiContact</code> [rad]: Angle threshold where contact begins</li>
  <li><code>kContact</code> [Nm/rad]: Object stiffness (soft vs hard)</li>
  <li><code>dContact</code> [Nm·s/rad]: Contact damping (energy dissipation)</li>
  <li><code>eps</code> [rad]: Smoothing parameter for differentiability</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>φ > φ_contact: No contact, τ = 0</li>
  <li>φ < φ_contact: Contact active, resisting torque increases with penetration</li>
  <li>Low k_contact: Soft object (foam, rubber, fruit)</li>
  <li>High k_contact: Hard object (wood, metal, plastic)</li>
  <li>Negative torque opposes further flexion (pushing back)</li>
</ul>

<p><b>Contact Force Estimation:</b></p>
<ul>
  <li>If lever arm L is known: <code>F_contact = |τ_contact| / L</code></li>
  <li>Typical: L ≈ 0.03-0.05 m for fingertip contact</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Soft objects: k ≈ 1-5 Nm/rad, d ≈ 0.3-0.8 Nm·s/rad</li>
  <li>Hard objects: k ≈ 10-30 Nm/rad, d ≈ 0.5-1.5 Nm·s/rad</li>
  <li>Contact threshold: φ_contact ≈ -0.2 to -0.5 rad (depends on object position)</li>
</ul>

<p><b>Smoothing Parameter:</b></p>
<ul>
  <li>ε ≈ 1e-3: Sharp transition (may cause numerical stiffness)</li>
  <li>ε ≈ 1e-2: Moderate smoothing (recommended)</li>
  <li>ε ≈ 1e-1: Very smooth (may feel unrealistic)</li>
</ul>
</body></html>
"));
end ContactLoad;
