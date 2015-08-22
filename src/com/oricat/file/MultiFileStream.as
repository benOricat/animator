/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 05/06/14
 * Time: 20:01
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.file {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.filesystem.File;

/**
 * This class loads and manages the directories of assets from the xfl folder. Once the contents of these files are
 * processed the assets can be saved to a new location. Assets are stored in a Vector.<IFileStream>
 * It is intended that the assets in vector are edited to make some change to the resultant xfl file.
 * NB The root binary xfl asset will need to be cloned independently
 */
public class MultiFileStream extends EventDispatcher implements IMultiFileStream{

	private var _loadPath:String;
	private var _savePath:String;
	private var _pendingAssets:int;
	private var _files:Vector.<IFileStream> = new Vector.<IFileStream>();
	public static const ASSETS_READY:String = "assets_ready";

	public function load(path:String):Boolean {
		_pendingAssets = 0;
		var success:Boolean = loadInternal(path);
		if(_pendingAssets==0){
			onAssetReady();
		}
		return success;
	}

	private function loadInternal(path:String):Boolean {
		_loadPath = path;
		var success:Boolean = true;
		var libDir:File = FileStatics.LOAD_DIR.resolvePath(FileStatics.LOAD_PROJECT_DIR + _loadPath);
		var list:Array = libDir.getDirectoryListing();
		var file:File;
		var iFileStream:IFileStream;
		var subPath:String;
		for (var i:uint = 0; i < list.length; i++) {
			file = File(list[i]);
			subPath = path + file.nativePath.substr(libDir.nativePath.length);
			if (file.isDirectory) {
				success = success && loadInternal(subPath)
			} else if (FileStatics.FILE_TYPE(file.type) == FileStatics.FILE_TYPES_XML) {
				iFileStream = new XMLFileStream();
				success = success && iFileStream.load(subPath);
				_files.push(iFileStream);
			} else if (FileStatics.FILE_TYPE(file.type) == FileStatics.FILE_TYPES_IMAGE) {
				iFileStream = new ImageFileStream();
				_pendingAssets++;
				ImageFileStream(iFileStream).addEventListener(ImageFileStream.ASSET_READY, onAssetReady);
				success = success && iFileStream.load(subPath);
				_files.push(iFileStream);
			}
        }
        //reset _loadPath;
        _loadPath = path;
		return success;
	}

	private function onAssetReady(event:Event = null):void {
		if(event){
			event.target.removeEventListener(ImageFileStream.ASSET_READY,onAssetReady);
		}
		_pendingAssets--;
		if(_pendingAssets<=0)
			dispatchEvent(new Event(ASSETS_READY));
	}

	public function save(path:String = null):Boolean {
		if(path == null)_savePath = _loadPath;
		else _savePath = path;
		var dir:File = FileStatics.SAVE_DIR.resolvePath(FileStatics.LOAD_PROJECT_DIR+_savePath);
		try{
			if(!dir.exists){
				dir.createDirectory();
			}
			for (var i:int = 0; i < _files.length; i++) {
				var iFileStream:IFileStream = _files[i];
				iFileStream.save(_savePath);
			}
		}catch(e:Error){
			trace(e);
			return false;
		}
		return true;
	}

	public function get files():Vector.<IFileStream> {
		return _files;
	}

	public function set files(value:Vector.<IFileStream>):void {
		_files = value;
	}

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
}
}
