within FingerJointTwin.Examples;

model Case6_BidirectionalControl
  extends Modelica.Icons.Example;

  FingerJointTwin.Systems.FingerJointSystem sys(
    contact(phiContact = -10),   // contact disabled — pure motion demonstration
    load(tauLoad = 0),
    L=0.04
  ) annotation(
    Placement(transformation(origin={-10,-2}, extent={{-40,-40},{40,40}})));

  // Flexor: activates first (0.2 s), holds, then releases
  FingerJointTwin.Sources.HumanActivation flexSig annotation(
    Placement(transformation(origin={-80,30}, extent={{-20,-20},{20,20}})));

  // Extensor: delayed start (3.5 s) to actively return the finger to rest
  Modelica.Blocks.Sources.Trapezoid extAct(
    amplitude = 1.0,
    rising    = 0.3,
    width     = 1.2,
    falling   = 0.3,
    period    = 10,
    startTime = 3.5
  ) annotation(
    Placement(transformation(origin={-80,-10}, extent={{-20,-20},{20,20}})));

equation
  connect(flexSig.y, sys.uFlex) annotation(
    Line(points={{-60,30},{-30,30},{-30,10},{-10,10}}, color={98,98,98}));
  connect(extAct.y, sys.uExt) annotation(
    Line(points={{-60,-10},{-30,-10},{-30,-10},{-10,-10}}, color={98,98,98}));

annotation(
  experiment(StartTime=0, StopTime=10, Interval=0.01, Tolerance=1e-6),
  Documentation(info="
<html>
  <body>
    <h3>Case 6: Bidirectional Control — Flex then Extend</h3>

    <p><b>Goal:</b> Demonstrate the full antagonistic actuation capability of the model.
    The flexor closes the finger (0–3.5 s), then the extensor actively returns it to the
    rest position (3.5–6 s). This is the standard open/close cycle for both prosthetic
    and robotic finger control.</p>

    <p><b>Settings:</b></p>
    <ul>
      <li>Flexor: HumanActivation (rise 0.3 s, start 0.2 s, period 10 s — fires once)</li>
      <li>Extensor: Trapezoid (rise 0.3 s, start 3.5 s, amplitude 1.0) — delayed activation</li>
      <li>Contact disabled (phiContact = -10 rad)</li>
      <li>No external load</li>
    </ul>

    <h4>What you should observe</h4>
    <ul>
      <li><b>Phase 1 (0–3.5 s):</b> Flexor activates → joint angle goes negative (flexion/closing)</li>
      <li><b>Phase 2 (3.5–6 s):</b> Extensor activates → joint angle returns toward 0 (extension/opening)</li>
      <li>After 6 s: Both tendons relax; passive spring returns joint to rest</li>
      <li>Observe antagonistic torques: flexor (positive) and extensor (negative) working in opposition</li>
    </ul>

    <h4>Recommended plots</h4>
    <ul>
      <li><code>sys.segment.joint.phi</code> — full open/close cycle clearly visible</li>
      <li><code>sys.flexor.joint.tau</code> — positive torque (closing phase)</li>
      <li><code>sys.extensor.joint.tau</code> — negative torque (opening phase)</li>
      <li><code>der(sys.segment.joint.phi)</code> — velocity reversal at transition</li>
    </ul>

    <h4>Biological / Engineering Interpretation</h4>
    <ul>
      <li><b>Human hand:</b> Voluntary grasp-and-release motion; flexors and extensors are
          never truly at rest — co-activation provides joint stiffness throughout.</li>
      <li><b>Prosthetic:</b> Typical myoelectric two-state control (open/close command).</li>
      <li><b>Robotic:</b> Standard pick-and-place cycle; extensor returns gripper to home position.</li>
    </ul>

    <h4>Note on parameter calibration</h4>
    <p>Adjust <code>tauMax</code> in the flexor and extensor components, and the activation
    ramp times, to match your specific subject or device characteristics.</p>
  </body>
</html>")
);
end Case6_BidirectionalControl;
