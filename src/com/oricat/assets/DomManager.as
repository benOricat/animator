/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 17/06/14
 * Time: 21:15
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets {
import flash.geom.Matrix;

public class DomManager {
	private var _domXML:XML;
	private var _ns:Namespace;

	private var _screens:XMLList;
	private var _timelineAsset:Vector.<TimelineAssetVO>;
	private var _media:Vector.<MediaVO>;

	private var _newMedia:Vector.<MediaVO>;


	public function processDOMDocument(domXML:XML):void {
		_domXML = domXML;
		_ns = _domXML.namespace();
		default xml namespace = _ns;
		generateScreens();
		generateContent();
		generateMedia();
	}

	private function generateScreens():void {
		_screens = _domXML.timelines.DOMTimeline.layers.DOMLayer.(@name == 'screens')..DOMFrame;
	}

	private function generateContent():void {
		_timelineAsset = new <TimelineAssetVO>[];
		var timelineElement:XML;
		var timelineElements:XMLList = _domXML.timelines.DOMTimeline.layers.DOMLayer.(@name != 'screens')..elements;
		for (var i:int = 0; i < timelineElements.length(); i++) {
			timelineElement = timelineElements[i];
			_timelineAsset.push(createTimelineAssetVO(timelineElement));
		}
	}

	private function generateMedia():void {
		_media = new <MediaVO>[];
		var media:XMLList = _domXML.media..DOMBitmapItem;
		var mediaNode:XML;
		var mediaVO:MediaVO;
		for (var i:int = 0; i < media.length(); i++) {
			mediaNode = media[i];
			mediaVO = new MediaVO();
			mediaVO.setXml(mediaNode,_ns);
			_media.push(mediaVO);
		}
	}


	private function createTimelineAssetVO(timelineElement:XML):TimelineAssetVO {
		default xml namespace = _ns;
		var timeLineAssetVO:TimelineAssetVO = new TimelineAssetVO();
		var matrixXML:XML = timelineElement.DOMBitmapInstance.matrix[0].Matrix[0];
		timeLineAssetVO.matrix = getMatrix(matrixXML);
		timeLineAssetVO.index = timelineElement.parent().@index;
		timeLineAssetVO.libraryItemName = timelineElement.DOMBitmapInstance.@libraryItemName;
		timeLineAssetVO.name = getName(timeLineAssetVO.index);
//		default xml namespace = new Namespace();
		return timeLineAssetVO;
	}

	private function getName(index:String):String {
		return _screens.(@index == index).@name;
	}

	private function getMatrix(xmlMatrix:XML):Matrix {
		default xml namespace = _ns;
		var mat:Matrix = new Matrix(
				xmlMatrix.@a  ? xmlMatrix.@a  : 1,
				xmlMatrix.@b  ? xmlMatrix.@b  : 0,
				xmlMatrix.@c  ? xmlMatrix.@c  : 0,
				xmlMatrix.@d  ? xmlMatrix.@d  : 1,
				xmlMatrix.@tx ? xmlMatrix.@tx : 0,
				xmlMatrix.@ty ? xmlMatrix.@ty : 0
		);
		//apply a new matrix to the donor xml
		var sx:Number = Math.sqrt(mat.a*mat.a+mat.b*mat.b);
		var sy:Number = Math.sqrt(mat.c*mat.c+mat.d*mat.d);
		//invert scale and concatenate the transform
		var newMatrix:Matrix = new Matrix(1/sx,0,0,1/sy);//mat.clone();
		newMatrix.concat(mat);
		xmlMatrix.@a  = newMatrix.a;
		xmlMatrix.@b  = newMatrix.b;
		xmlMatrix.@c  = newMatrix.c;
		xmlMatrix.@d  = newMatrix.d;
		xmlMatrix.@tx  = newMatrix.tx;
		xmlMatrix.@ty  = newMatrix.ty;
		return mat;
	}

	public function createNewMediaVO(screenName:String, fileName:String):void{
		default xml namespace = _ns;
		var mediaVO:MediaVO;
		for (var i:int = 0; i < _media.length; i++) {
			mediaVO = _media[i]
			if(mediaVO.href.indexOf(fileName)) {
				mediaVO = _media[i].clone();
				break;
			}
			mediaVO = null;
		}
		if(mediaVO){
			if(_newMedia==null)_newMedia = new <MediaVO>[];
			mediaVO.name = "exported/"+screenName+"/"+mediaVO.name;
			mediaVO.href = "exported/"+screenName+"/"+mediaVO.href;
			_newMedia.push(mediaVO);
		}
	}

	public function get timelineAsset():Vector.<TimelineAssetVO> {
		return _timelineAsset;
	}

	public function get media():Vector.<MediaVO> {
		return _media;
	}

	public function set screens(value:XMLList):void {
		_screens = value;
	}

	public function clearMediaNodes():void {
		var ns:Namespace = _domXML.namespace();
//		delete _domXML.ns::_domXML.media;
		delete _domXML.media;
	}

	public function writeNewMediaNodes():void {
		var ns:Namespace = _domXML.namespace();
		_domXML.appendChild(<media/>);
		for (var i:int = 0; i < _newMedia.length; i++) {
			var mediaVO:MediaVO = _newMedia[i];
			_domXML.media.appendChild(mediaVO.xml);
		}
	}
}
}
