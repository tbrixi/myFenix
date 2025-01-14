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
		var layout218 = {
			"bluetoothX" => 46,
			"bluetoothY" => 40,

			"alarmX" => 69,
			"alarmY" => 40,

			"batteryX" => 109,
			"batteryY" => 34,

			"notificationX" => 156,
			"notificationY" => 42,

			"stepsX" => 70,
			"stepsY" => 98,

			"distanceX" => 155,
			"distanceY" => 98,

			"dateX" => 112,
			"dateY" => 58,

			"digitimeX" => 109,
			"digitimeY" => 130,

			"altitudeX" => 56,
			"altitudeY" => 160,

			"hrX" => 155,
			"hrY" => 160,

			"topRectX" => 44,
			"topRectY" => 58,
			"topRectW" => 130,
			"topRectH" => 30,
			"topRectR" => 4,

			"bottomRectX" => 44,
			"bottomRectY" => 130,
			"bottomRectW" => 130,
			"bottomRectH" => 30,
			"bottomRectR" => 4,
		};

		var layout240 = {
			"bluetoothX" =>57,
			"bluetoothY" =>50,

			"alarmX" =>78,
			"alarmY" =>50,

			"batteryX" =>120,
			"batteryY" =>42,

			"notificationX" =>167,
			"notificationY" =>52,

			"stepsX" =>81,
			"stepsY" =>107,
			"stepsIcoW" =>12,
			"stepsIcoH" =>6,

			"distanceX" =>166,
			"distanceY" =>107,

			"dateX" =>120,
			"dateY" =>69,

			"digitimeX" =>120,
			"digitimeY" =>141,

			"altitudeX" =>67,
			"altitudeY" =>171,
			"altitudeIcoX" =>55,
			"altitudeIcoY" =>179,

			"hrX" =>162,
			"hrY" =>171,
			"hrIcoX" =>145,
			"hrIcoY" =>178,


			"topRectX" =>55,
			"topRectY" =>69,
			"topRectW" =>130,
			"topRectH" =>30,
			"topRectR" =>4,

			"bottomRectX" =>55,
			"bottomRectY" =>141,
			"bottomRectW" =>130,
			"bottomRectH" =>30,
			"bottomRectR" =>4
		};

		var value = null;

		var screenWidth = ScreenUtil.screenWidth;
		
		switch (screenWidth) {
			case 218:
				value = layout218.get(name);
				break;

			case 240:
				value = layout240.get(name);
				System.print("screenWidth: " + screenWidth);
				break;

		}

		if (value == null) {
			value = Application.getApp().getProperty(name);
		}

		return value;
	}
}
