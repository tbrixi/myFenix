using Toybox.ActivityMonitor;
using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Lang;

module Calorie
{
	function render(dc, x, y, fieldColor)
	{
		var calories = ActivityMonitor.getInfo().calories;
		if (calories > 0)
		{
			var caloriesString = Lang.format("$1$kC", [calories.format("%01d")]);
			dc.setColor(fieldColor, Gfx.COLOR_TRANSPARENT);
			dc.drawText(x * ScreenUtil.screenPercent, y * ScreenUtil.screenPercent, Gfx.FONT_TINY, caloriesString, Gfx.TEXT_JUSTIFY_CENTER);
		}
	}
}