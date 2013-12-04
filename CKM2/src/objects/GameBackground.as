package objects
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class GameBackground extends Sprite
	{
		private var bgLayer1:BgLayer;
		private var bgLayer2:BgLayer;
		private var bgLayer3:BgLayer;
		private var bgLayer4:BgLayer;
		
		private var _speed:Number = 0;
		private var _state:int;
		private var _gamePaused:Boolean = false;
		
		
		public function GameBackground()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			bgLayer1 = new BgLayer(1);
			bgLayer1.parallaxDepth = 0.00;
			this.addChild(bgLayer1);
			
			bgLayer2 = new BgLayer(2);
			bgLayer2.parallaxDepth = 0.002;
			this.addChild(bgLayer2);
			
			bgLayer3 = new BgLayer(3);
			bgLayer3.parallaxDepth = 0.3;
			this.addChild(bgLayer3);
			
			bgLayer4 = new BgLayer(4);
			bgLayer4.parallaxDepth = 0.9;
			this.addChild(bgLayer4);
			
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event:Event):void
		{
			if (!gamePaused)
			{
				// Background 1 - Sky
				bgLayer1.x -= Math.ceil(_speed * bgLayer1.parallaxDepth);
				// Kevin flying left
				if (bgLayer1.x > 0) bgLayer1.x = -stage.stageWidth;
				// Kevin flying right
				if (bgLayer1.x < -stage.stageWidth ) bgLayer1.x = 0;
				
				// Background 2 - stars
				bgLayer2.x -= Math.ceil(_speed * bgLayer2.parallaxDepth);
				// Kevin flying left
				if (bgLayer2.x > 0) bgLayer2.x = -stage.stageWidth;
				// Kevin flying right
				if (bgLayer2.x < -stage.stageWidth ) bgLayer2.x = 0;
				
				// Background 3 - Mountains
				bgLayer3.x -= Math.ceil(_speed * bgLayer3.parallaxDepth);
				// Kevin flying left
				if (bgLayer3.x > 0) bgLayer3.x = -stage.stageWidth;
				// Kevin flying right
				if (bgLayer3.x < -stage.stageWidth ) bgLayer3.x = 0;
				
				// Background 4 - Rocks
				bgLayer4.x -= Math.ceil(_speed * bgLayer4.parallaxDepth);
				// Kevin flying left
				if (bgLayer4.x > 0) bgLayer4.x = -stage.stageWidth;
				// Kevin flying right
				if (bgLayer4.x < -stage.stageWidth ) bgLayer4.x = 0;
			}
		}
		
		/**
		 * Game paused?
		 * @return
		 *
		 */
		public function get gamePaused():Boolean { return _gamePaused; }
		public function set gamePaused(value:Boolean):void { _gamePaused = value; }
		
		/**
		 *
		 * State of the game.
		 *
		 */
		public function get state():int { return _state; }
		public function set state(value:int):void { _state = value; }
		
		/**
		 * Speed of the hero.
		 *
		 */
		public function get speed():Number { return _speed; }
		public function set speed(value:Number):void { _speed = value; }
	}
}