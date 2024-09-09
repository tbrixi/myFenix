using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Math;
using Toybox.System;
using Toybox.WatchUi;
using Toybox.System as Sys;

module MarkScuba
{
	var border = 2;
	var radius = 8;

	function render(dc)
	{
		renderDots(dc);
		renderRec(dc);
	}

	function renderRec(dc)
	{
		var width = 30;
		var height = 15;

		dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
		dc.fillRectangle(0, ScreenUtil.centerY - height / 2, width, height);
		dc.fillRectangle(ScreenUtil.screenWidth - width, ScreenUtil.centerY - height / 2, width, height);
		dc.fillRectangle(ScreenUtil.centerX - height / 2 , ScreenUtil.screenHeight - width, height, width);

		var poligon = new [4];
		poligon[0] = [ScreenUtil.centerX - height - 2 * border, 1];
		poligon[1] = [ScreenUtil.centerX + height + 2 * border, 1];
		poligon[2] = [ScreenUtil.centerX + 7, width + border];
		poligon[3] = [ScreenUtil.centerX - 7, width + border];
		dc.fillPolygon(poligon);

		dc.setColor(App.getApp().getProperty("analogTimeColor"), Gfx.COLOR_TRANSPARENT);
		dc.fillRectangle(border, ScreenUtil.centerY - height / 2 + border, width - 2 * border, height - 2 * border);
		dc.fillRectangle(ScreenUtil.screenWidth - width + border, ScreenUtil.centerY - height / 2 + border, width - 2 * border, height - 2 * border);
		dc.fillRectangle(ScreenUtil.centerX - height / 2 + border, ScreenUtil.screenHeight - width + border, height - 2 * border, width - 2 * border);

		poligon[0] = [ScreenUtil.centerX - height, 3];
		poligon[1] = [ScreenUtil.centerX + height, 3];
		poligon[2] = [ScreenUtil.centerX + 5, width];
		poligon[3] = [ScreenUtil.centerX - 5, width];
		dc.fillPolygon(poligon);
	}

	function renderDots(dc)
	{
		for(var i = 0; i < 60; i += 5)
		{
			if (!TimeUtil.isQuarter(i))
			{
				var rad = (i / 60.0) * Math.PI * 2;

				var sin = Math.sin(rad);
				var cos = Math.cos(rad);

				var width = ScreenUtil.centerX - radius;
				var x = cos * width + ScreenUtil.centerX;
				var y = sin * width + ScreenUtil.centerX;

				dc.setColor(Gfx.COLOR_LT_GRAY, Gfx.COLOR_TRANSPARENT);
				dc.fillCircle(x, y, radius);

				dc.setColor(App.getApp().getProperty("analogTimeColor"), Gfx.COLOR_TRANSPARENT);
				dc.fillCircle(x, y, radius - border);
			}
		}
	}
}