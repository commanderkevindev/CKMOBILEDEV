package objects
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	
	public class Obstacle extends Sprite
	{
		private var _type:int;
		private var _speed:int;
		private var _distance:int;
		private var _showIncoming:Boolean;
		private var _alreadyHit:Boolean;
		private var _position:String;
		private var _hitArea:Image;
		private var obstacleImage:Image;
		private var obstacleAnimation:MovieClip;
		private var obstacleCrashImage:Image;
		private var incomingAnimation:MovieClip;
		
		public function Obstacle(_type:int, _distance:int, _incoming:Boolean = true, _speed:int = 0)
		{
			super();
			
			this.type = _type;
			this._distance = _distance;
			this._showIncoming = _incoming;
			this._speed = _speed;
			
			_alreadyHit = false;
		}
		
		/**
		 * Create the art of the obstacle based on - animation/image and new/reused object.
		 *
		 */
		private function createObstacleArt():void
		{
			// Animated obstacle.
			if (_type == GameConstants.OBSTACLE_TYPE_4)
			{
				// If this is the first time the object is being used.
				if (obstacleAnimation == null)
				{
					obstacleAnimation = new MovieClip(Assets.getAtlas().getTextures("obstacle" + _type + "_0"), 10);
					this.addChild(obstacleAnimation);
					Starling.juggler.add(obstacleAnimation);
				}
				else
				{
					// If this object is being reused. (Last time also this object was an animation).
					obstacleAnimation.visible = true;
					Starling.juggler.add(obstacleAnimation);
				}
				
				obstacleAnimation.x = 0;
				obstacleAnimation.y = 0;
			}
			else
			{
				// Static obstacle.
				
				// If this is the first time the object is being used.
				if (obstacleImage == null)
				{
					obstacleImage = new Image(Assets.getAtlas().getTexture("obstacle" + _type));
					this.addChild(obstacleImage);
				}
				else
				{
					// If this object is being reused.
					obstacleImage.texture = Assets.getAtlas().getTexture("obstacle" + _type);
					obstacleImage.visible = true;
				}
				
				obstacleImage.readjustSize();
				obstacleImage.x = 0;
				obstacleImage.y = 0;
			}
		}
		
		private function createObstacleCrashArt():void
		{
			if (obstacleCrashImage == null)
			{
				// If this is the first time the object is being used.
				obstacleCrashImage = new Image(Assets.getAtlas().getTexture(("obstacle" + _type + "_crash")));
				this.addChild(obstacleCrashImage);
			}
			else
			{
				// If this object is being reused.
				obstacleCrashImage.texture = Assets.getAtlas().getTexture("obstacle" + _type + "_crash");
			}
			
			// Hide the crash image by default.
			obstacleCrashImage.visible = false;
		}
		
		private function createIncomingAnimation():void
		{
			if (incomingAnimation == null)
			{
				// If this is the first time the object is being used.
				incomingAnimation = new MovieClip(Assets.getAtlas().getTextures("incoming_"), 10);
				this.addChild(incomingAnimation);
				Starling.juggler.add(incomingAnimation);
			}
			else
			{
				// If this object is being reused.
				incomingAnimation.visible = true;
				Starling.juggler.add(incomingAnimation);
			}
			
			// Reset the positioning of look-out animation based on the new obstacle type.
			if (_type == GameConstants.OBSTACLE_TYPE_4)
			{
				incomingAnimation.x = -incomingAnimation.texture.width;
				incomingAnimation.y = obstacleAnimation.y + (obstacleAnimation.texture.height * 0.5) - (obstacleAnimation.texture.height * 0.5);
			}
			else
			{
				incomingAnimation.x = -incomingAnimation.texture.width;
				incomingAnimation.y = obstacleImage.y + (obstacleImage.texture.height * 0.5) - (incomingAnimation.texture.height * 0.5);
			}
			
			incomingAnimation.visible = false;
		}
		
		private function hidePreviousInstance():void
		{
			// If this item is being reused and was an animation the last time, remove it from juggler.
			// Only don't remove it if it is an animation this time as well.
			if (obstacleAnimation != null && _type != GameConstants.OBSTACLE_TYPE_4)
			{
				obstacleAnimation.visible = false;
				Starling.juggler.remove(obstacleAnimation);
			}
			
			// If this item is being reused and was an image the last time, hide it.
			if (obstacleImage != null) obstacleImage.visible = false;
		}
		
		public function get type():int { return _type; }
		public function set type(value:int):void {
			_type = value;
			
			resetForReuse();
			
			// If reusing, hide previous animation/image, based on what is necessary this time.
			hidePreviousInstance();
			
			// Create Obstacle Art.
			createObstacleArt();
			
			// Create the Crash Art.
			createObstacleCrashArt();
			
			// Create Incoming animation.
			createIncomingAnimation();
		}
		
		/**
		 * Look out sign status.
		 *
		 */
		public function get incoming():Boolean { return _showIncoming; }
		public function set incoming(value:Boolean):void
		{
			_showIncoming = value;
			
			if (incomingAnimation)
			{
				if (value)
				{
					incomingAnimation.visible = true;
				}
				else
				{
					incomingAnimation.visible = false;
					Starling.juggler.remove(incomingAnimation);
				}
			}
		}
		
		/**
		 * Has the hero collided with the obstacle?
		 *
		 */
		public function get alreadyHit():Boolean { return _alreadyHit; }
		public function set alreadyHit(value:Boolean):void
		{
			_alreadyHit = value;
			
			if (value)
			{
				obstacleCrashImage.visible = true;
				if (_type == GameConstants.OBSTACLE_TYPE_4)
				{
					obstacleAnimation.visible = false;
				}
				else
				{
					obstacleImage.visible = false;
					Starling.juggler.remove(obstacleAnimation);
				}
			}
		}
		
		/**
		 * Speed of the obstacle.
		 *
		 */
		public function get speed():int { return _speed; }
		public function set speed(value:int):void { _speed = value; }
		
		/**
		 * Distance after which the obstacle should appear on screen.
		 *
		 */
		public function get distance():int { return _distance; }
		public function set distance(value:int):void { _distance = value; }
		
		/**
		 * Vertical position of the obstacle.
		 *
		 */
		public function get position():String { return _position; }
		public function set position(value:String):void { _position = value; }
		
		public function get hitArea():Image { return _hitArea; }
		
		/**
		 * Width of the texture that defines the image of this Sprite.
		 */
		override public function get width():Number {
			if (obstacleImage) return obstacleImage.texture.width;
			else return 0;
		}
		
		/**
		 * Height of the texture that defines the image of this Sprite.
		 */
		override public function get height():Number
		{
			if (obstacleImage) return obstacleImage.texture.height;
			else return 0;
		}
		
		/**
		 * Reset the obstacle object for reuse.
		 *
		 */
		public function resetForReuse():void
		{
			this.alreadyHit = false;
			this.incoming = true;
			this.rotation = deg2rad(0);
		}
	}
}