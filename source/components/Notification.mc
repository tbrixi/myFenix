import Toybox.Graphics;
class Notification {
	function render(dc as Dc) {
		var notificationCount = System.getDeviceSettings().notificationCount;
		if (notificationCount > 0) {
			var x = Util.getValue("notificationX");
			var y = Util.getValue("notificationY");
			var icon = WatchUi.loadResource(Rez.Drawables.notification);

			dc.drawBitmap(x, y, icon);
		}
	}
}
