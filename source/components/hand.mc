using Toybox.Application as App;

module Hand
{
	function renderHands(dc, sleepMode)
	{
		var type = App.getApp().getProperty("handsType");

		if (type == 0)
		{
			HandStick.render(dc, sleepMode);
		}

		if (type == 1)
		{
			HandSword.render(dc, sleepMode, false);
		}

		if (type == 2)
		{
			HandSword.render(dc, sleepMode, true);
		}

		if (type == 3)
		{
			HandStealth.render(dc, sleepMode, true);
		}
	}
}