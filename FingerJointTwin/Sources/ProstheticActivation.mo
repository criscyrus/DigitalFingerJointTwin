within FingerJointTwin.Sources;

model ProstheticActivation "Slower, lower-amplitude activation for prosthetic devices"
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(extent={{100,-10},{120,10}})));
protected
  Modelica.Blocks.Sources.Trapezoid act(
    amplitude=0.6, rising=0.6, width=1.5, falling=0.6, period=4, startTime=0.2);
equation
  y = act.y;
annotation(
  Icon(graphics={
    Rectangle(extent={{-100,60},{100,-60}},
      lineColor={80,100,120},
      fillColor={235,240,245},
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    Ellipse(extent={{-75,30},{-45,-30}},
      lineColor={60,80,100},
      fillColor={180,190,200},
      fillPattern=FillPattern.Solid),
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
    Line(points={{25,-20},{33,-20},{45,10},{65,10},{77,-20},{85,-20}},
      color={0,100,180},
      thickness=2.5),
    Line(points={{20,-25},{90,-25}}, color={100,100,100}, thickness=0.5),
    Ellipse(extent={{95,-10},{105,10}},
      lineColor={0,0,0},
      fillColor={0,200,255},
      fillPattern=FillPattern.Solid),
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
<p>Conservative trapezoid activation for myoelectric prosthetic devices (rise 0.6 s, hold 1.5 s, fall 0.6 s, amplitude 0.6, period 4 s). The slower ramp (0.6 s vs 0.3 s for human) represents the deliberate, safe movement speed typical of prosthetic control. The reduced amplitude (0.6) models power-limited actuation — myoelectric prosthetics commonly apply current limiting to protect actuators, which caps the effective torque below the hardware maximum.</p>
<p><b>Use:</b> connect <code>y</code> to <code>sys.uFlex</code> or <code>sys.uExt</code>. Adjust amplitude and ramp to match your device's motor controller settings.</p>
</body></html>"));
end ProstheticActivation;
