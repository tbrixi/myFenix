import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class Digitime {
	public function render(dc as Dc, sleepMode) {
		var timeString = getTimeString(sleepMode);

		var x = Util.getValue("digitimeX");
		var y = Util.getValue("digitimeY");
		var color = Util.getValue("digiTimeColor");
		var font = WatchUi.loadResource($.Rez.Fonts.digital_28);

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, font, timeString, Graphics.TEXT_JUSTIFY_CENTER);
	}

	function getTimeString(sleepMode) as String {
		var timeString = "";
		var clockTime = System.getClockTime();
		var hours = clockTime.hour;
		var is24Hour = System.getDeviceSettings().is24Hour;
		var digiTimeOffset = Util.getValue("digiTimeOffset");

		if (!is24Hour && hours >= 12) {
			hours = hours - 12;
		}

		if (digiTimeOffset != 100) {
			var timeZoneOffset = clockTime.timeZoneOffset / -3600;
			hours = hours + timeZoneOffset + digiTimeOffset;

			if (!is24Hour && hours >= 12) {
				hours = hours - 12;
			}

			if (is24Hour && hours >= 24) {
				hours = hours - 24;
			}

			if (!is24Hour && hours < 0) {
				hours = 12 + hours;
			}

			if (is24Hour && hours < 0) {
				hours = 24 + hours;
			}
		}

		if (!sleepMode) {
			timeString = Lang.format("$1$:$2$:$3$", [
				hours,
				clockTime.min.format("%02d"),
				clockTime.sec.format("%02d"),
			]);
		} else {
			timeString = Lang.format("$1$:$2$", [
				hours,
				clockTime.min.format("%02d"),
			]);
		}

		return timeString;
	}
}
