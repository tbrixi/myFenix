import Toybox.Application;
import Toybox.Lang;


//  Util.getValue("");
module Util
{
	function getValue(name as String) {
		return Application.getApp().getProperty(name);
	}
}
