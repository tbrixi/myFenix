import Toybox.Graphics;
class Mark {
	function render(dc as Dc) {
		var type = Util.getValue("marksType");

		switch (type) {
			case 0:
				(new MarkCarreraNumber()).render(dc);
				break;
			case 1:
				(new MarkCarrera()).render(dc);
				break;
			case 2:
				(new MarkNumbers()).render(dc);
				break;
			default:
				break;
		}
	}
}
