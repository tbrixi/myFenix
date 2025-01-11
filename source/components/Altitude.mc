import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class Altitude {
	public function render(dc as Dc, fieldColor) as Void {
		var altitudeString = getAltitudeString();

		if (altitudeString.length() == 0) {
			return;
		}

		var x = Util.getValue("altitudeX");
		var y = Util.getValue("altitudeY");

		dc.setColor(fieldColor, Graphics.COLOR_TRANSPARENT);

		dc.drawText(
			x,
			y,
			Graphics.FONT_TINY,
			altitudeString,
			Graphics.TEXT_JUSTIFY_LEFT
		);

		var icon = getAltitudeIcon();
		if (icon == null) {
			return;
		}
		var iconWidth = 12;
		var iconHeight = 6;
		dc.drawBitmap(x - iconWidth, y + iconHeight, icon);
	}

	function getAltitudeString() as String {
		var altitudeString = "";

		var meter = Activity.getActivityInfo().altitude;

		if (meter == null || meter.toNumber() == 0.0) {
			return altitudeString;
		}

		var unit = System.getDeviceSettings().distanceUnits;

		if (unit == System.UNIT_METRIC) {
			altitudeString = Lang.format("$1$m", [meter.format("%01d")]);
		}

		if (unit == System.UNIT_STATUTE) {
			var feet = meter * Constants.feetScale;
			altitudeString = Lang.format("$1$ft", [feet.format("%01d")]);
		}

		return altitudeString;
	}

	function getAltitudeIcon() {
		var meter = Activity.getActivityInfo().altitude;

		var icon = null;

		if (meter == null || meter.toNumber() == 0.0) {
			return icon;
		}

		var meterRounded = meter.toNumber();

		if (meterRounded < AppModel.lastAltitude) {
			icon = WatchUi.loadResource(Rez.Drawables.altDown);
		} else {
			icon = WatchUi.loadResource(Rez.Drawables.altUp);
		}

		AppModel.lastAltitude = meterRounded;

		return icon;
	}
}
