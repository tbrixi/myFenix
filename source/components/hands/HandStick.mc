using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Math as Math;
using Toybox.System as Sys;

module HandStick
{
	var clockTime;
	var clockHour;
	var clockMin;
	var clockSec;

	var hourLength = 27 * ScreenUtil.screenPercent;
	var hourWidth = 3 * ScreenUtil.screenPercent;

	var minuteLength = 39 * ScreenUtil.screenPercent;
	var minuteWidth = 4 * ScreenUtil.screenPercent;

	var secondLength = 42 * ScreenUtil.screenPercent;
	var secondWidth = 2 * ScreenUtil.screenPercent;


	function render(dc, sleepMode)
	{
		clockTime = Sys.getClockTime();
		clockHour = clockTime.hour;
		clockMin = clockTime.min;
		clockSec = clockTime.sec;

		renderHourHand(dc);
		renderMinuteHand(dc);

		if (!sleepMode)
		{
			renderSecondHand(dc);
		}

		renderCircle(dc);
	}

	function renderHourHand(dc)
	{
		var hour = (((clockHour % 12 ) * 60 ) + clockMin );
		hour = hour / (12 * 60.0);
		hour = hour * Math.PI * 2;
		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		renderHand(dc, hour, hourLength, hourWidth, 0.3 * hourLength);
		dc.setColor(App.getApp().getProperty("analogTimeColor"), Gfx.COLOR_TRANSPARENT);
		renderHand(dc, hour, 0.98 * hourLength, 0.75 * hourWidth, 0.28 * hourLength);
	}

	function renderMinuteHand(dc)
	{
		var min = (clockMin / 60.0) * Math.PI * 2;
		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		renderHand(dc, min, minuteLength, minuteWidth, 0.3 * minuteLength );
		dc.setColor(App.getApp().getProperty("analogTimeColor"), Gfx.COLOR_TRANSPARENT);
		renderHand(dc, min, 0.98 * minuteLength, 0.75 * minuteWidth, 0.28 * minuteLength);
	}

	function renderSecondHand(dc)
	{
		var sec = (clockSec / 60.0) *  Math.PI * 2;
		dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		renderHand(dc, sec, secondLength, secondWidth, 0.28 * secondLength);
	}

	function renderCircle(dc)
	{
		dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
		dc.fillCircle(ScreenUtil.centerX, ScreenUtil.centerY, 7);
		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		dc.fillCircle(ScreenUtil.centerX, ScreenUtil.centerY, 5);
		dc.setColor(Gfx.COLOR_BLACK, Gfx.COLOR_TRANSPARENT);
		dc.fillCircle(ScreenUtil.centerX, ScreenUtil.centerY, 2);
	}

	function renderHand(dc, angle, length, width, overheadLength)
	{
		var hand = [
			[-(width / 2), 0 + overheadLength],
			[-(width / 2), -length],
			[width / 2, -length],
			[width / 2, 0 + overheadLength]
		];
		var result = new [4];
		var cos = Math.cos(angle);
		var sin = Math.sin(angle);

		for (var i = 0; i < 4; i += 1)
		{
			var x = (hand[i][0] * cos) - (hand[i][1] * sin);
			var y = (hand[i][0] * sin) + (hand[i][1] * cos);
			result[i] = [ScreenUtil.centerX + x, ScreenUtil.centerY + y];
		}

		dc.fillPolygon(result);
	}
}