class Bluetooth
{
	public function render(dc) as Void
	{
		var connected = System.getDeviceSettings().phoneConnected;
		if (connected)
		{
			var x = 75;
			var y = 40;
			var icon = WatchUi.loadResource(Rez.Drawables.bluetooth);
			dc.drawBitmap(x, y, icon);
		}
	}
	
}
