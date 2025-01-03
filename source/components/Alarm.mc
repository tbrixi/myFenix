class Alarm {
	public function render(dc) as Void {
		var alarmCount = System.getDeviceSettings().alarmCount;
		if (alarmCount > 0) {
			var x = 52;
			var y = 40;
			var icon = WatchUi.loadResource(Rez.Drawables.alarm);
			dc.drawBitmap(x, y, icon);
		}
	}
}
