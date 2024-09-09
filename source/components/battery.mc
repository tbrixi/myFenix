using Toybox.Graphics as Gfx;
using Toybox.Lang;
using Toybox.System as Sys;

module Battery
{
	function render(dc)
	{
		var xPercent = 50;
		var yPercent = 18;
		var batteryLevel = Sys.getSystemStats().battery;
		var batteryString = Lang.format("$1$%", [batteryLevel.format("%01d")]);

		dc.setColor(Gfx.COLOR_GREEN, Gfx.COLOR_TRANSPARENT);

		if (batteryLevel < 50)
		{
			dc.setColor(Gfx.COLOR_ORANGE, Gfx.COLOR_TRANSPARENT);
		}

		if (batteryLevel < 20)
		{
			dc.setColor(Gfx.COLOR_RED, Gfx.COLOR_TRANSPARENT);
		}

		dc.drawText(xPercent * ScreenUtil.screenPercent, yPercent * ScreenUtil.screenPercent, Gfx.FONT_TINY, batteryString, Gfx.TEXT_JUSTIFY_CENTER);
	}
}