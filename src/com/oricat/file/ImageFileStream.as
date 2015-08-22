/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 07/06/14
 * Time: 10:53
 * Copyright 2014 Benjamin Simon Bath

 */
package com.oricat.file {
import com.adobe.images.JPGEncoder;
import com.adobe.images.PNGEncoder;

import flash.display.Bitmap;
import flash.display.Loader;
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;

public class ImageFileStream extends EventDispatcher implements IImageFileStream{

	public static const ASSET_READY:String = "asset_ready";

	private var _bitmap:Bitmap;
	private var _loadPath:String;
	private var _savePath:String;

	private var _loader:Loader = new Loader();

	public function load(path:String):Boolean {
		_loadPath = path;
		try {
			var file:File = FileStatics.LOAD_DIR.resolvePath(FileStatics.LOAD_PROJECT_DIR + path);
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.READ);
			var ba:ByteArray = new ByteArray();
			fileStream.readBytes(ba, 0,fileStream.bytesAvailable);
			_loader.loadBytes(ba);
			_loader.contentLoaderInfo.addEventListener(Event.INIT, onLoaderInit);
		} catch (e:Error) {
			return false;
		}
		return true;
	}

	private function onLoaderInit(event:Event):void {
		_loader.contentLoaderInfo.removeEventListener(Event.INIT, onLoaderInit);
		_bitmap = _loader.content as Bitmap;
		dispatchEvent(new Event(ASSET_READY));
	}

	public function save(path:String = null):Boolean {
		if (path == null){
			if(_savePath == null)
				_savePath = _loadPath;
		}else{
			_savePath = path;
		}
		try {
			var dirArray:Array = (FileStatics.SAVE_PROJECT_DIR + _savePath).split("/")
			dirArray.pop();
			var dir:File = FileStatics.SAVE_DIR.resolvePath(dirArray.join("/"));
			var file:File = FileStatics.SAVE_DIR.resolvePath(FileStatics.SAVE_PROJECT_DIR + _savePath);
			if(!dir.exists){
				dir.createDirectory();
			}
			var fileStream:FileStream = new FileStream();
			var ba:ByteArray;
			if(FileStatics.IMAGE_TYPE(file.type)==FileStatics.IMAGE_TYPE_JPG)
			{
				var jpgEncoder:JPGEncoder = new JPGEncoder(50);
				fileStream.open(file, FileMode.WRITE);
				ba = jpgEncoder.encode(_bitmap.bitmapData);
				ba.position = 0;
				fileStream.writeBytes(ba, 0, ba.length);
				fileStream.close();
			}
			else if(FileStatics.IMAGE_TYPE(file.type)==FileStatics.IMAGE_TYPE_PNG)
			{
				fileStream.open(file, FileMode.WRITE);
				ba = PNGEncoder.encode(_bitmap.bitmapData);
				ba.position = 0;
				fileStream.writeBytes(ba, 0, ba.length);
				fileStream.close();

			}
		} catch (e:Error) {
			return false;
		}
		return true;	}

	public function get savePath():String {
		return _savePath;
	}

	public function set savePath(value:String):void {
		_savePath = value;
	}

	public function get loadPath():String {
		return _loadPath;
	}

	public function set loadPath(value:String):void {
		_loadPath = value;
	}

	public function get bitmap():Bitmap {
		return _bitmap;
	}

	public function set bitmap(value:Bitmap):void {
		_bitmap = value;
	}

	public function clone():IImageFileStream{
		var iImageFileStream:IImageFileStream = new ImageFileStream();
		iImageFileStream.load(_loadPath);
		return iImageFileStream;
	}

}
}
