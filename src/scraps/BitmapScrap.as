package scraps {
    import flash.desktop.Clipboard;
    import flash.desktop.ClipboardFormats;
    import flash.display.Bitmap;
    import flash.display.BitmapData;

import scraps.Scrap;

/**
     * Extends Scrap to display images.
     */
    public class BitmapScrap extends Scrap
    {
        private var picture:Bitmap = new Bitmap();
        
        public function BitmapScrap(data:BitmapData):void{
            super();
            picture.bitmapData = data;
            addChild(picture);
        }
        
        /**
         * Overrides the inherited method to add the bitmap data to the 
         * transferable object.
         */
        protected override function addTransferableData():Clipboard{
            var transfer:Clipboard = super.addTransferableData(); 
            transfer.setData(ClipboardFormats.BITMAP_FORMAT,picture.bitmapData,true);
            return transfer;
        }
    }
}