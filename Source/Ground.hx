package ;

import openfl.Assets;

/**
 * ...
 * @author Greg Holkenbrink
 */
class Ground extends Entity {
	var moving:Bool;

	public function new(start:Bool = true) {
		super();
		graphics.beginBitmapFill(Assets.getBitmapData("assets/ground.png"), false);
		graphics.drawRect(0, 0, 1024, 64);
		graphics.endFill();
		x = 0;
		y = 700 - 64;
		moving = start;
		solid = true;
		colRect = getRect(this);
	}

	public function stop() {
		moving = false;
	}

	public function start() {
		moving = true;
	}

	override public function update() {
		if(moving) {
			x -= 90.0 * Game.elapsed;
			if (x < -499.0) x = 0;
		}
		super.update();
	}
}
