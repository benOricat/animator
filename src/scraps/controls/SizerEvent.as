package scraps.controls
{
	import flash.events.Event;
	import flash.geom.Point;

	public class SizerEvent extends Event
	{
		public static const RESIZE:String = "resize";
		public var change:Point = new Point();
		public function SizerEvent(type:String, change:Point, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.change = change;
		}
		
	}
}