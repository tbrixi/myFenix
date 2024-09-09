using Toybox.Application as App;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.WatchUi as Ui;

module Notification
{
	function renderConnection(dc)
	{
		var connected = Sys.getDeviceSettings().phoneConnected;
		if (connected)
		{
			var xPercent = 61.5;
			var yPercent = 4.5;
			var icon = Ui.loadResource(Rez.Drawables.bluetooth);
			dc.drawBitmap(xPercent * ScreenUtil.screenPercent, yPercent * ScreenUtil.screenPercent, icon);
		}
	}

	function renderNotification(dc)
	{
		var notificationCount = Sys.getDeviceSettings().notificationCount;
		if (notificationCount > 0)
		{
			var xPercent = 78;
			var yPercent = 17;
			var icon = Ui.loadResource(Rez.Drawables.notification);
			dc.drawBitmap(xPercent * ScreenUtil.screenPercent, yPercent * ScreenUtil.screenPercent, icon);
		}
	}

	function renderAlarm(dc)
	{
		var alarmCount = Sys.getDeviceSettings().alarmCount;
		if (alarmCount > 0)
		{
			var xPercent = 92;
			var yPercent = 34;
			var icon = Ui.loadResource(Rez.Drawables.alarm);
			dc.drawBitmap(xPercent * ScreenUtil.screenPercent, yPercent * ScreenUtil.screenPercent, icon);
		}
	}
}