package scraps {
    import flash.desktop.Clipboard;
    import flash.desktop.ClipboardFormats;
    import flash.display.Bitmap;
    import flash.display.Loader;
    import flash.events.AsyncErrorEvent;
    import flash.events.Event;
    import flash.filesystem.File;
    import flash.filesystem.FileMode;
    import flash.filesystem.FileStream;
    import flash.html.HTMLLoader;
    import flash.media.Sound;
    import flash.media.Video;
    import flash.net.NetConnection;
    import flash.net.NetStream;
    import flash.net.URLRequest;
    import flash.system.ApplicationDomain;
    import flash.system.LoaderContext;

import scraps.Scrap;


public class FileScrap extends Scrap {
    private var icon:Bitmap = new Bitmap();
    public var sourceFile:File;

    /**
     * Extends Scrap to display files.
     *
     * If a file type can be loaded and displayed using a built-in control,
     * then it is, otherwise, just the file icon and name are shown.
     */
    public function FileScrap(file:File) {
        super();
        sourceFile = file;
        icon.bitmapData = file.icon.bitmaps.shift();
        addChild(icon);
        var nameDisplay:TextScrap = new TextScrap(file.name);
        nameDisplay.x += icon.width + 4;
        addChild(nameDisplay);
    }
}
}