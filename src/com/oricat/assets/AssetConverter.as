/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 10/06/14
 * Time: 22:03
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets {
import com.oricat.assets.domVO.DomManager2;
import com.oricat.file.IFileStream;
import com.oricat.file.IImageFileStream;
import com.oricat.file.IMultiFileStream;
import com.oricat.file.IXMLFileStream;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Matrix;

public class AssetConverter {

	private var _domFS:IXMLFileStream;
	private var _multiFileStream:IMultiFileStream;
	private var _donorAssets:Vector.<IImageFileStream>;
	private var _domManager:DomManager;

	/**
	 * Method iterates over the files in the multiFileStream extracts the DOM and image assets.
	 * ...
	 * @param multiFileStream
	 * @return void
	 */
	public function processAssets(multiFileStream:IMultiFileStream):void {
		_multiFileStream = multiFileStream;
		_donorAssets = new <IImageFileStream>[];
		var i:int;
		var iFileStream:IFileStream;
		for (i = 0; i < multiFileStream.files.length; i++) {
			iFileStream = multiFileStream.files[i];
			if(iFileStream is IXMLFileStream && iFileStream.loadPath == "\\DOMDocument.xml"){
				_domFS = iFileStream as IXMLFileStream;
			}
			if(iFileStream is IImageFileStream){
				_donorAssets.push(iFileStream as IImageFileStream);
			}
		}
		if(_domFS){
			_domManager= new DomManager();
			_domManager.processDOMDocument(_domFS.xml);
			//var dm2:DomManager2 = new DomManager2();
			//dm2.xml = _domFS.xml;
			if(_domManager.timelineAsset.length &&_domManager.timelineAsset.length>0)
				createAssets();
		}
	}

	private function createAssets():void {
		//TODO allow for unused donors
		//TODO allow for mismatch on usage count between assets and donors
		processTimeLineAssets();
//		cloneDonors();
//		deleteDonors();
	}

	/**
	 * processTimeLineAssets extracts library images
	 */
	private function processTimeLineAssets():void {
		var donor:IImageFileStream;
		var timelineAssetVO:TimelineAssetVO;
		for (var i:int = 0; i < _domManager.timelineAsset.length; i++) {
			timelineAssetVO = _domManager.timelineAsset[i];
			//TODO allow for mismatch between libraryItemName and file name
			donor = getDonorByName(timelineAssetVO.libraryItemName);
			if(donor){
				donor.bitmap = getNewBitmap(donor.bitmap,timelineAssetVO.matrix);
				var loadPath:String = donor.loadPath;
				var fileName:String = loadPath.split("\\").pop();
				donor.savePath = "LIBRARY/exported/"+timelineAssetVO.name+"/"+fileName;
				_domManager.createNewMediaVO(timelineAssetVO.name,fileName);
			}
			timelineAssetVO.libraryItemName = "exported/"+timelineAssetVO.name+"/"+timelineAssetVO.libraryItemName;
		}
		_domManager.clearMediaNodes();
		_domManager.writeNewMediaNodes();
	}

	private function getNewBitmap(bitmap:Bitmap, matrix:Matrix):Bitmap {
		var sx:Number = Math.sqrt(matrix.a*matrix.a+matrix.b*matrix.b);
		var sy:Number = Math.sqrt(matrix.c*matrix.c+matrix.d*matrix.d);
		var w:Number = Math.round(bitmap.bitmapData.width * sx);
		var h:Number = Math.round(bitmap.bitmapData.height * sy);
		var bmd:BitmapData = new BitmapData(w, h);
		bmd.draw(bitmap.bitmapData,new Matrix(sx, 0,0,sy));
		return new Bitmap(bmd,bitmap.pixelSnapping,bitmap.smoothing);
	}

	private function getDonorByName(libraryItemName:String):IImageFileStream{
		for (var i:int = 0; i < _donorAssets.length; i++) {
			var imageFileStream:IImageFileStream = _donorAssets[i];
			if(imageFileStream.loadPath.indexOf(libraryItemName)!=-1){
				return imageFileStream;
			}
		}
		return null
	}
}
}
