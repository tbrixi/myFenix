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
		renderBatery(dc);
		renderNotification(dc);

		renderDate(dc);

		renderSteps(dc);
		renderDistance(dc);
		renderAltitude(dc);
		renderFieldHR(dc);

		renderTime(dc);

		(new Mark()).render(dc as Dc);
		(new Hand()).renderHands(dc, sleepMode);
	}

	function renderAlarm(dc) as Void {
		(new Alarm()).render(dc as Dc);
	}

	function renderBluettoth(dc) as Void {
		(new Bluetooth()).render(dc as Dc);
	}

	function renderNotification(dc) as Void {
		(new Notification()).render(dc as Dc);
	}

	function renderBatery(dc) as Void {
		(new Battery()).render(dc as Dc);
	}

	function renderDate(dc) as Void {
		(new Date()).render(dc as Dc);
	}

	function renderTime(dc) as Void {
		(new Digitime()).render(dc, sleepMode);
	}

	function renderRoundedRect(dc) as Void {
		(new Rect()).render(dc as Dc);
	}

	function renderSteps(dc) {
		var fieldColor = Util.getValue("stepsColor");
		if (fieldColor != -1) {
			(new Step()).render(dc, fieldColor);
		}
	}

	function renderDistance(dc) {
		var fieldColor = Util.getValue("distanceColor");
		if (fieldColor != -1) {
			(new Distance()).render(dc, fieldColor);
		}
	}

	function renderAltitude(dc) {
		var fieldColor = Util.getValue("altitudeColor");
		if (fieldColor != -1) {
			(new Altitude()).render(dc, fieldColor);
		}
	}

	function renderFieldHR(dc) {
		var fieldColor = Util.getValue("hrColor");
		if (fieldColor != -1) {
			(new Hr()).render(dc, fieldColor);
		}
	}
}
