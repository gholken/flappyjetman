import openfl.geom.Rectangle;

class EntityPost extends Entity
{
	public function new(startx:Int, starty:Int, w:Int, h:Int) {
		super();
		type = 2;

		x = startx;
		y = starty;
		
		solid = true;
		colRect = new Rectangle(startx, starty, w, h);
	}

	override public function update() {
		x -= 90.0*Game.elapsed;
		if (x < 0 - 120.0) expired = true;
		super.update();
	}	
}