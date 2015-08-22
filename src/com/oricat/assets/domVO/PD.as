/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 13/07/14
 * Time: 10:14
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
public class PD implements ISetXML{

	public var n:String;
	public var v:String;


	public function get xml():XML {
		var _xml:XML =  <PD/>;
		if(n)_xml.@n = n;
		if(v)_xml.@v = v;
		return _xml;
	}

	public function set xml(value:XML):void {
		if(value.@n)n = value.@n;
		if(value.@v){
			v = value.@v;
		}
	}
}
}
