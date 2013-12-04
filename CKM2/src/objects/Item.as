package objects
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Item extends Sprite
	{
		private var _foodItemType:int;
		private var itemImage:Image;
		
		public function Item(_foodItemType:int)
		{
			super();
			
			this.foodItemType = _foodItemType;
		}

		public function set foodItemType(value:int):void
		{
			_foodItemType = value;
			
			if (itemImage == null)
			{
				// If the item is created for the first time.
				itemImage = new Image(Assets.getAtlas().getTexture("item_" + _foodItemType));
				itemImage.width = Assets.getAtlas().getTexture("item_" + _foodItemType).width;
				itemImage.height = Assets.getAtlas().getTexture("item_" + _foodItemType).height;
				itemImage.x = -itemImage.width/2;
				itemImage.y = -itemImage.height/2;
				this.addChild(itemImage);
			}
			else
			{
				// If the item is reused.
				itemImage.texture = Assets.getAtlas().getTexture("item_" + _foodItemType);
				itemImage.width = Assets.getAtlas().getTexture("item_" + _foodItemType).width;
				itemImage.height = Assets.getAtlas().getTexture("item_" + _foodItemType).height;
				itemImage.x = -itemImage.width/2;
				itemImage.y = -itemImage.height/2;
			}
		}
		
		public function get foodItemType():int
		{
			return _foodItemType;
		}
	}
}