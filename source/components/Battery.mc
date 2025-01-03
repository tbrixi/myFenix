import Toybox.Lang;
import Toybox.System;

class Battery
{
	public function render(field) as Void
	{		
		var batteryLevel = System.getSystemStats().battery;
		var batteryString = Lang.format("$1$%", [batteryLevel.format("%01d")]);

		field.setColor(Graphics.COLOR_GREEN);

		if (batteryLevel < 50)
		{
			field.setColor(Graphics.COLOR_ORANGE);
		}

		if (batteryLevel < 20)
		{
			field.setColor(Graphics.COLOR_RED);
		}

		field.setText(batteryString);
	}
}
