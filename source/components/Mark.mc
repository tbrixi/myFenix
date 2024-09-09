using Toybox.Application as App;

module Mark
{
	function render(dc)
	{
		var type = App.getApp().getProperty("marksType");

		if (type == 0)
		{
			MarkCarrera.render(dc);
		}

		if (type == 1)
		{
			MarkCarreraNumber.render(dc);
		}

		if (type == 2)
		{
			MarkScuba.render(dc);
		}

		if (type == 3)
		{
			MarkNumbers.render(dc);
		}
	}
}