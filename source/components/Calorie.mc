import Toybox.ActivityMonitor;
import Toybox.Lang;

class Calorie
{
	public function render(dc, field) as Void
	{
		var calories = ActivityMonitor.getInfo().calories;
		if (calories > 0)
		{
			var caloriesString = Lang.format("$1$kC", [calories.format("%01d")]);
			field.setText(caloriesString);
		}
	}
}
