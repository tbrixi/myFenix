import Toybox.Lang;
class Step
{
	function render(dc, fieldColor) as Void
	{	
		var stepsString = getStepsString();

		if (stepsString.length() == 0) {
			return;
		}

		dc.setColor(fieldColor, Graphics.COLOR_TRANSPARENT);

		var x = 45;
		var y = 98;
		dc.drawText(
			x,
			y,
			Graphics.FONT_TINY,
			stepsString,
			Graphics.TEXT_JUSTIFY_LEFT
		);
				
		var iconWidth = 12;
		var iconHeight = 4;
		var icon = WatchUi.loadResource(Rez.Drawables.step);
		dc.drawBitmap(x - iconWidth, y + iconHeight, icon);
	}

	function getStepsString() as String
	{
		var info = ActivityMonitor.getInfo();
		var steps = info.steps;

		if (steps == 0)
		{
			return "";
		}

		return Lang.format("$1$", [steps.format("%01d")]);
	}
}
