/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 10/07/14
 * Time: 22:41
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class Symbols implements ISetXML{

	private var _includes:Array;

	public function Symbols() {
		_includes = [];
	}

	public function get includes():Array {
		return _includes;
	}

	public function set includes(value:Array):void {
		_includes = value;
	}

	public function get xml():XML {
		var _xml:XML = <symbols/>;
		for (var i:int = 0; i < includes.length; i++) {
			_xml.appendChild(Include(includes[i]).xml);
		}
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		var xmlList:XMLList = value..Include;
		var _include:Include;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var item:XML = xmlList[i];
			_include = new Include();
			_include.xml = item;
			includes.push(_include);
		}
	}
}
}
