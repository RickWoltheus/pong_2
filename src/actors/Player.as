package actors 
{
	import utils.Controller;	
	import flash.events.Event;
	/**
	 * ...
	 * @author erwin henraat
	 */
	public class Player extends Paddle 
	{
		private var controller:Controller;
		private var speed:Number = 0;
		
		public function Player() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);		
		}		
		private function init(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, init);
			controller = new Controller(stage);
			this.addEventListener(Event.ENTER_FRAME, loop);			
		}
		/*public function set MAXSPEED(a:Number)
		{
			if (MAXSPEED < speed)
			{
		     speed = 30;
			}
		}*/
		private function loop(e:Event):void 
		{
			if (controller.up)
			{
				speed = -10;
			}
			else if(controller.down)
			{
				speed = 10;
			}else
			{
				if (speed > 0) speed--;
				if (speed < 0) speed++;
				
			}
			if (controller.fire)
			{
			     dispatchEvent(new Event("fired"));
				
			}
			this.y += speed;
		}
		
	}

}