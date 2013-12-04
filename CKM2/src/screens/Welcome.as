package screens
{
	import com.greensock.TweenLite;
	import events.NavigationEvent;
	import customObjects.Font;
	
	import flash.media.SoundMixer;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	
	public class Welcome extends Sprite
	{
		/** Background image. */
		private var bg:Image;
		
		/** Game title. */
		private var title:Image;
		
		/** Play button. */
		private var playBtn:Button;
		
		/** About button. */
		private var aboutBtn:Button;
		
		/** Kevin artwork. */
		private var kevin:Image;
		
		/** About text field. */
		private var aboutText:TextField;
		
		/** Starling Framework button. */
		private var starlingBtn:Button;
		
		/** Back button. */
		private var backBtn:Button;
		
		/** Screen mode - "welcome" or "about". */
		private var screenMode:String;
		
		/** Current date. */
		private var _currentDate:Date;
		
		/** Font - Regular text. */
		private var fontRegular:Font;
		
		/** Kevin art tween object. */
		private var tween_kevin:Tween;
		
		public function Welcome()
		{
			super();
			this.visible = false;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			drawScreen();			
		}
		
		private function drawScreen():void
		{
			//General elements
			
			bg = new Image(Assets.getTexture("BgWelcome"));
			bg.blendMode = BlendMode.NONE;
			this.addChild(bg);
			
			title = new Image(Assets.getAtlas().getTexture(("welcome_title")));
			title.x = 531;
			title.y = 75;
			this.addChild(title);
			
			//Welcome Elements
			
			kevin = new Image(Assets.getAtlas().getTexture("welcome_kevin"));
			kevin.x = -kevin.width;
			kevin.y = 100;
			this.addChild(kevin);
			
			playBtn = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
			playBtn.x = 600;
			playBtn.y = 475;
			playBtn.addEventListener(Event.TRIGGERED, onPlayClick);
			this.addChild(playBtn);
			
			aboutBtn = new Button(Assets.getAtlas().getTexture("welcome_aboutButton"));
			aboutBtn.x = 925;
			aboutBtn.y = 475;
			aboutBtn.addEventListener(Event.TRIGGERED, onAboutClick);
			this.addChild(aboutBtn);
			
			//ABOUT Elements
			fontRegular = Fonts.getFont("Regular");
			
			aboutText = new TextField(480, 700, "", fontRegular.fontName, fontRegular.fontSize, 0xffffff);
			aboutText.text = "Commander Kevin is a game built with Adobe Flashbuilder using Starling Framework.\n\nhttp://www.commanderkevin.com\n\n" +
				" Kevin is doing his best to get home, the food floating in space helps fuel his spaceship" +
				" You score when Kevin eats collectables.\n\nThere are different obstacles that fly in with a \"Incoming!\"" +
				" caution before they appear. Avoid the aliens! You only have 5 lives. Do your best!";
				//" \n\ Music BY: Cameron Hagan";
				
			aboutText.x = 60;
			aboutText.y = 130;
			aboutText.hAlign = HAlign.CENTER;
			aboutText.vAlign = VAlign.TOP;
			aboutText.height = aboutText.textBounds.height + 30;
			this.addChild(aboutText);
						
			//About buttons - Starling Logo
			starlingBtn = new Button(Assets.getAtlas().getTexture("about_starlingLogo"));
			starlingBtn.x = aboutText.bounds.right - starlingBtn.width;
			starlingBtn.y = aboutText.bounds.bottom;
			starlingBtn.addEventListener(Event.TRIGGERED, onStarlingBtnClick);
			this.addChild(starlingBtn);
			
			//About buttons - Back
			backBtn = new Button(Assets.getAtlas().getTexture("about_backButton"));
			backBtn.x = 660;
			backBtn.y = 475;
			backBtn.addEventListener(Event.TRIGGERED, onAboutBackClick);
			this.addChild(backBtn);
		}
		
		private function onAboutBackClick(event:Event):void
		{
			if (!Sounds.muted) Sounds.sndPaw.play();
			
			initialize();
		}
		
	
		/**
		 * On credits click on Starling Framework image.
		 * @param event
		 *
		 */
		private function onStarlingBtnClick(event:Event):void
		{
			navigateToURL(new URLRequest("http://www.gamua.com/starling"), "_blank");
		}
		
		/**
		 * On play button click.
		 * @param event
		 *
		 */
		private function onPlayClick(event:Event):void
		{
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
			
			if (!Sounds.muted) Sounds.sndEat.play();
		}
		
		/**
		 * On about button click.
		 * @param event
		 *
		 */
		private function onAboutClick(event:Event):void
		{
			if (!Sounds.muted) Sounds.sndPaw.play();
			showAbout();
		}
		
		/**
		 * Show about screen.
		 *
		 */
		public function showAbout():void
		{
			screenMode = "about";
			
			kevin.visible = false;
			playBtn.visible = false;
			aboutBtn.visible = false;
			
			aboutText.visible = true;
			starlingBtn.visible = true;
			backBtn.visible = true;
		}
				
		/**
		 * Initialize welcome screen.
		 *
		 */
		public function initialize():void
		{
			disposeTemporarily();
			
			this.visible = true;
			
			// If not coming from about, restart playing background music.
			if (screenMode != "about")
			{
				if (!Sounds.muted) Sounds.sndBgMain.play(0, 999);
			}
			
			screenMode = "welcome";
			
			kevin.visible = true;
			playBtn.visible = true;
			aboutBtn.visible = true;
			
			aboutText.visible = false;
			starlingBtn.visible = false;
			backBtn.visible = false;
			
			kevin.x = -kevin.width;
			kevin.y = 100;
			
			tween_kevin = new Tween(kevin, 4, Transitions.EASE_OUT);
			tween_kevin.animate("x", 80);
			Starling.juggler.add(tween_kevin);
			
			this.addEventListener(Event.ENTER_FRAME, kevinAnimation);
		}
		
		/**
		 * Animate floating objects.
		 * @param event
		 *
		 */
		private function kevinAnimation(event:Event):void
		{
			var currentDate:Date = new Date();
			kevin.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			playBtn.x = 600 + (Math.cos(currentDate.getTime() * 0.002) * 10);
			aboutBtn.x = 925 + (Math.cos(currentDate.getTime() * 0.002) * 10);
		}
		/**
		 * Dispose objects temporarily.
		 *
		 */
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, kevinAnimation);
			
			if (screenMode != "about") SoundMixer.stopAll();
		}
	}
}	
	