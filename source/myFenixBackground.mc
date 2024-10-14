using Toybox.WatchUi as WatchUi;
using Toybox.Application as Application;
using Toybox.Graphics as Gfx;

class Background extends WatchUi.Drawable {

	function initialize() {
		var dictionary = {
		:identifier => "Background"
		};

		Drawable.initialize(dictionary);
	}

	function draw(dc) {
		dc.setColor(Gfx.COLOR_TRANSPARENT, Application.getApp().getProperty("backgroundColor"));
		dc.clear();
	}
}
