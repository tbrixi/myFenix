using Toybox.System;

module TimeUtil
{
	function is24Hour()
	{
		if (System.getDeviceSettings().is24Hour)
		{
			var clockTime = System.getClockTime();
			var hours = clockTime.hour;
			if (hours >= 12)
			{
				return true;
			}
		}

		return false;
	}

	function isQuarter(value)
	{
		var mod = value % 15;
		return mod == 0;
	}
}