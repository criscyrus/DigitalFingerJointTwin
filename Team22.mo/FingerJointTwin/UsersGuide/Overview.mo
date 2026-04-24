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

</html>"));

end Overview;
