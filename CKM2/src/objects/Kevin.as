package objects
{
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Kevin extends Sprite
	{
		private var kevinArt:MovieClip;
		private var _state:int;
		
		public function Kevin()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			this.state = GameConstants.GAME_STATE_IDLE;
			
			createKevinArt();	
		}
		
		private function createKevinArt():void
		{
			kevinArt = new MovieClip(Assets.getAtlas().getTextures("kevin_"), 15);
			kevinArt.x = Math.ceil(-kevinArt.width/2);
			kevinArt.y = Math.ceil(-kevinArt.height/2);
			starling.core.Starling.juggler.add(kevinArt);
			this.addChild(kevinArt);
		}
		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }
		
		/**
		 * Set hero animation speed.
		 * @param speed
		 *
		 */
		public function setKevinAnimationSpeed(speed:int):void {
			if (speed == 0) kevinArt.fps = 20;
			else kevinArt.fps = 60;
		}
		
		override public function get width():Number
		{
			if (kevinArt) return kevinArt.texture.width;
			else return NaN;
		}
		
		override public function get height():Number
		{
			if (kevinArt) return kevinArt.texture.height;
			else return NaN;
		}
	}
}