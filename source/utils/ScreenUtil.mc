module ScreenUtil
{
	var screenWidth;
	var screenHeight;
	var screenPercent;
	var centerX;
	var centerY;

	function init(dc)
	{
		screenWidth = dc.getWidth();
		screenHeight = dc.getHeight();

		centerX = screenWidth / 2;
		centerY = screenHeight / 2;

		screenPercent = screenWidth.toFloat() / 100;
	}

	function getResolution()
	{
		return [screenWidth, screenHeight];
	}
}
