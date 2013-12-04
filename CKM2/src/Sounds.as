package
{
	import flash.media.Sound;
	
	public class Sounds
	{    
		
		//embeds all sounds and music 
		[Embed(source="../media/sounds/bgGame.mp3")]
		public static const SND_BG_GAME:Class;
		
		[Embed(source="../media/sounds/bgWelcome.mp3")]
		public static const SND_BG_MAIN:Class;
		
		[Embed(source="../media/sounds/eat.mp3")]
		public static const SND_EAT:Class;
		
		[Embed(source="../media/sounds/fire.mp3")]
		public static const SND_FIRE:Class;
		
		[Embed(source="../media/sounds/paw.mp3")]
		public static const SND_PAW:Class;
		
		[Embed(source="../media/sounds/hit.mp3")]
		public static const SND_HIT:Class;
		
		[Embed(source="../media/sounds/hurt.mp3")]
		public static const SND_HURT:Class;
		
		[Embed(source="../media/sounds/lose.mp3")]
		public static const SND_LOSE:Class;
		
		/**
		 * Initialized Sound objects.
		 */                
		public static var sndBgMain:Sound = new Sounds.SND_BG_MAIN() as Sound;
		public static var sndBgGame:Sound = new Sounds.SND_BG_GAME() as Sound;
		public static var sndEat:Sound = new Sounds.SND_EAT() as Sound;
		public static var sndFire:Sound = new Sounds.SND_FIRE() as Sound;
		public static var sndPaw:Sound = new Sounds.SND_PAW() as Sound;
		public static var sndHit:Sound = new Sounds.SND_HIT() as Sound;
		public static var sndHurt:Sound = new Sounds.SND_HURT() as Sound;
		public static var sndLose:Sound = new Sounds.SND_LOSE() as Sound;
		/**
		 * Sound mute status.
		 */
		public static var muted:Boolean = false;
	}
}