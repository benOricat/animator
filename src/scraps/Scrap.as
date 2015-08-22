package scraps {
import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;
import flash.display.Sprite;
import flash.filesystem.File;
import flash.geom.Point;

/**
     * The base class for all Scrap objects.
     * 
     * Event handlers, UI interactions, and the Scrap factory are defined here.
     * Subclasses add variables to hold the transfered data and to add their
     * specific data type to the Clipboard when a scrap is dragged out.
     */
    public class Scrap extends Sprite {
    public static const SCRAP_FORMAT:String = "SCRAP";
    private static const highlightOffset:int = 6;

    //Used to manage focus
    protected static var offset:Point = new Point();

    //Calls super class constructor, then adds event listeners
    public function Scrap():void {
        trace("Creating scrap");
        super();
        this.focusRect = false;
        this.mouseChildren = false;
    }

    /**
     * Creates a new scrap from a Clipboard object.
     *
     * @param data The Clipboard object
     * @param placeX The new scrap x coordinate.
     * @param placeY The new scrap y coordinate.
     * @param action The copy or move actions
     * @return The new Scrap object.
     *
     */
    public static function createScrap(data:Clipboard, placeX:int, placeY:int, action:String):Scrap {
        var scrap:Scrap;
        if (data.hasFormat(ClipboardFormats.FILE_LIST_FORMAT)) {
            var dropfiles:Array = data.getData(ClipboardFormats.FILE_LIST_FORMAT) as Array;
            for each (var file:File in dropfiles) {
                trace("scrap file found")
                scrap = new FileScrap(file);
            }
            scrap.x = placeX + offset.x + highlightOffset;
            scrap.y = placeY + offset.y + highlightOffset;
            offset.x = 0;
            offset.y = 0;
        }
        return scrap;
    }
}
}
