using Toybox.Application as App;
using Toybox.ActivityMonitor;
using Toybox.Graphics as Gfx;
using Toybox.Lang;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

module Step
{
	function render(dc, x, y, fieldColor, renderProgress)
	{
		var info = ActivityMonitor.getInfo();
		var steps = info.steps;
		if (steps > 0)
		{
			var stepGoal = info.stepGoal;
			var stepsString = Lang.format("$1$", [steps.format("%01d")]);

			dc.setColor(fieldColor, Gfx.COLOR_TRANSPARENT);
			dc.drawText(x * ScreenUtil.screenPercent, y * ScreenUtil.screenPercent, Gfx.FONT_TINY, stepsString, Gfx.TEXT_JUSTIFY_CENTER);

			var stringWidth = dc.getTextWidthInPixels(stepsString, Gfx.FONT_TINY);
			var icon = Ui.loadResource(Rez.Drawables.step);

			dc.drawBitmap(x * ScreenUtil.screenPercent - stringWidth/2 - 10 , y * ScreenUtil.screenPercent + 4, icon);

			if (renderProgress)
			{
				var width = ScreenUtil.screenWidth / 3;
				var yProgress = 84;
				var progress = width * steps / stepGoal;
				if (progress > width)
				{
					progress = width;
				}

				dc.drawRectangle(width, yProgress * ScreenUtil.screenPercent, width, 4);
				dc.fillRectangle(width, yProgress * ScreenUtil.screenPercent, progress, 4);
			}
		}
	}
}
