/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 25/06/14
 * Time: 22:04
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMLayer implements ISetXML{

	private var _DOMFrames:Vector.<DOMFrame>;
	public function DOMLayer(){
		_DOMFrames = new Vector.<DOMFrame>();
	}
	public var name:String;
	public var color:String;
	public var current:String;
	public var isSelected:String;
	public var autoNamed:String;

	public function get DOMFrames():Vector.<DOMFrame> {
		return _DOMFrames;
	}

	public function set DOMFrames(value:Vector.<DOMFrame>):void {
		_DOMFrames = value;
	}

	public function get xml():XML {
		var _xml:XML = new XML(<DOMLayer/>);
		if(name      )_xml.@name      = name;
		if(color     )_xml.@color     = color;
		if(current   )_xml.@current   = current;
		if(isSelected)_xml.@isSelected= isSelected;
		if(autoNamed )_xml.@autoNamed = autoNamed;
		if(DOMFrames.length>0)_xml.appendChild(<frames/>);
		for (var i:int = 0; i < DOMFrames.length; i++) {
			var domFrame:DOMFrame = DOMFrames[i];
			_xml.frames.appendChild(domFrame.xml);
		}
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		if(value.@name      )name      =value.@name;
		if(value.@color     )color     =value.@color;
		if(value.@current   )current   =value.@current;
		if(value.@isSelected)isSelected=value.@isSelected;
		if(value.@autoNamed )autoNamed =value.@autoNamed;
		var xmlList:XMLList = value.frames..DOMFrame;
		var domFrame:DOMFrame;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var item:XML = xmlList[i];
			domFrame = new DOMFrame();
			domFrame.xml = item;
			DOMFrames.push(domFrame);
		}
	}
}
}
