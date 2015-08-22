package scraps {
    import flash.desktop.Clipboard;
    import flash.desktop.ClipboardFormats;
    import flash.events.Event;
    import flash.html.HTMLHost;
    import flash.html.HTMLLoader;
    import flash.net.URLRequest;

import scraps.Scrap;

/**
    * Extends Scrap to load and display urls.
    */
    public class HTMLScrap extends Scrap
    {
        private var htmlDisplay:HTMLLoader = new HTMLLoader();

        public function HTMLScrap(urlString:String)
        {
            super();
            var url:URLRequest = new URLRequest(urlString);
            htmlDisplay.paintsDefaultBackground = false;
            htmlDisplay.htmlHost = new HTMLHost(true);
            htmlDisplay.load(url);
            htmlDisplay.addEventListener(Event.COMPLETE,htmlComplete);
        }
        
        private function htmlComplete(event:Event):void{
               	htmlDisplay.removeEventListener(Event.COMPLETE,htmlComplete);
                normalizeSize();
                htmlDisplay.width = (htmlDisplay.width  < 2880) ? htmlDisplay.width  : 2880;
                htmlDisplay.height = (htmlDisplay.height < 2880) ? htmlDisplay.height : 2880;
                htmlDisplay.width = (htmlDisplay.width  == 0) ? 400 : htmlDisplay.width;
                htmlDisplay.height = (htmlDisplay.height == 0) ? 400: htmlDisplay.height;
                addChild(htmlDisplay);
                width = htmlDisplay.width;
                height = htmlDisplay.height;
                scaleX = 1;
                scaleY = 1;
        }

        private function normalizeSize():void{
            const ratio:Number = 3/4; //height/width
            var area:Number = htmlDisplay.contentWidth * htmlDisplay.contentHeight;
            htmlDisplay.width = Math.floor(Math.sqrt(area/ratio));
            var computedHeight:int = Math.floor(Math.sqrt(area*ratio));
            htmlDisplay.height = (htmlDisplay.contentHeight > computedHeight) ? htmlDisplay.contentHeight : computedHeight;
        }

        /**
         * Overrides the inherited method to add the url data to the 
         * transferable object.
         */
        protected override function addTransferableData():Clipboard{
            var transfer:Clipboard = super.addTransferableData();
            transfer.setData(ClipboardFormats.URL_FORMAT,htmlDisplay.location,true);
            return transfer;
        }
   
    }
}