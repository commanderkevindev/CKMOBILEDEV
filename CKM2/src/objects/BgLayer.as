package objects
{
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class BgLayer extends Sprite
	{
		/** Layer identification. */
		private var _layer:int;
		
		/** Primary image. */
		private var image1:Image;
		
		/** Secondary image. */
		private var image2:Image;
		
		/** Parallax depth - used to decide speed of the animation. */
		private var _parallaxDepth:Number;
		
		public function BgLayer(_layer:int)
		{
			super();
			
			this._layer = _layer;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On added to stage.
		 * @param event
		 *
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			if (_layer == 1)
			{
				image1 = new Image(Assets.getTexture("BgLayer" + _layer));
				image1.blendMode = BlendMode.NONE;
				image2 = new Image(Assets.getTexture("BgLayer" + _layer));
				image2.blendMode = BlendMode.NONE;
			}
			else
			{
				image1 = new Image(Assets.getAtlas().getTexture("bgLayer" + _layer));
				image2 = new Image(Assets.getAtlas().getTexture("bgLayer" + _layer));
			}
			
			image1.x = 0;
			image1.y = stage.stageHeight - image1.height;
			
			image2.x = image2.width;
			image2.y = image1.y;
			
			this.addChild(image1);
			this.addChild(image2);
		}
		
		/**
		 * Parallax depth.
		 *
		 */
		public function get parallaxDepth():Number { return _parallaxDepth; }
		public function set parallaxDepth(value:Number):void { _parallaxDepth = value; }
	}
}