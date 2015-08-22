package scraps.controls
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;

	public class Sizer extends Sprite
	{
		private var type:String;
		public function Sizer():void{
			this.visible = false;
			this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			this.addEventListener(MouseEvent.MOUSE_UP,onMouseDown);
			this.useHandCursor = true;
		}
		
		private function draw(bounds:Rectangle):void{
			with(graphics){
				clear();
				lineStyle(3,0xff0000,.5);
				//beginFill(0x00ff00,.1);
				moveTo(bounds.left-3,bounds.top-3);
				lineTo(bounds.left+bounds.width+3,bounds.top-3);
				lineTo(bounds.left+bounds.width+3,bounds.top+bounds.height+3);
				lineTo(bounds.left-3,bounds.top+bounds.height+3);
				lineTo(bounds.left-3,bounds.top-3);
				//endFill();
			}
		}
		
		public function show(bounds:Rectangle):void{
			draw(bounds)
			this.visible = true;			
		}
		
		public function hide():void{
			this.visible = false;
		}
		
		private var sizeOrigin:Point = new Point();
		private function onMouseDown(event:MouseEvent):void{
			sizeOrigin.x = event.localX;
			sizeOrigin.y = event.localY; 
			addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
			event.stopPropagation();	
		}
		
		private function onMouseUp(event:Event):void{
			removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove)	
		}

		private function onMouseMove(event:MouseEvent):void{
			var delta:Point = new Point((sizeOrigin.x - event.localX)/width, (sizeOrigin.y-event.localY)/height);
			var resizeEvent:SizerEvent = new SizerEvent(SizerEvent.RESIZE, delta);
			this.dispatchEvent(resizeEvent);
		}
	}
}