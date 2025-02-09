import Toybox.Graphics;
import Toybox.Lang;

class Hr {
	public function render(dc as Dc, fieldColor) {
		var bpmString = getBpmString();

		if (bpmString.length() == 0) {
			return;
		}
		
		dc.setColor(fieldColor, Graphics.COLOR_TRANSPARENT);

		var x = Util.getValue("hrX");
		var y = Util.getValue("hrY");
		dc.drawText(
			x,
			y,
			Graphics.FONT_TINY,
			bpmString,
			Graphics.TEXT_JUSTIFY_LEFT
		);

		var icoX = Util.getValue("hrIcoX");
		var icoY = Util.getValue("hrIcoY");
		var icon = WatchUi.loadResource(Rez.Drawables.bpm);
		dc.drawBitmap(x + icoX, y + icoY, icon);
	}

	function getBpmString() as String{
		if (ActivityMonitor has :getHeartRateHistory) {
			var hrIter = ActivityMonitor.getHeartRateHistory(null, true);
			var hr = hrIter.next();
			var bpm =
				hr.heartRate != ActivityMonitor.INVALID_HR_SAMPLE && hr.heartRate > 0
					? hr.heartRate
					: 0;

			if (bpm > 0) {
				return bpm.toString();
			}
		}

		return "";
	}
}
