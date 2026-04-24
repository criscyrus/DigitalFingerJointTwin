within FingerJointTwin;

package Functions
  extends Modelica.Icons.UtilitiesPackage;

function smoothMax
  input Real x;
  input Real delta = 1e-4 "Smoothing width";
  output Real y;
algorithm
  // smooth approximation of max(0,x)
  y := 0.5*(x + sqrt(x*x + delta*delta));
  
annotation(
  Icon(graphics={
    Rectangle(extent={{-100,100},{100,-100}}, 
      lineColor={160,160,164},
      fillColor={235,235,235},
      fillPattern=FillPattern.Solid),
    
    // Function symbol f(x)
    Text(extent={{-90,60},{90,20}}, 
      textString="f(x)", 
      textColor={160,160,164},
      textStyle={TextStyle.Bold}),
    
    // Graph representation
    Line(points={{-70,-20},{-50,-10},{-30,15},{-10,8},{10,-15},{30,-5},{50,10},{70,5}}, 
      color={28,108,200}, 
      thickness=3,
      smooth=Smooth.Bezier),
    
    // Axes
    Line(points={{-80,-40},{-80,30}}, color={100,100,100}, thickness=0.5),
    Line(points={{-80,-40},{80,-40}}, color={100,100,100}, thickness=0.5),
    
    Text(extent={{-100,-60},{100,-90}}, 
      textString="Mathematical Functions", 
      textColor={100,100,100})
  }),
  Documentation(info="<html>
<h4>Functions Package</h4>

<p>
This package contains mathematical utility functions used by the library components.
</p>

<h4>smoothMax Function</h4>

<p>
Smooth approximation of max(0, x) function used for contact and limit modeling.
</p>

<p><b>Formula:</b> <code>y = 0.5 · (x + √(x² + δ²))</code></p>

<p><b>Inputs:</b></p>
<ul>
  <li><code>x</code> - Input value</li>
  <li><code>delta</code> - Smoothing width (default: 1e-4)</li>
</ul>

<p><b>Output:</b></p>
<ul>
  <li><code>y</code> - Smooth approximation of max(0, x)</li>
</ul>

<p><b>Purpose:</b></p>
<p>
The standard max(0,x) function has a sharp corner at x=0 which causes numerical 
problems in simulation. This smooth version eliminates the discontinuity while 
maintaining the same behavior for |x| >> delta.
</p>

<p><b>Used in:</b> ContactLoad and JointLimits components</p>

</html>"));
end smoothMax;
end Functions;
