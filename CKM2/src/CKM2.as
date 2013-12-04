package
{
	import flash.desktop.NativeApplication;
	import flash.desktop.SystemIdleMode;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.*;
	import flash.system.Capabilities;
	import flash.system.System;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import net.hires.debug.Stats;
	
	import screens.InGame;
	
	Starling.handleLostContext = true;
	
	import starling.display.Stage;
	import starling.core.Starling;
	import starling.events.ResizeEvent;
	
	
	[SWF(frameRate="60", width="1280", height="720", backGroundColor="0x333333")]
	
	public class CKM2 extends Sprite
	{
		private var stats:Stats;
		private var myStarling:Starling;
		
		public function CKM2()
		{
			super();
			stats=new Stats;
			this.addChild(stats);
			
			// scaling top left
			stage.align = StageAlign.TOP_LEFT;
			// no scaling
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = 1280;
			viewPortRectangle.height = 720;
			
			// create Starling instance
			var myStarling:Starling = new Starling(Game, stage, viewPortRectangle);
			myStarling.antiAliasing = 1;
			myStarling.start();
			stage.addEventListener(ResizeEvent.RESIZE, resizeStage);
			stage.addEventListener(KeyboardEvent.KEY_UP, fl_OptionsMenuHandler, false, 0, true);
		}
					
		private function resizeStage(event:Event):void
		{
			var viewPortRectangle:Rectangle = new Rectangle();
			viewPortRectangle.width = stage.stageWidth;
			viewPortRectangle.height = stage.stageHeight;
			Starling.current.viewPort = viewPortRectangle;
		}
		private function fl_OptionsMenuHandler(e:KeyboardEvent):void
		{
			if(e.keyCode == Keyboard.BACK)	{
				NativeApplication.nativeApplication.exit(0);
			}
		}
	}
}