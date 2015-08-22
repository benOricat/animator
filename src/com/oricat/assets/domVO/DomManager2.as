/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 20:31
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
import com.oricat.assets.MediaVO;
import com.oricat.assets.domVO.Matrix;

import flash.geom.Matrix;


public class DomManager2{

	public var dom:DOMDocument;
	private var _domXML:XML;
	private var _ns:Namespace;
	private var _screenFrames:Vector.<DOMFrame>;
	private var _timelineAssets:Vector.<TimelineAsset>;
	private var _domBitmapItems:Vector.<DOMBitmapItem>;

	public function DomManager2() {
	}

	public function set xml(_xml:XML):void{
		_domXML = _xml;
		_ns = _xml.namespace();
		default xml namespace = _ns;

		dom = new DOMDocument();
		dom.xml = _xml;


//		generateScreens();
//		generateContent();
		generateMedia();
	}

	private function generateScreens():void {
		var screensXMLList:XMLList = _domXML.timelines.DOMTimeline.layers.DOMLayer.(@name == 'screens')..DOMFrame;
		_screenFrames = new <DOMFrame>[];
		var domFrame:DOMFrame;
		for (var i:int = 0; i < screensXMLList.length(); i++) {
			var xml:XML = screensXMLList[i];
			domFrame = new DOMFrame();
			domFrame.xml = xml;
			_screenFrames.push(domFrame);
		}
	}

	private function generateContent():void {
		_timelineAssets = new <TimelineAsset>[];
		var timelineAsset:TimelineAsset;
		var domBitmapInstance:DOMBitmapInstance;
		var bitmapInstanceXML:XMLList = _domXML.timelines.DOMTimeline.layers.DOMLayer.(@name != 'screens')..DOMBitmapInstance;
		for (var i:int = 0; i < bitmapInstanceXML.length(); i++) {
			domBitmapInstance = new DOMBitmapInstance();
			domBitmapInstance.xml = bitmapInstanceXML[i];
			timelineAsset.domBitmapInstance = domBitmapInstance;
			timelineAsset.screenName = getName(bitmapInstanceXML.parent.parent.@index);
			convertMatrix(timelineAsset.domBitmapInstance.matrix);
			_timelineAssets.push(TimelineAsset);
		}
	}

	private function convertMatrix(matrix:com.oricat.assets.domVO.Matrix):void{
		var mat:flash.geom.Matrix = matrix.getMatrix();
		//apply a new matrix to the donor xml
		var sx:Number = Math.sqrt(mat.a*mat.a+mat.b*mat.b);
		var sy:Number = Math.sqrt(mat.c*mat.c+mat.d*mat.d);
		//invert scale and concatenate the transform
		var newMatrix:flash.geom.Matrix = new flash.geom.Matrix(1/sx,0,0,1/sy);//mat.clone();
		newMatrix.concat(mat);
		matrix.setMatrix(newMatrix);
	}

	private function getName(index:String):String {
		for (var i:int = 0; i < _screenFrames.length; i++) {
			var domFrame:DOMFrame = _screenFrames[i];
			if(domFrame.index==index)return domFrame.name;
		}
		return ""
	}


	private function generateMedia():void {
		_domBitmapItems = new <DOMBitmapItem>[];
		var media:XMLList = _domXML.media..DOMBitmapItem;
		var mediaNode:XML;
		var mediaVO:MediaVO;
		for (var i:int = 0; i < media.length(); i++) {
			mediaNode = media[i];
			mediaVO = new MediaVO();
			mediaVO.setXml(mediaNode,_ns);
			DOMBitmapItem
			_domBitmapItems.push(mediaVO);
		}
	}

	public function getTimelineAssets():void {
		_domXML.timelines.DOMTimelines.layers.DOMLayer.(@name == 'screens')..DOMFrame
	}
}
}
