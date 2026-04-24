within FingerJointTwin.Sources;

model HumanActivation "Smooth muscle-like activation using a trapezoid waveform"
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(extent = {{100, -10}, {120, 10}})));
protected
  Modelica.Blocks.Sources.Trapezoid act(amplitude = 1, rising = 0.3, width = 1.2, falling = 0.3, period = 3, startTime = 0.2);
equation
  y = act.y;
annotation(
  Icon(graphics={
    Rectangle(extent={{-100,60},{100,-60}},
      lineColor={180,100,60},
      fillColor={255,245,235},
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    Ellipse(extent={{-80,35},{-40,-35}},
      lineColor={180,80,80},
      fillColor={255,200,200},
      fillPattern=FillPattern.Solid),
    Polygon(points={{-40,25},{-20,20},{0,15},{10,10},{20,0},{10,-10},{0,-15},{-20,-20},{-40,-25},{-40,25}},
      lineColor={180,80,80},
      fillColor={255,200,200},
      fillPattern=FillPattern.Solid,
      smooth=Smooth.Bezier),
    Line(points={{30,-20},{40,-20},{48,15},{68,15},{76,-20},{85,-20}},
      color={200,0,0},
      thickness=2.5),
    Line(points={{25,-25},{90,-25}}, color={100,100,100}, thickness=0.5),
    Ellipse(extent={{95,-10},{105,10}},
      lineColor={0,0,0},
      fillColor={0,255,0},
      fillPattern=FillPattern.Solid),
    Text(extent={{-100,95},{100,65}},
      textString="Human",
      textColor={180,100,60},
      textStyle={TextStyle.Bold}),
    Text(extent={{-100,-65},{100,-95}},
      textString="Smooth Activation",
      textColor={150,80,50})
  }),
  Documentation(info="
<html><body>
<h4>HumanActivation</h4>
<p>Muscle-like smooth activation using a trapezoid waveform (rise 0.3 s, hold 1.2 s, fall 0.3 s, period 3 s).</p>
<p><b>Use:</b> connect <code>y</code> to <code>sys.uFlex</code> or <code>sys.uExt</code>.</p>
</body></html>"));
end HumanActivation;
