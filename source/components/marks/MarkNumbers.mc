import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Math;
import Toybox.WatchUi;

class MarkNumbers {
	public function render(dc as Dc) as Void {
		var numbers = getNumbers();
		var font = Graphics.FONT_SYSTEM_TINY;
		var font3 = Graphics.FONT_SYSTEM_LARGE;
		var color = Util.getValue("analogTimeColor");

		dc.setColor(color, Graphics.COLOR_TRANSPARENT);

		dc.drawText(
			ScreenUtil.screenWidth * 0.5,
			12,
			font3,
			numbers[0],
			Graphics.TEXT_JUSTIFY_CENTER + Graphics.TEXT_JUSTIFY_VCENTER
		);

		dc.drawText(
			ScreenUtil.screenWidth * 0.77,
			ScreenUtil.screenHeight * 0.1,
			font,
			numbers[1],
			Graphics.TEXT_JUSTIFY_RIGHT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 0.93,
			ScreenUtil.screenHeight * 0.27,
			font,
			numbers[2],
			Graphics.TEXT_JUSTIFY_RIGHT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 1.0,
			ScreenUtil.screenHeight * 0.5,
			font3,
			numbers[3],
			Graphics.TEXT_JUSTIFY_RIGHT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 0.93,
			ScreenUtil.screenHeight * 0.73,
			font,
			numbers[4],
			Graphics.TEXT_JUSTIFY_RIGHT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 0.77,
			ScreenUtil.screenHeight * 0.9,
			font,
			numbers[5],
			Graphics.TEXT_JUSTIFY_RIGHT + Graphics.TEXT_JUSTIFY_VCENTER
		);

		dc.drawText(
			ScreenUtil.screenWidth * 0.5,
			ScreenUtil.screenHeight - 13,
			font3,
			numbers[6],
			Graphics.TEXT_JUSTIFY_CENTER + Graphics.TEXT_JUSTIFY_VCENTER
		);

		dc.drawText(
			ScreenUtil.screenWidth * 0.25,
			ScreenUtil.screenHeight * 0.9,
			font,
			numbers[7],
			Graphics.TEXT_JUSTIFY_LEFT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 0.08,
			ScreenUtil.screenHeight * 0.73,
			font,
			numbers[8],
			Graphics.TEXT_JUSTIFY_LEFT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 0.0,
			ScreenUtil.screenHeight * 0.5,
			font3,
			numbers[9],
			Graphics.TEXT_JUSTIFY_LEFT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 0.07,
			ScreenUtil.screenHeight * 0.27,
			font,
			numbers[10],
			Graphics.TEXT_JUSTIFY_LEFT + Graphics.TEXT_JUSTIFY_VCENTER
		);
		dc.drawText(
			ScreenUtil.screenWidth * 0.23,
			ScreenUtil.screenHeight * 0.1,
			font,
			numbers[11],
			Graphics.TEXT_JUSTIFY_LEFT + Graphics.TEXT_JUSTIFY_VCENTER
		);
	}

	function getNumbers() as Array<String> {
		if (TimeUtil.is24Hour()) {
			return [
				"24",
				"13",
				"14",
				"15",
				"16",
				"17",
				"18",
				"19",
				"20",
				"21",
				"22",
				"23",
			];
		} else {
			return ["12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"];
		}
	}
}
