/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 25/06/14
 * Time: 22:31
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMBitmapInstance implements ISetXML,IElement{

	public function DOMBitmapInstance() {
	}

	public function get type():Class {
		return DOMBitmapInstance;
	}

	public var libraryItemName:String;

	public var matrix:Matrix;

	public function get xml():XML {
		var _xml:XML = <DOMBitmapInstance/>;
		if(libraryItemName)_xml.@libraryItemName = libraryItemName;
		if(matrix){
			_xml.appendChild(<matrix/>);
			_xml.matrix.appendChild(matrix.xml);
		}
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		if(value.@libraryItemName)libraryItemName = value.@libraryItemName;
		var xmlList:XMLList = value.matrix..Matrix;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var item:XML = xmlList[i];
			matrix = new Matrix();
			matrix.xml = item;
		}
	}
}
}
