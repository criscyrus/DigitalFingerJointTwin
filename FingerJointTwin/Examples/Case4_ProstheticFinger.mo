within FingerJointTwin.Examples;

model Case4_ProstheticFinger
  extends Modelica.Icons.Example;

  FingerJointTwin.Systems.FingerJointSystem sys(
    segment(J=0.03),
    spring(k=3.0),
    damper(d=0.20),
    flexor(tauMax=0.25),
    extensor(tauMax=0.25),
    load(tauLoad=0.2),
    contact(phiContact=-0.3, kContact=10, dContact=0.5)
  ) annotation(
    Placement(transformation(origin={-10,-2}, extent={{-40,-40},{40,40}})));

  FingerJointTwin.Sources.ProstheticActivation flexSig annotation(
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
  Documentation(info="
<html>
  <body>
    <h3>Case 4: Prosthetic Finger Configuration</h3>

    <p><b>Goal:</b> Show how the same digital twin structure can represent a <b>prosthetic joint</b> by changing passive and inertial parameters.</p>

    <p><b>Key parameter changes (vs human baseline):</b></p>
    <ul>
      <li>Higher inertia: <code>segment.J = 0.03</code></li>
      <li>Higher passive stiffness: <code>spring.k = 3.0</code></li>
      <li>Higher damping/friction: <code>damper.d = 0.20</code></li>
    </ul>

    <h4>Expected behavior</h4>
    <ul>
      <li>Less oscillation and smoother settling (more damping).</li>
      <li>Joint resists motion more strongly (higher stiffness).</li>
      <li>Slower response (higher inertia + damping).</li>
    </ul>

    <h4>Recommended plots</h4>
    <ul>
      <li><code>sys.segment.joint.phi</code></li>
      <li><code>der(sys.segment.joint.phi)</code></li>
      <li><code>sys.spring.joint.tau</code>, <code>sys.damper.joint.tau</code></li>
      <li><code>sys.F_contact_abs</code></li>
    </ul>
  </body>
</html>")
);
end Case4_ProstheticFinger;
