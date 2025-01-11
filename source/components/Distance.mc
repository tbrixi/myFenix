import Toybox.Graphics;
import Toybox.Lang;

class Distance {
	var unit = System.getDeviceSettings().distanceUnits;

	public function render(dc as Dc, fieldColor) as Void {
		var distanceString = getDistanceString();

		if (distanceString.length() == 0) {
			return;
		}

		dc.setColor(fieldColor, Graphics.COLOR_TRANSPARENT);

		var x = Util.getValue("distanceX");
		var y = Util.getValue("distanceY");
		dc.drawText(
			x,
			y,
			Graphics.FONT_TINY,
			distanceString,
			Graphics.TEXT_JUSTIFY_CENTER
		);
	}

	function getDistanceString() as String {
		var distanceString = "";

		var info = ActivityMonitor.getInfo();
		var meter = info.distance / 100;

		if (meter == 0) {
			return distanceString;
		}

		if (unit == System.UNIT_METRIC) {
			if (meter < 999) {
				distanceString = Lang.format("$1$m", [meter.format("%01d")]);
			} else {
				var km = meter.toFloat() / 1000;
				if (km.toNumber() < 100) {
					distanceString = Lang.format("$1$km", [km.format("%0.2f")]);
				} else {
					distanceString = Lang.format("$1$km", [km.format("%0.1f")]);
				}
			}
		}

		if (unit == System.UNIT_STATUTE) {
			var feet = meter * Constants.feetScale;
			if (feet.toNumber() < 999) {
				distanceString = Lang.format("$1$ft", [feet.format("%01d")]);
			} else {
				var miles = meter.toFloat() / Constants.mileScale;
				if (miles.toNumber() < 100) {
					distanceString = Lang.format("$1$mi", [miles.format("%0.2f")]);
				} else {
					distanceString = Lang.format("$1$mi", [miles.format("%0.1f")]);
				}
			}
		}

		return distanceString;
	}
}
