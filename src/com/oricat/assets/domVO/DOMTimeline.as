/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 25/06/14
 * Time: 21:57
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMTimeline implements ISetXML{

	private var _domLayers:Vector.<DOMLayer>;

	public function DOMTimeline(){
		_domLayers = new Vector.<DOMLayer>();
	}
	public var name:String;
	public var currentFrame:String;

	public function get domLayers():Vector.<DOMLayer> {
		return _domLayers;
	}

	public function set domLayers(value:Vector.<DOMLayer>):void {
		_domLayers = value;
	}

	public function get xml():XML {
		var _xml:XML = <DOMTimeline/>;
		_xml.appendChild(<layers/>);
		if(name)_xml.@name = name;
		if(currentFrame)_xml.@currentFrame = currentFrame;
		for (var i:int = 0; i < domLayers.length; i++) {
			var domLayer:DOMLayer = domLayers[i];
			_xml.layers.appendChild(domLayer.xml);
		}
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;

		if(value.@name)name = value.@name;
		if(value.@currentFrame)currentFrame = value.@currentFrame;

		var xmlList:XMLList = value.layers..DOMLayer;
		var domLayer:DOMLayer;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var itemXml:XML = xmlList[i];
			domLayer = new DOMLayer();
			domLayer.xml = itemXml;
			domLayers.push(domLayer);
		}

	}
}
}
