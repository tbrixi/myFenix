using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Math;
using Toybox.System;
using Toybox.WatchUi;

module MarkCarreraNumber
{
	function render(dc)
	{
		var hourMarkArray = new [60];

		for(var i = 0; i < 60; i+=1)
		{
			hourMarkArray[i] = new [2];
			if (!TimeUtil.isQuarter(i))
			{
				hourMarkArray[i][0] = (i / 60.0) * Math.PI * 2;
			}
		}

		var numbers = getNumbers();
		var font = Gfx.FONT_LARGE;

		dc.setColor(App.getApp().getProperty("analogTimeColor"), Gfx.COLOR_TRANSPARENT);

		dc.drawText((ScreenUtil.screenWidth / 2), 12, font, numbers[0], Gfx.TEXT_JUSTIFY_CENTER + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth, ScreenUtil.screenHeight / 2, font, numbers[1], Gfx.TEXT_JUSTIFY_RIGHT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth / 2, ScreenUtil.screenHeight - 13, font, numbers[2], Gfx.TEXT_JUSTIFY_CENTER + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(0, ScreenUtil.screenHeight / 2, font, numbers[3], Gfx.TEXT_JUSTIFY_LEFT + Gfx.TEXT_JUSTIFY_VCENTER);

		dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);

		var max = ScreenUtil.centerX;
		var min = 0.85 * ScreenUtil.centerX;
		var width = 4 * ScreenUtil.screenPercent;
		var width2 = 2 * ScreenUtil.screenPercent;

		for(var i = 0; i < 60; i += 5)
		{
			if (!TimeUtil.isQuarter(i))
			{
				renderMark(dc, hourMarkArray[i][0], max, width, -min);
			}
		}

		dc.setColor(Gfx.COLOR_LT_GRAY , Gfx.COLOR_TRANSPARENT);
		for(var i = 0; i < 60; i += 5)
		{
			if (!TimeUtil.isQuarter(i))
			{
				renderMark(dc, hourMarkArray[i][0], max - width, width, -min);
			}
		}

		dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		for(var i = 0; i < 60; i += 5)
		{
			if (!TimeUtil.isQuarter(i))
			{
				renderMark(dc, hourMarkArray[i][0], max, width2, -0.94 * max);
			}
		}

		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		for(var i = 0; i < 60; i += 5)
		{
			if (!TimeUtil.isQuarter(i))
			{
				renderMark(dc, hourMarkArray[i][0], 0.94* max, width2, -1.02 * min);
			}
		}
	}

	function renderMark(dc, angle, length, width, overheadLength)
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

	function getNumbers()
	{
		if (TimeUtil.is24Hour())
		{
			return ["24","15","18","21"];
		}
		else
		{
			return ["12","3","6","9"];
		}
	}
}