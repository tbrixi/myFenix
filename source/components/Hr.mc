class Hr {
	public function render(dc, fieldColor) {
		if (ActivityMonitor has :getHeartRateHistory) {
			var hrIter = ActivityMonitor.getHeartRateHistory(null, true);
			var hr = hrIter.next();
			var bpm =
				hr.heartRate != ActivityMonitor.INVALID_HR_SAMPLE && hr.heartRate > 0
					? hr.heartRate
					: 0;

			if (bpm > 0) {
				var bpmString = bpm.toString();
				dc.setColor(fieldColor, Graphics.COLOR_TRANSPARENT);

				var x = 150;
				var y = 160;
				dc.drawText(
					x,
					y,
					Graphics.FONT_TINY,
					bpmString,
					Graphics.TEXT_JUSTIFY_LEFT
				);

				var iconWidth = 18;
				var iconHeight = 6;
				var icon = WatchUi.loadResource(Rez.Drawables.bpm);
				dc.drawBitmap(x - iconWidth, y + iconHeight, icon);
			}
		}
	}
}
