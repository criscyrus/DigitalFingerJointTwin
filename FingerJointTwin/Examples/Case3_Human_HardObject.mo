within FingerJointTwin.Examples;

model Case3_Human_HardObject
  extends Modelica.Icons.Example;

  FingerJointTwin.Systems.FingerJointSystem sys(
    contact(phiContact=-0.3, kContact=10, dContact=0.5),
    load(tauLoad=0.2),
    L=0.04
  ) annotation(
    Placement(transformation(origin={-10,-2}, extent={{-40,-40},{40,40}})));

  // Sources
  FingerJointTwin.Sources.HumanActivation flexSig annotation(
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
    <h3>Case 3: Human Finger + Hard Object</h3>

    <p><b>Goal:</b> Demonstrate contact/grasping with a <b>stiff (hard)</b> object using high contact stiffness.</p>

    <p><b>Settings:</b></p>
    <ul>
      <li>Contact enabled: <code>phiContact = -0.3 rad</code></li>
      <li>Hard object stiffness: <code>kContact = 10 Nm/rad</code></li>
      <li>Contact damping: <code>dContact = 0.5 Nms/rad</code></li>
      <li>External load: <code>tauLoad = 0.2 Nm</code></li>
    </ul>

    <h4>What you should observe</h4>
    <ul>
      <li>Contact activates at the same angle as Case 2, but the force/torque rises <b>much faster</b>.</li>
      <li>Joint motion is usually <b>restricted earlier</b> compared to the soft object case.</li>
    </ul>

    <h4>Recommended plots</h4>
    <ul>
      <li><code>sys.segment.joint.phi</code> (joint angle)</li>
      <li><code>sys.contact.joint.tau</code> (contact torque)</li>
      <li><code>sys.F_contact_abs</code> (estimated grasp/contact force magnitude)</li>
      <li><code>sys.flexor.joint.tau</code>, <code>sys.extensor.joint.tau</code> (actuation torques)</li>
    </ul>

    <h4>Comparison vs Case 2</h4>
    <ul>
      <li>Same system, same actuation, same contact threshold.</li>
      <li>Only stiffness changes: <code>kContact</code> soft (2) → hard (10).</li>
      <li>So differences in force and motion come purely from object compliance.</li>
    </ul>
  </body>
</html>")
);
end Case3_Human_HardObject;
