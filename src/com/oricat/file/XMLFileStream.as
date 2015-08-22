/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 03/06/14
 * Time: 13:36
 * Copyright 2014 Benjamin Simon Bath

 */
package com.oricat.file {
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class XMLFileStream implements IXMLFileStream {

	private var _xml:XML;
	private var _loadPath:String;
	private var _savePath:String;

	public function load(path:String):Boolean {
		_loadPath = path;
		try {
			var domFile:File = FileStatics.LOAD_DIR.resolvePath(FileStatics.LOAD_PROJECT_DIR + path);
			var fileStream:FileStream = new FileStream();
			fileStream.open(domFile, FileMode.READ);
			var str:String = String(fileStream.readUTFBytes(fileStream.bytesAvailable));
			fileStream.close();
			_xml = new XML(str);
		} catch (e:Error) {
			return false;
		}
		return true;
	}

	public function save(path:String = null):Boolean {
		if (path == null)_savePath = _loadPath;
		else _savePath = path+_loadPath;
		try {
			var file:File = FileStatics.SAVE_DIR.resolvePath(FileStatics.SAVE_PROJECT_DIR + _savePath);
			var fileStream:FileStream = new FileStream();
			fileStream.open(file, FileMode.WRITE);
			fileStream.writeMultiByte(String(_xml), "iso-8859-1");
			fileStream.close();
		} catch (e:Error) {
			return false;
		}
		return true;
	}


	public function get xml():XML {
		return _xml;
	}

	public function set xml(value:XML):void {
		_xml = value;
	}

	public function get loadPath():String {
		return _loadPath;
	}

	public function set loadPath(value:String):void {
		_loadPath = value;
	}

	public function get savePath():String {
		return _savePath;
	}

	public function set savePath(value:String):void {
		_savePath = value;
	}
}
}
