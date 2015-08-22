/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 10/07/14
 * Time: 22:15
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
public class Point implements ISetXML{

	public var x:String;
	public var y:String;

	public function get xml():XML {
		var _xml:XML = <Point/>;
		if(x)_xml.@x = x;
		if(y)_xml.@y = y;
		return _xml;
	}

	public function set xml(value:XML):void {
		if(value.@x)x = value.@x;
		if(value.@y)y = value.@y;
	}
}
}
