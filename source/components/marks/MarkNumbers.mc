using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.Math;

using Toybox.WatchUi;

module MarkNumbers
{
	function render(dc)
	{
		var numbers = getNumbers();
		var font = Gfx.FONT_SYSTEM_TINY;
		var font3 = Gfx.FONT_SYSTEM_LARGE;

		dc.setColor(App.getApp().getProperty("analogTimeColor"), Gfx.COLOR_TRANSPARENT);

		dc.drawText((ScreenUtil.screenWidth * 0.50), 12, font3, numbers[0], Gfx.TEXT_JUSTIFY_CENTER + Gfx.TEXT_JUSTIFY_VCENTER);

		dc.drawText(ScreenUtil.screenWidth * 0.77, ScreenUtil.screenHeight * 0.10, font, numbers[1], Gfx.TEXT_JUSTIFY_RIGHT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 0.93, ScreenUtil.screenHeight * 0.27, font, numbers[2], Gfx.TEXT_JUSTIFY_RIGHT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 1.00, ScreenUtil.screenHeight * 0.50, font3, numbers[3], Gfx.TEXT_JUSTIFY_RIGHT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 0.93, ScreenUtil.screenHeight * 0.73, font, numbers[4], Gfx.TEXT_JUSTIFY_RIGHT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 0.77, ScreenUtil.screenHeight * 0.90, font, numbers[5], Gfx.TEXT_JUSTIFY_RIGHT + Gfx.TEXT_JUSTIFY_VCENTER);

		dc.drawText(ScreenUtil.screenWidth * 0.50, ScreenUtil.screenHeight - 13, font3, numbers[6], Gfx.TEXT_JUSTIFY_CENTER + Gfx.TEXT_JUSTIFY_VCENTER);

		dc.drawText(ScreenUtil.screenWidth * 0.25, ScreenUtil.screenHeight * 0.90, font, numbers[7], Gfx.TEXT_JUSTIFY_LEFT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 0.08, ScreenUtil.screenHeight * 0.73, font, numbers[8], Gfx.TEXT_JUSTIFY_LEFT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 0.00, ScreenUtil.screenHeight * 0.50, font3, numbers[9], Gfx.TEXT_JUSTIFY_LEFT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 0.07, ScreenUtil.screenHeight * 0.27, font, numbers[10], Gfx.TEXT_JUSTIFY_LEFT + Gfx.TEXT_JUSTIFY_VCENTER);
		dc.drawText(ScreenUtil.screenWidth * 0.23, ScreenUtil.screenHeight * 0.10, font, numbers[11], Gfx.TEXT_JUSTIFY_LEFT + Gfx.TEXT_JUSTIFY_VCENTER);
	}

	function getNumbers()
	{
		if (TimeUtil.is24Hour())
		{
			return ["24","13","14","15","16","17","18","19","20","21","22","23"];
		}
		else
		{
			return ["12","1","2","3","4","5","6","7","8","9","10","11"];
		}
	}
}