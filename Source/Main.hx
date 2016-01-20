package;

import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Lib;

class Main extends Game {

	static public var state:Group;
	static public var input:Input;

	public function new () {
		super ();
		addEventListener(Event.ADDED_TO_STAGE, onAdd);
	}

	public function onAdd(e:Event) {
		input = new Input();
		state = new StateMenu();
	}

	override public function update() {
		super.update();

		state.update();
	}

}
