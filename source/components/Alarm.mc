import Toybox.Graphics;
class Alarm {
	public function render(dc as Dc) as Void {
		var alarmCount = System.getDeviceSettings().alarmCount;

		if (alarmCount > 0) {
			var x = Util.getValue("alarmX");
			var y = Util.getValue("alarmY");
			var icon = WatchUi.loadResource(Rez.Drawables.alarm);

			dc.drawBitmap(x, y, icon);
		}
	}
}
