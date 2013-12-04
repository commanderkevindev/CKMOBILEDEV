package
{
	public class GameConstants
	{
		// Player's states - what is the player doing? -------------
		
		public static const GAME_STATE_IDLE:int = 0;
		public static const GAME_STATE_FLYING:int = 1;
		public static const GAME_STATE_OVER:int = 2;
		
		// Kevin's graphic states - what is the position/animation of kevin?
		
		public static const KEVIN_STATE_IDLE:int = 0;
		public static const KEVIN_STATE_FLYING:int = 1;
		public static const KEVIN_STATE_HIT:int = 2;
		public static const KEVIN_STATE_FALL:int = 3;
		
		// Food item types -----------------------------------------
		
		public static const ITEM_TYPE_1:int = 1;
		public static const ITEM_TYPE_2:int = 2;
		public static const ITEM_TYPE_3:int = 3;
		public static const ITEM_TYPE_4:int = 4;
		public static const ITEM_TYPE_5:int = 5;
		
		/** Special Item - paw. */
		public static const ITEM_TYPE_PAW:int = 6;
		
		/** Special Item - fire. */
		public static const ITEM_TYPE_FIRE:int = 7;
		
		// Obstacle types ------------------------------------------
		
		/** Obstacle - ship 1. */
		public static const OBSTACLE_TYPE_1:int = 1;
		
		/** Obstacle - ship 2. */                
		public static const OBSTACLE_TYPE_2:int = 2;
		
		/** Obstacle - ship 3. */
		public static const OBSTACLE_TYPE_3:int = 3;
		
		/** Obstacle - ship 4. */
		public static const OBSTACLE_TYPE_4:int = 4;
		
		// Particle types ------------------------------------------
		
		/** Particle - Sparkle. */                
		public static const PARTICLE_TYPE_1:int = 1;
		
		/** Particle - Wind Force. */                
		public static const PARTICLE_TYPE_2:int = 2;
		
		// Kevin properties -----------------------------------------
		
		/** kevin's initial spare lives. */                
		public static const KEVIN_LIVES:int = 5;
		
		/** kevin's minimum speed. */
		public static const KEVIN_MIN_SPEED:Number = 650;
		
		/** kevin's maximum speed when he touches Fire. */                
		public static const KEVIN_MAX_SPEED:Number = 1300;
		
		/** Movement speed - game/player/items/obstacles speed. */
		public static const GRAVITY:Number = 10;
		
		// Obstacle properties -------------------------------------
		
		/** Obstacle frequency. */
		public static const OBSTACLE_GAP:Number = 1800;
		
		/** Obstacle speed. */                
		public static const OBSTACLE_SPEED:Number = 300;
	}
}