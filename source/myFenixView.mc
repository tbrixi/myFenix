import Toybox.ActivityMonitor;
import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class MyFenixView extends WatchUi.WatchFace {
	private var sleepMode = true;

	function initialize() {
		WatchFace.initialize();
	}

	function onLayout(dc) {
		ScreenUtil.init(dc);
		setLayout(Rez.Layouts.WatchFace(dc));
	}

	function onShow() {}

	function onHide() {}

	function onExitSleep() {
		sleepMode = false;
	}

	function onEnterSleep() {
		sleepMode = true;
		WatchUi.requestUpdate();
	}

	function onUpdate(dc) {
		View.onUpdate(dc);

		renderRoundedRect(dc);

		renderAlarm(dc);
		renderBluettoth(dc);
		renderBatery();
		renderNotification(dc);

		renderDate();

		renderSteps(dc);
		renderDistance(dc);
		renderAltitude(dc);
		renderFieldHR(dc);

		renderTime();

		Mark.render(dc);
		Hand.renderHands(dc, sleepMode);
	}

	function renderAlarm(dc) as Void {
		(new Alarm()).render(dc);
	}

	function renderBluettoth(dc) as Void {
		(new Bluetooth()).render(dc);
	}

	function renderNotification(dc) as Void {
		(new Notification()).render(dc);
	}

	function renderBatery() as Void {
		var field = View.findDrawableById("fieldBatery") as WatchUi.Text;
		(new Battery()).render(field);
	}

	function renderDate() as Void {
		var field = View.findDrawableById("fieldDate") as WatchUi.Text;
		(new Date()).render(field);
	}

	function renderTime() as Void {
		var field = View.findDrawableById("fieldTime") as WatchUi.Text;
		(new Digitime()).render(field, sleepMode);
	}

	function renderRoundedRect(dc) as Void {
		dc.setColor(Graphics.COLOR_DK_GRAY, Graphics.COLOR_TRANSPARENT);
		dc.drawRoundedRectangle(49, 58, 120, 30, 4);
		dc.drawRoundedRectangle(49, 130, 120, 30, 4);
	}

	function renderSteps(dc) {
		var fieldColor = Application.getApp().getProperty("stepsColor");
		if (fieldColor != -1) {
			(new Step()).render(dc, fieldColor);
		}
	}

	function renderDistance(dc) {
		var fieldColor = Application.getApp().getProperty("distanceColor");
		if (fieldColor != -1) {
			(new Distance()).render(dc, fieldColor);
		}
	}

	function renderAltitude(dc) {
		var fieldColor = Application.getApp().getProperty("altitudeColor");
		if (fieldColor != -1) {
			(new Altitude()).render(dc, fieldColor);
		}
	}

	function renderFieldHR(dc) {
		var fieldColor = Application.getApp().getProperty("fieldHRColor");
		if (fieldColor != -1) {
			(new Hr()).render(dc, fieldColor);
		}
	}
}
