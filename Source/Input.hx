package ;

import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.events.KeyboardEvent;
import openfl.Lib;

/**
 * ...
 * @author Greg Holkenbrink
 */
class Input
{
	public var mx:Float;
	public var my:Float;
	
	public function new() {
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		Lib.current.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}
	
	private function onEnterFrame(e:Event) {
		mx = Lib.current.stage.mouseX;
		my = Lib.current.stage.mouseY;
	}
	
	private function onMouseDown(e:Event) {
		onClick();
	}
	
	private function onMouseUp(e:Event) {
		
	}
	
	public dynamic function onClick() { }
	
	
}