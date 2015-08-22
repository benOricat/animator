package {

import com.oricat.assets.AssetExtractor;
import com.oricat.assets.interpreter.IInterpreter;
import com.oricat.assets.interpreter.flash.FlashInterpreter;
import com.oricat.file.FileStatics;
import com.oricat.file.IMultiFileStream;
import com.oricat.file.MultiFileStream;

import flash.desktop.Clipboard;
import flash.desktop.ClipboardFormats;
import flash.desktop.NativeDragActions;
import flash.desktop.NativeDragManager;
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.NativeDragEvent;
import flash.events.NativeWindowBoundsEvent;

import scraps.FileScrap;
import scraps.Scrap;

public class Main extends Sprite {

    private var dragTarget:Sprite = new Sprite();
    private const backgroundColor:Number = 0xf0f0f0;
    private var _multiFileStream:IMultiFileStream;

    public function Main():void {
        super();
        addEventListener(Event.ADDED_TO_STAGE, onStaged);
        dragTarget.focusRect = false;
        addChild(dragTarget);
    }

    /**
     * Initializes the stage properties, draws the background,
     * adds event listeners, and adds menus.
     */
    private function onStaged(event:Event):void {
        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.stageFocusRect = false;
        drawBackground();

        //Drag-and-drop listeners
        dragTarget.addEventListener(NativeDragEvent.NATIVE_DRAG_ENTER, onDragIn);
        dragTarget.addEventListener(NativeDragEvent.NATIVE_DRAG_OVER, onDragOver);
        dragTarget.addEventListener(NativeDragEvent.NATIVE_DRAG_DROP, onDrop);
        dragTarget.addEventListener(NativeDragEvent.NATIVE_DRAG_EXIT, onDragExit);

        //UI listeners
        stage.nativeWindow.addEventListener(NativeWindowBoundsEvent.RESIZE, onResize);
    }

    /**
     * On drag-in, check the data formats. If it is a supported format,
     * tell the Native Drag Manager that the component can take the drop.
     *
     * The dragTarget Sprite, which is drawn to fill the window, is
     * the designated target.
     */
    private function onDragIn(event:NativeDragEvent):void {
        var transferable:Clipboard = event.clipboard;

        if (transferable.hasFormat(ClipboardFormats.BITMAP_FORMAT) ||
                transferable.hasFormat(ClipboardFormats.FILE_LIST_FORMAT) ||
                transferable.hasFormat(ClipboardFormats.TEXT_FORMAT) ||
                transferable.hasFormat(ClipboardFormats.URL_FORMAT) ||
                transferable.hasFormat(Scrap.SCRAP_FORMAT)) {
            NativeDragManager.acceptDragDrop(dragTarget);
            NativeDragManager.dropAction = NativeDragActions.MOVE;
        } else {
            trace("Unrecognized format");
        }
    }

    /**
     * For objects dragged within the Scrappy application, it makes
     * more sense to make move the default action, but still allow
     * the copy action. Scrappy overrides the default behavior by
     * checking the properties of the event object when the clipboard
     * has a SCRAP object on it.
     *
     * For objects dragged into the application it makes sense that
     * copy is the default action, so the default behavior is not changed.
     */
    private function onDragOver(event:NativeDragEvent):void {
        if (event.clipboard.hasFormat(Scrap.SCRAP_FORMAT)) {
            if (event.ctrlKey || event.controlKey) {
                NativeDragManager.dropAction = NativeDragActions.COPY;
            } else {
                NativeDragManager.dropAction = NativeDragActions.MOVE;
            }
        }
    }

    /**
     * On drop, create a new scrap object and put it on the stage. The Scrap
     * class handles converting the dropped data into a display object.
     */
    private function onDrop(event:NativeDragEvent):void {
        var scrap:Scrap = Scrap.createScrap(event.clipboard, event.stageX, event.stageY, event.dropAction);
        dragTarget.addChild(scrap);
        if (scrap is FileScrap)processFile(scrap as FileScrap);
    }

    private function processFile(fileScrap:FileScrap):void {
        _multiFileStream = new MultiFileStream() as IMultiFileStream;
        MultiFileStream(_multiFileStream).addEventListener(MultiFileStream.ASSETS_READY, onAssetsReady);
        FileStatics.LOAD_PROJECT_DIR = fileScrap.sourceFile.nativePath;
        FileStatics.SAVE_PROJECT_DIR = fileScrap.sourceFile.nativePath;
        _multiFileStream.load("");

        /*
         for (var i:int = 0; i < _multiFileStream.files.length; i++) {
         var iFileStream:IFileStream = _multiFileStream.files[i];
         trace("iFileStream.loadPath",iFileStream,iFileStream.loadPath);
         }
         */
    }

    private function onAssetsReady(event:Event):void {
        trace("onAssetsReady");

        var assetExtractor:AssetExtractor = new AssetExtractor();
        addChild(assetExtractor);
        assetExtractor.processAssets(_multiFileStream);
        assetExtractor.initialiseInterpreter(new FlashInterpreter());

        var interpreter:IInterpreter = new FlashInterpreter();
        interpreter.domManager = assetExtractor.domManager;
        interpreter.symbols = assetExtractor.symbols;

        interpreter.renderSymbols();
        addChild(interpreter.display as DisplayObject);
//       trace(_multiFileStream.save());
    }

    /**
     * The drag exit event isn't used, but a trace statement is called as an example.
     */
    private function onDragExit(event:NativeDragEvent):void {
    }

    /**
     * Redraws the dropTarget Sprite object so that it always fills the window.
     */
    private function onResize(event:NativeWindowBoundsEvent):void {
        drawBackground();
    }

    private function drawBackground():void {
        with (dragTarget.graphics) {
            clear();
            beginFill(backgroundColor, 1);
            drawRect(0, 0, stage.stageWidth, stage.stageHeight);
            endFill();
        }
    }

}
}