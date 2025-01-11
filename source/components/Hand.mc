import Toybox.Graphics;
class Hand
{
	function renderHands(dc as Dc, sleepMode)
	{
		var type = Util.getValue("handsType");

		switch (type)
		{
			case 0:
				new HandSword().render(dc, sleepMode, false);
				break;
			case 1:
				new HandSword().render(dc, sleepMode, true);
				break;
			case 2:
				new HandStealth().render(dc, sleepMode, true);
				break;
			default:
				break;
		}
	}
}
