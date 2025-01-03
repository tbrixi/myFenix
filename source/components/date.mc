import Toybox.Application;
import Toybox.Graphics;
import Toybox.System;
import Toybox.Time;
import Toybox.Lang;

class Date {
	public function render(field) as Void {
		var now = Time.now();
		var nowInfo = Time.Gregorian.info(now, Time.FORMAT_MEDIUM);
		var day = nowInfo.day;
		var month = nowInfo.month;
		var dayOfWeek = nowInfo.day_of_week;
		var dateString = Lang.format("$1$ $2$ $3$", [dayOfWeek, day, month]);

		dateString = dateString.toUpper();

		var color = Application.getApp().getProperty("dateColor");

		field.setColor(color);
		field.setText(dateString);
	}
}
