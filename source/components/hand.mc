using Toybox.Application as App;

module Hand
{
	function renderHands(dc, sleepMode)
	{
		HandSword.render(dc, sleepMode, false);
	}
}