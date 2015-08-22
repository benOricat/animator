/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 25/06/14
 * Time: 22:31
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMSymbolInstance implements ISetXML,IElement{

	public var libraryItemName:String;
	public var selected:String;
	public var matrix:Matrix;
	public var point:Point;

	public function get type():Class {
		return DOMSymbolInstance;
	}

	public var nameSpace:Namespace;
	public function get xml():XML {
		var _xml:XML = <DOMSymbolInstance/>;
		if(libraryItemName)_xml.@libraryItemName = libraryItemName;
		if(selected)_xml.@selected = selected;
		if(matrix){
			_xml.appendChild(<matrix/>);
			_xml.matrix.appendChild(matrix.xml);
		}
		if(point){
			_xml.appendChild(<transformationPoint/>);
			_xml.transformationPoint.appendChild(point.xml);
		}
		return _xml;
	}

	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		if(value.@libraryItemName)libraryItemName = value.@libraryItemName;
		if(value.@selected)selected = value.@selected;
		var xmlList:XMLList;
		xmlList = value.matrix..Matrix;
		var item:XML;
		for (var i:int = 0; i < xmlList.length(); i++) {
			item = xmlList[i];
			matrix = new Matrix();
			matrix.xml = item;
		}
		xmlList = value.transformationPoint..Point;
		for (i = 0; i < xmlList.length(); i++) {
			item = xmlList[i];
			point = new Point();
			point.xml = item;
		}
	}

}
}