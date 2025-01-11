import Toybox.Graphics;
class Rect {
	public function render(dc as Dc) {
		rendetTopRect(dc);
		renderBottomRect(dc);
	}

	function rendetTopRect(dc) {
		dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);

		var x = Util.getValue("topRectX");
		var y = Util.getValue("topRectY");
		var width = Util.getValue("topRectW");
		var height = Util.getValue("topRectH");
		var radius = Util.getValue("topRectR");

		// x = 44;
		// width = 130;
		//System.print("x: " + x + ", y: " + y + ", width: " + width + ", height: " + height + ", radius: " + radius);

		dc.drawRoundedRectangle(x, y, width, height, radius);
	}

	function renderBottomRect(dc) {
		dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);

		var x = Util.getValue("bottomRectX");
		var y = Util.getValue("bottomRectY");
		var width = Util.getValue("bottomRectW");
		var height = Util.getValue("bottomRectH");
		var radius = Util.getValue("bottomRectR");

		dc.drawRoundedRectangle(x, y, width, height, radius);
	}
}
