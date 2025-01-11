import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Math;
import Toybox.System;

class HandSword
{
	var clockTime;
	var clockHour;
	var clockMin;
	var clockSec;

	var hourLength = 28 * ScreenUtil.screenPercent;
	var hourWidth = 4 * ScreenUtil.screenPercent;

	var minuteLength = 38 * ScreenUtil.screenPercent;
	var minuteWidth = 4 * ScreenUtil.screenPercent;

	var secondLength = 45 * ScreenUtil.screenPercent;
	var secondWidth = 3 * ScreenUtil.screenPercent;

	function render(dc as Dc, sleepMode as Boolean, filled as Boolean) {
		clockTime = System.getClockTime();
		clockHour = clockTime.hour;
		clockMin = clockTime.min;
		clockSec = clockTime.sec;

		renderHourHand(dc, filled);
		renderMinuteHand(dc, filled);

		if (!sleepMode) {
			renderSecondHand(dc);
		}

		renderCircle(dc);
	}

	function renderHourHand(dc, filled) {
		var hour = (clockHour % 12) * 60 + clockMin;
		hour = hour / (12 * 60.0);
		hour = hour * Math.PI * 2;

		if (filled) {
			dc.setColor(Util.getValue("analogTimeColor"), Graphics.COLOR_TRANSPARENT);
			renderFilledHand(dc, hour, hourLength, hourWidth);

			dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
		} else {
			dc.setColor(Util.getValue("analogTimeColor"), Graphics.COLOR_TRANSPARENT);
		}

		renderOutlineHand(dc, hour, hourLength, hourWidth);
	}

	function renderMinuteHand(dc, filled) {
		var min = (clockMin / 60.0) * Math.PI * 2;

		if (filled) {
			dc.setColor(Util.getValue("analogTimeColor"), Graphics.COLOR_TRANSPARENT);
			renderFilledHand(dc, min, minuteLength, minuteWidth);

			dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
		} else {
			dc.setColor(Util.getValue("analogTimeColor"), Graphics.COLOR_TRANSPARENT);
		}

		renderOutlineHand(dc, min, minuteLength, minuteWidth);
	}

	function renderSecondHand(dc) {
		var sec = (clockSec / 60.0) * Math.PI * 2;
		dc.setColor(Graphics.COLOR_RED, Graphics.COLOR_TRANSPARENT);
		renderFilledHand(dc, sec, secondLength, secondWidth);
	}

	function renderCircle(dc) {
		dc.setColor(Graphics.COLOR_LT_GRAY, Graphics.COLOR_TRANSPARENT);
		dc.fillCircle(ScreenUtil.centerX, ScreenUtil.centerY, 10);
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
		dc.fillCircle(ScreenUtil.centerX, ScreenUtil.centerY, 8);
		dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
		dc.fillCircle(ScreenUtil.centerX, ScreenUtil.centerY, 2);
	}

	function renderFilledHand(dc, rad, length, width) {
		var poligonArrLen = 6;
		var poligon = new Array<Array>[poligonArrLen];
		poligon[0] = [0, 0];
		poligon[1] = [width / 2, 0];
		poligon[2] = [width, -length * 0.8];
		poligon[3] = [0, -length];
		poligon[4] = [-width, -length * 0.8];
		poligon[5] = [-width / 2, 0];

		for (var i = 0; i < poligonArrLen; i += 1) {
			poligon[i] = transform(rad, poligon[i][0], poligon[i][1]);
		}

		dc.fillPolygon(poligon);
	}

	function renderOutlineHand(dc, rad, length, width) {
		var poligonArrLen = 7;
		var poligon = new Array<Array>[poligonArrLen];
		poligon[0] = [0, 0];
		poligon[1] = [width / 2, 0];
		poligon[2] = [width, -length * 0.8];
		poligon[3] = [0, -length, -width];
		poligon[4] = [-width, -length * 0.8];
		poligon[5] = [-width / 2, 0];
		poligon[6] = [0, 0];

		for (var i = 0; i < poligonArrLen; i += 1) {
			poligon[i] = transform(rad, poligon[i][0], poligon[i][1]);
		}

		dc.setPenWidth(3);

		for (var i = 1; i < poligonArrLen; i += 1) {
			var x1 = poligon[i - 1][0];
			var y1 = poligon[i - 1][1];
			var x2 = poligon[i][0];
			var y2 = poligon[i][1];

			dc.drawLine(x1, y1, x2, y2);
		}
	}

	function transform(alfa, x, y) {
		var newX = ScreenUtil.centerX + x * Math.cos(alfa) - y * Math.sin(alfa);
		var newY = ScreenUtil.centerY + x * Math.sin(alfa) + y * Math.cos(alfa);
		return [newX, newY];
	}
}
