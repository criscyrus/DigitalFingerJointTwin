within FingerJointTwin;

package Sources "Activation signal sources for tendon inputs"
  extends Modelica.Icons.Package;

annotation(Documentation(info="
<html>
  <body>
    <h3>Sources</h3>
    <p>Signal sources for tendon activation inputs (uFlex/uExt).</p>
    <ul>
      <li><b>HumanActivation</b>: smooth, muscle-like trapezoid activation</li>
      <li><b>ProstheticActivation</b>: slower and lower amplitude activation</li>
      <li><b>RobotActivation</b>: fast, crisp command-like activation</li>
      <li><b>ZeroSignal</b>: constant zero (tendon inactive)</li>
    </ul>
  </body>
</html>"));
end Sources;
