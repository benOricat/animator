package scraps {
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;

import scraps.Scrap;

/**
     * Extends Scrap to display text.
     */
    public class TextScrap extends Scrap
    {
        private var textDisplay:TextField = new TextField();
        public function TextScrap(text:String)
        {
            super();
            textDisplay.wordWrap = true;
            textDisplay.autoSize = TextFieldAutoSize.LEFT;
            textDisplay.text = text;
            normalizeSize();        
            addChild(textDisplay);
        }
        
        private function normalizeSize():void{
            const ratio:Number = 1/2; //height/width
            var area:Number = textDisplay.textWidth * textDisplay.textHeight;
            textDisplay.width = Math.floor(Math.sqrt(area/ratio));
        }

       
    }
}