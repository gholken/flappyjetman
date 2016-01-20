package ;
import openfl.display.Sprite;
import openfl.Lib;

/**
 * ...
 * @author Greg Holkenbrink
 */
class Group extends Entity {

	public var list:Array<Entity>;

	public function new() {
		super();
		list = new Array<Entity>();
		Lib.current.stage.addChild(this);
		#if mobile
		//rescale
		this.scaleX = Lib.current.stage.stageWidth / Game.nativeWidth;
		this.scaleY = this.scaleX;
		this.y = (Lib.current.stage.stageHeight - (Game.nativeHeight * this.scaleX)) / 2;
		#end
	}

	public function add(e:Entity) {
		list.push(e);
		addChild(e);
	}

	public function addAt(e:Entity, index:Int) {
		list.push(e);
		addChildAt(e, index);
	}

	public function remove(e:Entity) {
		list.remove(e);
		removeChild(e);
	}

	public function removeFromStage() {
		Lib.current.stage.removeChild(this);
	}

	public function hide() {
		visible = false;
	}

	override public function update() {
		super.update();
		var c = list.length;
		while ( c-- > 0 ) {
			var e = list[c];
			e.update();
			if (e.expired) {
				remove(e);
			}//end if
		}//end while (c-- > 0)
	}
}
