package ;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;
import openfl.text.Font;

/**
 * ...
 * @author Greg Holkenbrink
 */

class Game extends Sprite {
	static public var elapsed = 0.0;
	static public var frame:Int = 0;
	static public var score:Int = 0;
	static public var nativeWidth:Int = 500;
	static public var nativeHeight:Int = 700;

	static private var _lastframe = 0.0;

	public function new() {
		Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;

		super();
		graphics.beginFill(0x000000);
		graphics.drawRect(0, 0, 500, 700);
		graphics.endFill();

		score = 0;
		initListeners();
	}

	private function initListeners() {
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(e:Event) {
		update();
	}

	private function updateElapsed() {
		var current = Lib.getTimer() / 1000.0;
		elapsed = current - _lastframe;
		_lastframe = current;
	}
	public function update() {
		updateElapsed();
		frame++;
	}
}
