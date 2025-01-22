import Toybox.Application;
import Toybox.Lang;
import Toybox.System;

//  Util.getValue("");
module Util {
	function getValue(name as String) {
		//return Application.getApp().getProperty(name);

		return getPositionlValue(name);
	}

	function getPositionlValue(name as String) {
		// var layout = {
		// 	"bluetoothX" => 57,
		// 	"bluetoothY" => 50,

		// 	"alarmX" => 78,
		// 	"alarmY" => 50,

		// 	"batteryX" => 120,
		// 	"batteryY" => 42,

		// 	"notificationX" => 167,
		// 	"notificationY" => 52,

		// 	"stepsX" => 81,
		// 	"stepsY" => 107,
		// 	"stepsIcoX" => -12,
		// 	"stepsIcoY" => 6,

		// 	"distanceX" => 166,
		// 	"distanceY" => 107,

		// 	"dateX" => 120,
		// 	"dateY" => 69,

		// 	"digitimeX" => 120,
		// 	"digitimeY" => 141,

		// 	"altitudeX" => 67,
		// 	"altitudeY" => 171,
		// 	"altitudeIcoX" => -12,
		// 	"altitudeIcoY" => 8,

		// 	"hrX" => 162,
		// 	"hrY" => 171,
		// 	"hrIcoX" => -17,
		// 	"hrIcoY" => 7,

		// 	"topRectX" => 55,
		// 	"topRectY" => 69,
		// 	"topRectW" => 130,
		// 	"topRectH" => 30,
		// 	"topRectR" => 4,

		// 	"bottomRectX" => 55,
		// 	"bottomRectY" => 141,
		// 	"bottomRectW" => 130,
		// 	"bottomRectH" => 30,
		// 	"bottomRectR" => 4,
		// };

		var value = null;

		// var screenWidth = ScreenUtil.screenWidth;

		// switch (screenWidth) {
		// 	case 240:
		// 		value = layout240.get(name);
		// 		System.print("screenWidth: " + screenWidth);
		// 		break;
		// }

		//if (value == null) {
			value = Application.getApp().getProperty(name);
		//}

		return value;
	}
}
