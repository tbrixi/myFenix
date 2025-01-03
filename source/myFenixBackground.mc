import Toybox.WatchUi;
class Background extends WatchUi.Drawable
{
	function initialize() {
		var dictionary = {
		:identifier => "Background"
		};

		Drawable.initialize(dictionary);
	}

	function draw(dc) {

		dc.setColor(Graphics.COLOR_TRANSPARENT, Application.getApp().getProperty("backgroundColor"));
		dc.clear();
	}
}
