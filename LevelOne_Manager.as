package 
{
	import flash.display.MovieClip;
	import flash.events.Event;

	public class LevelOne_Manager extends MovieClip
	{
		public function LevelOne_Manager()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(event:Event):void
		{
			//Add event listeners
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
		}
		private function onRemovedFromStage(event:Event):void
		{
			//Remove the onEnterFrame event if
			//this object is removed from the stage
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			trace("Dungeon removed");
		}
		
		//Most of game logic is programmed into the
		//onEnterFrame event handler
		private function onEnterFrame(event:Event):void
		{

			
			//7.If the player reaches the exit, the game has been won
			//Display the Game Over screen
			if(home.hitTestObject(player))
			{
				var gameOverWon:LevelTwo_Manager = new LevelTwo_Manager();
				//gameOverWon.messageDisplay.text = "Game Over" + "\n" + "You Won!";
				parent.addChild(gameOverWon);
				parent.removeChild(this);
				
				//Remove the above code and add this code to
				//test adding a new level to the game:

				//var dungeonTwo = new DungeonTwo();
       			//parent.addChild(dungeonTwo);
        		//parent.removeChild(this);
			}
		}
		
		//8. Pulic methods that other classes can use to 
		//check for collisions with objects in the game
		
		//A. Allow the wall objects to check for a collison
		//with the player
		public function checkCollisionWithPlayer(wall:MovieClip)
		{
			if (player != null)
			{
				Collision.block(player, wall);
			}
		}
	
	}
}