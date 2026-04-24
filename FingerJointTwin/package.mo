package FingerJointTwin "Digital twin library for a tendon-driven finger joint"
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
    
    // Finger joint representation (three segments)
    // Proximal segment
    Ellipse(extent={{-70,40},{-30,-40}}, 
      lineColor={100,100,100},
      fillColor={220,220,220},
      fillPattern=FillPattern.Solid),
    
    // Joint 1
    Ellipse(extent={{-40,20},{-20,-20}}, 
      lineColor={28,108,200},
      fillColor={200,220,255},
      fillPattern=FillPattern.Solid,
      lineThickness=2),
    
    // Middle segment
    Ellipse(extent={{-10,30},{30,-30}}, 
      lineColor={100,100,100},
      fillColor={220,220,220},
      fillPattern=FillPattern.Solid),
    
    // Joint 2
    Ellipse(extent={{20,15},{40,-15}}, 
      lineColor={28,108,200},
      fillColor={200,220,255},
      fillPattern=FillPattern.Solid,
      lineThickness=2),
    
    // Distal segment
    Ellipse(extent={{40,20},{70,-20}}, 
      lineColor={100,100,100},
      fillColor={220,220,220},
      fillPattern=FillPattern.Solid),
    
    // Flexor tendon (red line on bottom)
    Line(points={{-60,-25},{-30,-15},{10,-20},{30,-12},{60,-15}}, 
      color={180,0,0}, 
      thickness=2,
      smooth=Smooth.Bezier),
    
    // Extensor tendon (blue line on top)
    Line(points={{-60,25},{-30,15},{10,20},{30,12},{60,15}}, 
      color={0,70,180}, 
      thickness=2,
      smooth=Smooth.Bezier),
    
    // Library title
    Text(extent={{-100,-60},{100,-100}}, 
      textString="FingerJointTwin", 
      textColor={28,108,200},
      textStyle={TextStyle.Bold})
  }),
  Documentation(info="<html>
<h2>FingerJointTwin Library</h2>
<p>
Physics-based digital twin model of a tendon-driven finger joint.
</p>
<p>
Developed for the Digital Twin Engineering course at Karlsruhe Institute of Technology (KIT).
</p>
<p>
<b>Start here:</b> <a href=\"modelica://FingerJointTwin.UsersGuide\">UsersGuide</a> 
</p>
</html>"));
end FingerJointTwin;
