within FingerJointTwin;

package Sources
  extends Modelica.Icons.Package;

  
  model HumanActivation
    Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(transformation(extent = {{100, -10}, {120, 10}})));
  protected
    Modelica.Blocks.Sources.Trapezoid act(amplitude = 1, rising = 0.3, width = 1.2, falling = 0.3, period = 3, startTime = 0.2);
  equation
    y = act.y;
  annotation(
    Icon(graphics={
      // Background (warm organic color)
      Rectangle(extent={{-100,60},{100,-60}}, 
        lineColor={180,100,60}, 
        fillColor={255,245,235}, 
        fillPattern=FillPattern.Solid,
        lineThickness=1),
      
      // Muscle icon (stylized)
      Ellipse(extent={{-80,35},{-40,-35}}, 
        lineColor={180,80,80},
        fillColor={255,200,200},
        fillPattern=FillPattern.Solid),
      Polygon(points={{-40,25},{-20,20},{0,15},{10,10},{20,0},{10,-10},{0,-15},{-20,-20},{-40,-25},{-40,25}}, 
        lineColor={180,80,80},
        fillColor={255,200,200},
        fillPattern=FillPattern.Solid,
        smooth=Smooth.Bezier),
      
      // Trapezoid activation waveform
      Line(points={{30,-20},{40,-20},{48,15},{68,15},{76,-20},{85,-20}}, 
        color={200,0,0}, 
        thickness=2.5),
      
      // Time axis
      Line(points={{25,-25},{90,-25}}, color={100,100,100}, thickness=0.5),
      
      // Signal output connector
      Ellipse(extent={{95,-10},{105,10}}, 
        lineColor={0,0,0},
        fillColor={0,255,0},
        fillPattern=FillPattern.Solid),
      
      // Labels
      Text(extent={{-100,95},{100,65}}, 
        textString="Human", 
        textColor={180,100,60},
        textStyle={TextStyle.Bold}),
      Text(extent={{-100,-65},{100,-95}}, 
        textString="Smooth Activation", 
        textColor={150,80,50})
    }),
      Documentation(info = "
  <html><body>
  <h4>HumanActivation</h4>
  <p>Muscle-like smooth activation using a trapezoid waveform.</p>
  <p><b>Use:</b> connect <code>y</code> to <code>sys.uFlex</code> or <code>sys.uExt</code>.</p>
  </body></html>"));
  end HumanActivation;

  
  model ProstheticActivation
  
    Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(transformation(extent={{100,-10},{120,10}})));
  
  protected
    Modelica.Blocks.Sources.Trapezoid act(
      amplitude=0.6, rising=0.6, width=1.5, falling=0.6, period=4, startTime=0.2);
  
  equation
    y = act.y;
  
  annotation(
    Icon(graphics={
      // Background (metallic gray-blue)
      Rectangle(extent={{-100,60},{100,-60}}, 
        lineColor={80,100,120}, 
        fillColor={235,240,245}, 
        fillPattern=FillPattern.Solid,
        lineThickness=1),
      
      // Prosthetic mechanism (gears/actuator)
      Ellipse(extent={{-75,30},{-45,-30}}, 
        lineColor={60,80,100},
        fillColor={180,190,200},
        fillPattern=FillPattern.Solid),
      // Gear teeth
      Polygon(points={{-60,30},{-55,35},{-65,35},{-60,30}}, 
        lineColor={60,80,100},
        fillColor={150,160,170},
        fillPattern=FillPattern.Solid),
      Polygon(points={{-75,0},{-80,5},{-80,-5},{-75,0}}, 
        lineColor={60,80,100},
        fillColor={150,160,170},
        fillPattern=FillPattern.Solid),
      Polygon(points={{-60,-30},{-55,-35},{-65,-35},{-60,-30}}, 
        lineColor={60,80,100},
        fillColor={150,160,170},
        fillPattern=FillPattern.Solid),
      
      // Slower trapezoid waveform
      Line(points={{25,-20},{33,-20},{45,10},{65,10},{77,-20},{85,-20}}, 
        color={0,100,180}, 
        thickness=2.5),
      
      // Time axis
      Line(points={{20,-25},{90,-25}}, color={100,100,100}, thickness=0.5),
      
      // Signal output connector
      Ellipse(extent={{95,-10},{105,10}}, 
        lineColor={0,0,0},
        fillColor={0,200,255},
        fillPattern=FillPattern.Solid),
      
      // Labels
      Text(extent={{-100,95},{100,65}}, 
        textString="Prosthetic", 
        textColor={80,100,120},
        textStyle={TextStyle.Bold}),
      Text(extent={{-100,-65},{100,-95}}, 
        textString="Moderate Activation", 
        textColor={60,80,100})
    }),
    Documentation(info="
  <html><body>
  <h4>ProstheticActivation</h4>
  <p>Slower and lower-amplitude activation to represent a safer prosthetic actuation profile.</p>
  <p><b>Use:</b> connect <code>y</code> to <code>sys.uFlex</code> or <code>sys.uExt</code>.</p>
  </body></html>")
  );
  end ProstheticActivation;

  
  
  model RobotActivation "Fast controlled activation for robotic fingers"
    extends Modelica.Blocks.Interfaces.SO;
    
    parameter Real amplitude = 1.0 "Maximum activation level";
    parameter Real rampTime = 0.1 "Fast ramp time [s] - 5x faster than human";
    parameter Real holdTime = 0.8 "Hold duration [s]";
    parameter Real period = 2.0 "Cycle period [s]";
    
  equation
    // Fast trapezoid: quick but controlled activation
    y = amplitude * (
      if mod(time, period) < rampTime then 
        mod(time, period) / rampTime
      else if mod(time, period) < rampTime + holdTime then 
        1.0
      else if mod(time, period) < 2*rampTime + holdTime then 
        1.0 - (mod(time, period) - rampTime - holdTime) / rampTime
      else 
        0.0
    );
  
    annotation(
      Icon(graphics={
        Rectangle(extent={{-80,40},{80,-40}}, lineColor={0,0,0},
          fillColor={235,235,235}, fillPattern=FillPattern.Solid),
        Text(extent={{-80,10},{80,-10}}, textString="Robot", textColor={0,0,0}),
        Line(points={{-60,-10},{-50,10},{-20,10},{-10,-10},{20,-10},{30,10},{60,10}}, 
          color={255,150,0}, thickness=2)
      }),
      Documentation(info="<html><head></head><body>
  <h4>RobotActivation</h4>
  <p>Fast controlled trapezoid activation for robotic fingers.</p>
  <p><b>Key features:</b></p>
  <ul>
    <li>Fast ramp time: 0.1 s (5× faster than human)</li>
    <li>Controlled approach</li>
    <li>Suitable for high-performance robotic grippers</li>
  </ul>
  <p><b>Use:</b> connect <code>y</code> to <code>sys.uFlex</code> or <code>sys.uExt</code>.</p>
  </body></html>"));
  end RobotActivation;

  
  model ZeroSignal
  
    Modelica.Blocks.Interfaces.RealOutput y annotation(
      Placement(transformation(extent={{100,-10},{120,10}})));
  
  equation
    y = 0;
  
  annotation(
    Icon(graphics={
      // Background (neutral gray)
      Rectangle(extent={{-100,60},{100,-60}}, 
        lineColor={120,120,120}, 
        fillColor={250,250,250}, 
        fillPattern=FillPattern.Solid,
        lineThickness=1),
      
      // Ground symbol (reference)
      Line(points={{-60,0},{60,0}}, 
        color={120,120,120}, 
        thickness=2),
      Line(points={{-40,-10},{40,-10}}, 
        color={120,120,120}, 
        thickness=1.5),
      Line(points={{-25,-18},{25,-18}}, 
        color={120,120,120}, 
        thickness=1),
      Line(points={{-12,-25},{12,-25}}, 
        color={120,120,120}, 
        thickness=0.5),
      
      // Zero level indicator
      Text(extent={{-30,35},{30,-5}}, 
        textString="0", 
        textColor={120,120,120},
        textStyle={TextStyle.Bold}),
      
      // Flatline signal
      Line(points={{-85,0},{-60,0}}, 
        color={100,100,100}, 
        thickness=1.5,
        pattern=LinePattern.Dash),
      Line(points={{60,0},{85,0}}, 
        color={100,100,100}, 
        thickness=1.5,
        pattern=LinePattern.Dash),
      
      // Signal output connector
      Ellipse(extent={{95,-10},{105,10}}, 
        lineColor={0,0,0},
        fillColor={150,150,150},
        fillPattern=FillPattern.Solid),
      
      // Labels
      Text(extent={{-100,95},{100,65}}, 
        textString="Zero", 
        textColor={120,120,120},
        textStyle={TextStyle.Bold}),
      Text(extent={{-100,-65},{100,-95}}, 
        textString="y = 0", 
        textColor={100,100,100})
    }),
    Documentation(info="
  <html><body>
  <h4>ZeroSignal</h4>
  <p>Constant zero signal source (y = 0).</p>
  </body></html>")
  );
  end ZeroSignal;

annotation(Documentation(info="
<html>
  <body>
    <h3>Sources</h3>
    <p>Signal sources for tendon activation inputs (uFlex/uExt).</p>
    <ul>
      <li><b>HumanActivation</b>: smooth, muscle-like activation</li>
      <li><b>ProstheticActivation</b>: slower and lower amplitude</li>
      <li><b>RobotActivation</b>: fast, crisp command-like activation</li>
    </ul>
  </body>
</html>"));
end Sources;
