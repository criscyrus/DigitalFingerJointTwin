within FingerJointTwin;
package Systems "Systems package"
annotation(
  Icon(graphics={
    // Package folder background
    Rectangle(extent={{-100,100},{100,-100}}, 
      lineColor={200,200,200},
      fillColor={248,248,248},
      fillPattern=FillPattern.Solid),
    
    // Folder tab
    Polygon(points={{-100,100},{-80,120},{50,120},{50,100},{-100,100}}, 
      lineColor={200,200,200},
      fillColor={248,248,248},
      fillPattern=FillPattern.Solid),
    
    // System block diagram representation
    Rectangle(extent={{-60,60},{-20,20}}, 
      lineColor={100,100,100},
      fillColor={220,220,220},
      fillPattern=FillPattern.Solid),
    Text(extent={{-60,60},{-20,20}}, 
      textString="In", 
      textColor={0,0,0}),
    
    // Central system box
    Rectangle(extent={{-10,40},{30,-40}}, 
      lineColor={28,108,200},
      fillColor={200,220,255},
      fillPattern=FillPattern.Solid,
      lineThickness=2),
    Ellipse(extent={{0,10},{20,-10}}, 
      lineColor={28,108,200},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    
    // Output block
    Rectangle(extent={{40,20},{80,-20}}, 
      lineColor={100,100,100},
      fillColor={220,220,220},
      fillPattern=FillPattern.Solid),
    Text(extent={{40,20},{80,-20}}, 
      textString="Out", 
      textColor={0,0,0}),
    
    // Connection lines
    Line(points={{-20,40},{-10,40}}, color={100,100,100}, thickness=1),
    Line(points={{30,0},{40,0}}, color={100,100,100}, thickness=1),
    
    // Package name
    Text(extent={{-100,-60},{100,-100}}, 
      textString="System", 
      textColor={28,108,200})
  }),
  Documentation(info="<html>
<h4>Systems Package</h4>
<p>
This package contains system-level models that integrate individual components 
into complete finger joint systems.
</p>
<p>
<b>Contents:</b>
</p>
<ul>
  <li><b>FingerJointSystem:</b> Main system model with all components connected</li>
</ul>
</html>"));
end Systems;
