/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 13/07/14
 * Time: 12:18
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
public class PublishItem implements ISetXML{

	public var publishSize:String;
	public var publishTime:String;

	public function get xml():XML {
		var _xml:XML = <PublishItem/>;
		if(publishSize)_xml.@publishSize = publishSize;
		if(publishTime)_xml.@publishTime = publishTime;
		return _xml;
	}

	public function set xml(value:XML):void {
		if(value.@publishSize)publishSize = value.@publishSize;
		if(value.@publishTime)publishTime = value.@publishTime;
	}
}
}
