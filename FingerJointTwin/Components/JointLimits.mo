within FingerJointTwin.Components;

model JointLimits
  parameter Real phiMin = -1.2 "Min joint angle [rad]";
  parameter Real phiMax =  0.2 "Max joint angle [rad]";
  parameter Real kLim  = 50.0  "Limit stiffness [Nm/rad]";
  parameter Real dLim  = 1.0   "Limit damping [Nms/rad]";
  parameter Real eps   = 1e-3  "Smoothing width";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={-100,0}, extent={{-10,-10},{10,10}})));

protected
  Real penMin ">=0 if below min";
  Real penMax ">=0 if above max";

equation
  // smooth penetrations (always differentiable)
  penMin = FingerJointTwin.Functions.smoothMax(phiMin - joint.phi, eps);
  penMax = FingerJointTwin.Functions.smoothMax(joint.phi - phiMax, eps);

  // restoring torques back into range
  joint.tau =
      ( kLim*penMin + dLim*der(penMin) )
    - ( kLim*penMax + dLim*der(penMax) );

annotation(
  Icon(graphics={
    // Background (gray for constraint)
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={100,100,100}, 
      fillColor={245,245,245}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Left limit wall (hard stop)
    Rectangle(extent={{-80,-40},{-70,40}}, 
      lineColor={80,80,80},
      fillColor={150,150,150},
      fillPattern=FillPattern.Solid),
    Line(points={{-70,-40},{-60,-50}}, color={100,100,100}, thickness=1),
    Line(points={{-70,-20},{-60,-30}}, color={100,100,100}, thickness=1),
    Line(points={{-70,0},{-60,-10}}, color={100,100,100}, thickness=1),
    Line(points={{-70,20},{-60,10}}, color={100,100,100}, thickness=1),
    Line(points={{-70,40},{-60,30}}, color={100,100,100}, thickness=1),
    
    // Right limit wall (hard stop)
    Rectangle(extent={{70,-40},{80,40}}, 
      lineColor={80,80,80},
      fillColor={150,150,150},
      fillPattern=FillPattern.Solid),
    Line(points={{70,-40},{60,-50}}, color={100,100,100}, thickness=1),
    Line(points={{70,-20},{60,-30}}, color={100,100,100}, thickness=1),
    Line(points={{70,0},{60,-10}}, color={100,100,100}, thickness=1),
    Line(points={{70,20},{60,10}}, color={100,100,100}, thickness=1),
    Line(points={{70,40},{60,30}}, color={100,100,100}, thickness=1),
    
    // Allowed range indicator
    Line(points={{-65,0},{65,0}}, 
      color={0,150,0}, 
      thickness=2,
      arrow={Arrow.None, Arrow.None}),
    
    // Joint position indicator (can move within limits)
    Ellipse(extent={{-10,10},{10,-10}}, 
      lineColor={200,0,0},
      fillColor={255,200,200},
      fillPattern=FillPattern.Solid,
      lineThickness=1.5),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Limits", 
      textColor={100,100,100},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="φₘᵢₙ ≤ φ ≤ φₘₐₓ", 
      textColor={80,80,80})
  }),
  Documentation(info="
<html><body>
<h4>JointLimits</h4>
<p>Soft anatomical joint limits using penalty-based method with smooth activation. Prevents joint from exceeding physiological range of motion and avoids simulation singularities from hard constraints.</p>

<p><b>Equations:</b></p>
<ul>
  <li>Lower penetration: <code>pen_min = smoothMax(φ_min - φ, ε)</code></li>
  <li>Upper penetration: <code>pen_max = smoothMax(φ - φ_max, ε)</code></li>
  <li>Limit torque: <code>τ = (k_lim · pen_min + d_lim · d(pen_min)/dt) - (k_lim · pen_max + d_lim · d(pen_max)/dt)</code></li>
</ul>

<p><b>Parameters:</b></p>
<ul>
  <li><code>phiMin</code> [rad]: Minimum joint angle (maximum flexion)</li>
  <li><code>phiMax</code> [rad]: Maximum joint angle (maximum extension)</li>
  <li><code>kLim</code> [Nm/rad]: Limit stiffness (penalty coefficient)</li>
  <li><code>dLim</code> [Nm·s/rad]: Limit damping (stabilization)</li>
  <li><code>eps</code> [rad]: Smoothing width for differentiability</li>
</ul>

<p><b>Physical Interpretation:</b></p>
<ul>
  <li>When φ < φ_min: Strong restoring torque pushes joint back into range</li>
  <li>When φ > φ_max: Strong restoring torque pushes joint back into range</li>
  <li>Within limits: τ ≈ 0 (limits inactive)</li>
  <li>Smooth transition avoids chattering and numerical issues</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Human PIP joint: φ_min ≈ -1.57 rad (-90°), φ_max ≈ 0.17 rad (+10°)</li>
  <li>Limit stiffness: k_lim ≈ 20-100 Nm/rad (very stiff at limits)</li>
  <li>Smoothing: ε ≈ 0.001-0.01 rad</li>
</ul>
</body></html>
"));
end JointLimits;

