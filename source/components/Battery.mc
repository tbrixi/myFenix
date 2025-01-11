import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;

class Battery {
	public function render(dc as Dc) {
		var x = Util.getValue("batteryX");
		var y = Util.getValue("batteryY");

		var batteryLevel = System.getSystemStats().battery;
		var batteryString = Lang.format("$1$%", [batteryLevel.format("%01d")]);

		dc.setColor(Graphics.COLOR_GREEN, Graphics.COLOR_TRANSPARENT);

		if (batteryLevel < 50) {
			dc.setColor(Graphics.COLOR_ORANGE, Graphics.COLOR_TRANSPARENT);
		}

		if (batteryLevel < 20) {
			dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
		}

		dc.drawText(
			x,
			y,
			Graphics.FONT_TINY,
			batteryString,
			Graphics.TEXT_JUSTIFY_CENTER
		);
	}
}
