using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Math;
using Toybox.System;
using Toybox.WatchUi;

module MarkCarrera
{
	function render(dc)
	{
		var totalItems = 12.0;
		var hourMarkArray = new [totalItems];

		var max = ScreenUtil.centerX;
		var min = max - 20;
		var width = 10;
		var width2 = 4;

		renderMain(dc);

		for(var i = 0; i < totalItems; i++)
		{
			hourMarkArray[i] = new [2];
			hourMarkArray[i][0] = (i / totalItems) * Math.PI * 2;
		}

		dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
		for(var i = 1; i < totalItems; i++)
		{
			renderMark(dc, hourMarkArray[i][0], max, width, -min);
		}

		dc.setColor(Gfx.COLOR_LT_GRAY , Gfx.COLOR_TRANSPARENT);
		for(var i = 1; i < totalItems; i ++)
		{
			renderMark(dc, hourMarkArray[i][0], max - width, width, -min);
		}

		dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		for(var i = 1; i < totalItems; i ++)
		{
			renderMark(dc, hourMarkArray[i][0], max, width2, -max + 7);
		}

		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		for(var i = 1; i < totalItems; i ++)
		{
			renderMark(dc, hourMarkArray[i][0], max - 7, width2, -min - 3);
		}
	}

	function renderMark(dc, angle, length, width, overheadLength)
	{
		var item = [
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
			var x = (item[i][0] * cos) - (item[i][1] * sin);
			var y = (item[i][0] * sin) + (item[i][1] * cos);
			result[i] = [ScreenUtil.centerX + x, ScreenUtil.centerY + y];
		}

		dc.fillPolygon(result);
	}

	function renderMain(dc)
	{
		var width = 10;
		var width2 = 4;
		var height = 23;
		var offset = 2;

		dc.setColor(Gfx.COLOR_DK_GRAY, Gfx.COLOR_TRANSPARENT);
		dc.fillRectangle(ScreenUtil.centerX + offset, 0, width, height);
		dc.fillRectangle(ScreenUtil.centerX - offset - width, 0, width, height);

		dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
		dc.fillRectangle(ScreenUtil.centerX + offset, 10, width, height - 10);
		dc.fillRectangle(ScreenUtil.centerX - offset - width, 10, width, height - 10);

		dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		dc.fillRectangle(ScreenUtil.centerX + 3 + offset, 0, width2, 7);
		dc.fillRectangle(ScreenUtil.centerX + 3 - offset - width, 0, width2, 7);

		dc.setColor(Gfx.COLOR_WHITE, Gfx.COLOR_TRANSPARENT);
		dc.fillRectangle(ScreenUtil.centerX + 3 + offset, 7, width2, 13);
		dc.fillRectangle(ScreenUtil.centerX + 3 - offset - width, 7, width2, 13);
	}


}