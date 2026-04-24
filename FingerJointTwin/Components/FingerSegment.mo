within FingerJointTwin.Components;

model FingerSegment
  parameter Real J = 0.02 "Moment of inertia [kg.m2]";
  Real w "Angular velocity [rad/s]";

  FingerJointTwin.Interfaces.RotationalPort joint annotation(
    Placement(transformation(origin={100,0}, extent={{-10,-10},{10,10}})));

initial equation
  joint.phi = 0;
  w = 0;

equation
  der(joint.phi) = w;
  J*der(w) = joint.tau;

annotation(
  Icon(graphics={
    // Background with gradient
    Rectangle(extent={{-100,60},{100,-60}}, 
      lineColor={28,108,200}, 
      fillColor={200,220,255}, 
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    
    // Finger bone representation (elongated shape)
    Ellipse(extent={{-80,40},{80,-40}}, 
      lineColor={100,100,100},
      fillColor={240,240,240},
      fillPattern=FillPattern.Solid),
    
    // Joint center (pivot point)
    Ellipse(extent={{-25,25},{25,-25}}, 
      lineColor={28,108,200},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      lineThickness=2),
    
    // Inertia symbol (rotating mass indicator)
    Ellipse(extent={{-15,15},{15,-15}}, 
      lineColor={28,108,200},
      fillColor={170,200,255},
      fillPattern=FillPattern.Solid),
    
    // Rotation arrow
    Line(points={{0,12},{8,12},{8,8}}, 
      color={28,108,200}, 
      thickness=1.5,
      arrow={Arrow.None, Arrow.Filled},
      arrowSize=4),
    
    // Labels
    Text(extent={{-100,95},{100,65}}, 
      textString="Segment", 
      textColor={28,108,200},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}}, 
      textString="J·ω̇=Στ", 
      textColor={100,100,100})
  }),
  Documentation(info="
<html><body>
<h4>FingerSegment</h4>
<p>Rigid finger segment with rotational inertia dynamics. Represents a single phalanx (finger bone) rotating about a joint.</p>

<p><b>Equations:</b></p>
<ul>
  <li>Angular kinematics: <code>dφ/dt = ω</code></li>
  <li>Rotational dynamics: <code>J·dω/dt = Σ τ</code></li>
</ul>

<p>where the sum of torques includes all connected components (tendons, spring, damper, limits, gravity, loads, contact).</p>

<p><b>Parameter:</b></p>
<ul>
  <li><code>J</code> [kg·m²]: Moment of inertia about the joint axis</li>
</ul>

<p><b>Variables:</b></p>
<ul>
  <li><code>joint.phi</code> [rad]: Joint angle (negative = flexion, positive = extension)</li>
  <li><code>w</code> [rad/s]: Angular velocity</li>
  <li><code>joint.tau</code> [Nm]: Net torque from all connected components</li>
</ul>

<p><b>Typical Values:</b></p>
<ul>
  <li>Human finger: J ≈ 0.01-0.03 kg·m²</li>
  <li>Prosthetic finger: J ≈ 0.03-0.05 kg·m²</li>
  <li>Robotic finger: J ≈ 0.05-0.10 kg·m²</li>
</ul>
</body></html>
"));
end FingerSegment;
