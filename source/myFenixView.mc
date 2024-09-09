using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;
using Toybox.System as Sys;
using Toybox.Lang as Lang;
using Toybox.ActivityMonitor as ActivityMonitor;
using Toybox.Application as App;

class MyFenixView extends Ui.WatchFace
{
	var sleepMode = true;

	function initialize() {
		WatchFace.initialize();
	}

	function onLayout(dc) {
		ScreenUtil.init(dc);
		setLayout(Rez.Layouts.WatchFace(dc));
	}

	function onShow()
	{
	}

	function onHide()
	{
	}

	function onExitSleep()
	{
		sleepMode = false;
	}

	function onEnterSleep()
	{
		sleepMode = true;
	}

	function onUpdate(dc) {
		View.onUpdate(dc);

		Battery.render(dc);
		Date.render(dc);
		Digitime.render(dc, sleepMode);

		renderField1(dc);
		renderField2(dc);
		renderField3(dc);
		renderFieldHR(dc);

		Mark.render(dc);
		Notification.renderConnection(dc);
		Notification.renderAlarm(dc);
		Notification.renderNotification(dc);

		Hand.renderHands(dc, sleepMode);
	}

	function renderField1(dc)
	{
		var x;
		var y;
		var fieldType = App.getApp().getProperty("field1");
		var fieldColor = App.getApp().getProperty("field1Color");

		if (fieldType == 1)
		{
			x = 33;
			y = 45;
			Altitude.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 2)
		{
			x = 30;
			y = 45;
			Calorie.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 3)
		{
			x = 30;
			y = 45;
			Distance.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 4)
		{
			x = 35;
			y = 45;
			Hr.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 5)
		{
			x = 32;
			y = 45;
			Step.render(dc, x, y, fieldColor, true);
		}
	}

	function renderField2(dc)
	{
		var x;
		var y;
		var fieldType = App.getApp().getProperty("field2");
		var fieldColor = App.getApp().getProperty("field2Color");

		if (fieldType == 1)
		{
			x = 74;
			y = 45;
			Altitude.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 2)
		{
			x = 73;
			y = 45;
			Calorie.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 3)
		{
			x = 72;
			y = 45;
			Distance.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 4)
		{
			x = 75;
			y = 45;
			Hr.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 5)
		{
			x = 76;
			y = 45;
			Step.render(dc, x, y, fieldColor, true);
		}
	}

	function renderField3(dc)
	{
		var x;
		var y;
		var fieldType = App.getApp().getProperty("field3");
		var fieldColor = App.getApp().getProperty("field3Color");

		if (fieldType == 1)
		{
			x = 50;
			y = 74;
			Altitude.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 2)
		{
			x = 50;
			y = 75;
			Calorie.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 3)
		{
			x = 50;
			y = 75;
			Distance.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 4)
		{
			x = 53;
			y = 75;
			Hr.render(dc, x, y, fieldColor);
		}

		else if (fieldType == 5)
		{
			x = 50;
			y = 74;
			Step.render(dc, x, y, fieldColor, true);
		}
	}

	function renderFieldHR(dc)
	{
		var fieldColor = App.getApp().getProperty("fieldHRColor");
		if (fieldColor != -1)
		{
			var x = 92;
			var y = 57;
			Hr.render(dc, x, y, fieldColor);
		}
	}
}
