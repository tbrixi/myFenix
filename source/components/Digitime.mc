using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Lang;
using Toybox.System as Sys;
using Toybox.Time;
using Toybox.WatchUi as WatchUi;

module Digitime
{
	function render(dc, sleepMode)
	{
		var xPercent = 50;
		var yPercent = 57;
		var timeString;
		var clockTime = Sys.getClockTime();
		var hours = clockTime.hour;
		var is24Hour = Sys.getDeviceSettings().is24Hour;

		if (!is24Hour && hours >= 12)
		{
			hours = hours - 12;
		}

		var digitalTimeOffset = App.getApp().getProperty("digitalTimeOffset");
		if (digitalTimeOffset != 100)
		{
			var timeZoneOffset = clockTime.timeZoneOffset / -3600;
			hours = hours + timeZoneOffset + digitalTimeOffset;

			if (!is24Hour && hours >= 12)
			{
				hours = hours - 12;
			}

			if (is24Hour && hours >= 24)
			{
				hours = hours - 24;
			}

			if (!is24Hour && hours < 0)
			{
				hours = 12 + hours;
			}

			if (is24Hour && hours < 0)
			{
				hours = 24 + hours;
			}
		}

		if (!sleepMode)
		{
			timeString = Lang.format("$1$:$2$:$3$", [hours, clockTime.min.format("%02d"), clockTime.sec.format("%02d")]);
		}
		else
		{
			timeString = Lang.format("$1$:$2$", [hours, clockTime.min.format("%02d")]);
		}

		dc.setColor(App.getApp().getProperty("digitalTimeColor"), Gfx.COLOR_TRANSPARENT);
		dc.drawText(xPercent * ScreenUtil.screenPercent, yPercent * ScreenUtil.screenPercent, Gfx.FONT_LARGE, timeString, Gfx.TEXT_JUSTIFY_CENTER);
	}
}