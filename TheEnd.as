package 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;

	public class TheEnd extends MovieClip
	{
		public function TheEnd ()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			addEventListener(MouseEvent.CLICK,onReplayButtonClick);
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
			
		}
		function onReplayButtonClick(event:MouseEvent):void
		{
			var gameOverWon:TheTitle = new TheTitle ();
			//gameOverWon.messageDisplay.text = "Game Over" + "\n" + "You Won!";
			parent.addChild(gameOverWon);
			parent.removeChild(this);
		}

		
		//8. Pulic methods that other classes can use to 
		//check for collisions with objects in the game
		
		//A. Allow the wall objects to check for a collison
		//with the player
	
	
	}
}