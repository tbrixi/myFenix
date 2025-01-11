import Toybox.Graphics;
import Toybox.Lang;

class Step {
	function render(dc as Dc, fieldColor) as Void {
		var stepsString = getStepsString();

		if (stepsString.length() == 0) {
			return;
		}

		dc.setColor(fieldColor, Graphics.COLOR_TRANSPARENT);

		var x = Util.getValue("stepsX");
		var y = Util.getValue("stepsY");
		dc.drawText(
			x,
			y,
			Graphics.FONT_TINY,
			stepsString,
			Graphics.TEXT_JUSTIFY_CENTER
		);

		var stringWidth = dc.getTextWidthInPixels(stepsString, Graphics.FONT_TINY);

		var iconWidth = 8;
		var iconHeight = 4;
		var space = 4;
		var icon = WatchUi.loadResource(Rez.Drawables.step);
		dc.drawBitmap(
			x - stringWidth / 2 - iconWidth - space,
			y + iconHeight,
			icon
		);
	}

	function getStepsString() as String {
		var info = ActivityMonitor.getInfo();
		var steps = info.steps;

		if (steps == 0) {
			return "";
		}

		return Lang.format("$1$", [steps.format("%01d")]);
	}
}
