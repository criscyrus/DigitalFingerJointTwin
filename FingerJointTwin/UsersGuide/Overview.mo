within FingerJointTwin.UsersGuide;
model Overview "Overview"
  extends Modelica.Icons.Information;
annotation(Documentation(info="<html>
<h2>FingerJointTwin Library</h2>

<p>
This library provides a physics-based digital twin model of a tendon-driven finger joint. 
</p>

<p>
The library models a single finger joint with antagonistic tendon actuation (flexor and extensor), 
passive joint properties (spring and damper), anatomical limits, gravity, external loads, and 
contact with objects. Five example cases demonstrate different scenarios including human, prosthetic, 
and robotic finger configurations.
</p>

<h3>Library Structure</h3>

<table border=\"1\" cellspacing=\"0\" cellpadding=\"5\">
<tr>
  <th>Package</th>
  <th>Description</th>
</tr>

<tr>
  <td><a href=\"modelica://FingerJointTwin.Examples\">Examples</a></td>
  <td>Five simulation cases: free motion, soft/hard object grasping, prosthetic finger, and robotic finger</td>
</tr>

<tr>
  <td><a href=\"modelica://FingerJointTwin.Systems\">Systems</a></td>
  <td>FingerJointSystem - complete system model connecting all components</td>
</tr>

<tr>
  <td><a href=\"modelica://FingerJointTwin.Components\">Components</a></td>
  <td>Physical components: segment, tendons, spring, damper, limits, gravity, loads, contact</td>
</tr>

<tr>
  <td><a href=\"modelica://FingerJointTwin.Sources\">Sources</a></td>
  <td>Activation signal generators: human, prosthetic, robot, and zero signals</td>
</tr>

<tr>
  <td><a href=\"modelica://FingerJointTwin.Interfaces\">Interfaces</a></td>
  <td>RotationalPort connector for mechanical connections</td>
</tr>

<tr>
  <td><a href=\"modelica://FingerJointTwin.Functions\">Functions</a></td>
  <td>Mathematical utilities (smoothMax for contact modeling)</td>
</tr>



<tr>
  <td><a href=\"modelica://FingerJointTwin.UsersGuide\">UsersGuide</a></td>
  <td>Documentation, contact information, and references</td>
</tr>

</table>

<h3>Getting Started</h3>
<p>
Start with <code>FingerJointTwin.Examples.Case1_FreeMotion</code> to understand the basic dynamics,
then explore the other cases to see contact behavior and different finger configurations.
</p>

<h3>Model Limitations</h3>
<p>This library is a first-order approximation. The following phenomena are intentionally not modelled:</p>
<ul>
  <li><b>Single DOF only</b> — each instance models one joint; multi-joint coupling (MCP, PIP, DIP) requires separate instances with no kinematic constraints between them.</li>
  <li><b>Massless, inextensible tendons</b> — tendon compliance and mass are neglected; force transmission is instantaneous.</li>
  <li><b>No muscle activation dynamics</b> — the Hill muscle model (force-velocity, force-length relationships) is not included; activation u maps linearly to torque.</li>
  <li><b>Linear passive properties</b> — joint stiffness and damping are constant; real biological tissue is nonlinear and viscoelastic.</li>
  <li><b>Planar motion only</b> — out-of-plane (abduction/adduction) degrees of freedom are not modelled.</li>
  <li><b>No skin or fingertip deformation</b> — contact is modelled as a rigid-body interaction at a fixed threshold angle.</li>
  <li><b>No validation against experimental data</b> — parameter values are based on published ranges; the model has not been fitted to subject-specific measurements.</li>
</ul>

<h3>References</h3>
<ol>
  <li>An, K.-N., Ueba, Y., Chao, E. Y., Cooney, W. P., &amp; Linscheid, R. L. (1983). <i>Tendon excursion and moment arm of index finger muscles.</i> Journal of Biomechanics, 16(6), 419–425.</li>
  <li>Hogan, N. (1985). <i>Impedance control: An approach to manipulation.</i> ASME Journal of Dynamic Systems, Measurement, and Control, 107(1), 1–24.</li>
  <li>Deshpande, A. D., Xu, Z., Weghe, M. J. V., Brown, B. H., Ko, J., Chang, L. Y., &amp; Matsuoka, Y. (2013). <i>Mechanisms of the anatomically correct testbed hand.</i> IEEE/ASME Transactions on Mechatronics, 18(1), 238–250.</li>
  <li>Zajac, F. E. (1989). <i>Muscle and tendon: Properties, models, scaling, and application to biomechanics and motor control.</i> Critical Reviews in Biomedical Engineering, 17(4), 359–411.</li>
</ol>

</html>"));

end Overview;
