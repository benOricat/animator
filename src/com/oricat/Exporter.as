/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 26/05/14
 * Time: 12:42
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat {
import com.oricat.assets.AssetConverter;
import com.oricat.file.IFileStream;
import com.oricat.file.IMultiFileStream;
import com.oricat.file.MultiFileStream;

import flash.display.MovieClip;
import flash.events.Event;

public class Exporter extends MovieClip {

	private var _multiFileStream:IMultiFileStream;

	public function Exporter() {
		init();
	}

	private function init():void {
		_multiFileStream = new MultiFileStream() as IMultiFileStream;
		MultiFileStream(_multiFileStream).addEventListener(MultiFileStream.ASSETS_READY,onAssetsReady);
		_multiFileStream.load("");

/*
		for (var i:int = 0; i < _multiFileStream.files.length; i++) {
			var iFileStream:IFileStream = _multiFileStream.files[i];
			trace("iFileStream.loadPath",iFileStream,iFileStream.loadPath);
		}
*/
	}

	private function onAssetsReady(event:Event):void {
		var assetConverter:AssetConverter  = new AssetConverter();
		assetConverter.processAssets(_multiFileStream);
		trace(_multiFileStream.save());
	}
}
}
