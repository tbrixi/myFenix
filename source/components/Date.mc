import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.Time;

class Date {
	public function render(dc as Dc) as Void {
		var x = Util.getValue("dateX");
		var y = Util.getValue("dateY");
		var color = Util.getValue("dateColor");
		var font = WatchUi.loadResource($.Rez.Fonts.digital_28);
		var dateString = getDateString();

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);
		dc.drawText(x, y, font, dateString, Graphics.TEXT_JUSTIFY_CENTER);
	}

	function getDateString() as String {
		var now = Time.now();
		var nowInfo = Time.Gregorian.info(now, Time.FORMAT_MEDIUM);
		var day = nowInfo.day;
		var month = nowInfo.month;
		var dayOfWeek = nowInfo.day_of_week;
		var dateString = Lang.format("$1$ $2$ $3$", [dayOfWeek, day, month]);

		dateString = dateString.toUpper();

		return dateString;
	}
}
