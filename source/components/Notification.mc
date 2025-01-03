class Notification {
	function render(dc) {
		var notificationCount = System.getDeviceSettings().notificationCount;
		if (notificationCount > 0) {
			var x = 151;
			var y = 42;
			var icon = WatchUi.loadResource(Rez.Drawables.notification);
			dc.drawBitmap(x, y, icon);
		}
	}
}
