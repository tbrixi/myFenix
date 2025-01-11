import Toybox.Graphics;

class Bluetooth {
	public function render(dc as Dc) as Void {
		var connected = System.getDeviceSettings().phoneConnected;

		if (connected) {
			var x = Util.getValue("bluetoothX");
			var y = Util.getValue("bluetoothY");
			var icon = WatchUi.loadResource(Rez.Drawables.bluetooth);

			dc.drawBitmap(x, y, icon);
		}
	}
}
