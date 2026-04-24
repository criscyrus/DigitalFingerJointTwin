within FingerJointTwin.Sources;

model ZeroSignal "Constant zero activation signal (tendon inactive)"
  Modelica.Blocks.Interfaces.RealOutput y annotation(
    Placement(transformation(extent={{100,-10},{120,10}})));
equation
  y = 0;
annotation(
  Icon(graphics={
    Rectangle(extent={{-100,60},{100,-60}},
      lineColor={120,120,120},
      fillColor={250,250,250},
      fillPattern=FillPattern.Solid,
      lineThickness=1),
    Line(points={{-60,0},{60,0}}, color={120,120,120}, thickness=2),
    Line(points={{-40,-10},{40,-10}}, color={120,120,120}, thickness=1.5),
    Line(points={{-25,-18},{25,-18}}, color={120,120,120}, thickness=1),
    Line(points={{-12,-25},{12,-25}}, color={120,120,120}, thickness=0.5),
    Text(extent={{-30,35},{30,-5}},
      textString="0",
      textColor={120,120,120},
      textStyle={TextStyle.Bold}),
    Line(points={{-85,0},{-60,0}}, color={100,100,100}, thickness=1.5, pattern=LinePattern.Dash),
    Line(points={{60,0},{85,0}}, color={100,100,100}, thickness=1.5, pattern=LinePattern.Dash),
    Ellipse(extent={{95,-10},{105,10}},
      lineColor={0,0,0},
      fillColor={150,150,150},
      fillPattern=FillPattern.Solid),
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
<p>Constant zero signal source (y = 0). Use to disable a tendon input.</p>
</body></html>"));
end ZeroSignal;
