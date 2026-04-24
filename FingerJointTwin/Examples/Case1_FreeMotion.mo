within FingerJointTwin.Examples;

model Case1_FreeMotion
  extends Modelica.Icons.Example;

  FingerJointTwin.Systems.FingerJointSystem sys(
    contact(phiContact = -10),   // contact never triggers
    load(tauLoad = 0)            // no external load
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
    <h3>Case 1: Free Motion (Baseline)</h3>
    <p><b>Goal:</b> Show the joint dynamics without any environment interaction.</p>
    <p><b>Settings:</b></p>
    <ul>
      <li>External load disabled: <code>tauLoad = 0</code></li>
      <li>Contact disabled by moving threshold far away: <code>phiContact = -10 rad</code></li>
    </ul>

    <h4>Recommended plots</h4>
    <ul>
      <li><code>sys.segment.joint.phi</code> (joint angle)</li>
      <li><code>der(sys.segment.joint.phi)</code> (angular velocity)</li>
      <li><code>sys.flexor.joint.tau</code> (flexor torque)</li>
      <li><code>sys.contact.joint.tau</code> (should stay ~0)</li>
      <li><code>sys.F_contact_abs</code> (should stay ~0)</li>
    </ul>
  </body>
</html>")
);
end Case1_FreeMotion;
