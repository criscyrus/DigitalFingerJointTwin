within FingerJointTwin.Examples;

model Case5_RoboticFinger
  extends Modelica.Icons.Example;

  FingerJointTwin.Systems.FingerJointSystem sys(
    segment(J=0.05),
    spring(k=4.0),
    damper(d=0.10),
    flexor(tauMax=0.6),
    extensor(tauMax=0.6),
    load(tauLoad=0.2),
    contact(phiContact=-0.3, kContact=20, dContact=1.0),
    L=0.06
  ) annotation(
    Placement(transformation(origin={-10,-2}, extent={{-40,-40},{40,40}})));

  FingerJointTwin.Sources.RobotActivation flexSig annotation(
    Placement(transformation(origin={-80,30}, extent={{-20,-20},{20,20}})));
  FingerJointTwin.Sources.ZeroSignal extSig annotation(
    Placement(transformation(origin={-80,-10}, extent={{-20,-20},{20,20}})));

equation
  connect(flexSig.y, sys.uFlex) annotation(
    Line(points={{-60,30},{-30,30},{-30,10},{-10,10}}, color={98,98,98}));
  connect(extSig.y, sys.uExt) annotation(
    Line(points={{-60,-10},{-30,-10},{-30,-10},{-10,-10}}, color={98,98,98}));

annotation(
  experiment(StartTime=0, StopTime=10, Interval=0.01, Tolerance=1e-6),
  Documentation(info="<html><head></head><body>
<h3>Case 5: Robotic Finger Configuration</h3>

<p><b>Goal:</b> Demonstrate high-performance robotic grasping with fast but controlled actuation. Shows how the same digital twin framework scales from gentle human touch to powerful industrial manipulation.</p>

<h4>Expected Behavior</h4>

<p><b>Fast Controlled Grasping:</b></p>
<ul>
  <li><b>Rapid approach:</b> 5× faster activation than human (0.1 s vs 0.5 s ramp)</li>
  <li><b>High sustained force:</b> 30-35 N grip force (vs 3.7 N human)</li>
  <li><b>Controlled contact:</b> Finger maintains contact with object (no bounce)</li>
  <li><b>Quick response:</b> Reaches equilibrium faster than human/prosthetic</li>
  <li><b>Minimal oscillation:</b> Higher damping stabilizes contact quickly</li>
</ul>

<h4>Recommended Plots</h4>

<ul>
  <li><code>sys.segment.joint.phi</code> - Joint angle (should reach ~-0.35 rad and stay)</li>
  <li><code>sys.contact.joint.tau</code> - Contact torque (sustained ~-1.5 to -2 Nm plateau)</li>
  <li><code>sys.F_contact_abs</code> - Contact force (sustained 30-35 N, no bounce)</li>
  <li><code>sys.flexor.joint.tau</code> - Flexor torque (fast ramp to 0.6 Nm)</li>
</ul>

<p><b>What to observe:</b></p>
<ul>
  <li>Fast but smooth activation (trapezoid, not square wave)</li>
  <li>Rapid closing motion (5× faster than human)</li>
  <li>Strong sustained contact forces (~10× human)</li>
  <li><b>NO elastic rebound</b> - finger stays in contact</li>
  <li>Quick settling with minimal oscillation</li>
</ul>


<h4>Real-World Applications</h4>

<p>This configuration is representative of:</p>
<ul>
  <li><b>Industrial pick-and-place robots:</b> Fast cycle times, high grip forces</li>
  <li><b>Robotic grippers:</b> Barrett Hand, Robotiq 2F-85 (20-70 N force range)</li>
  <li><b>Collaborative robots:</b> Fast response with controlled motion</li>
  <li><b>Assembly automation:</b> Precise positioning with strong grip</li>
</ul>

</body></html>"));
end Case5_RoboticFinger;
