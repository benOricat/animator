/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 10/07/14
 * Time: 22:30
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
public class Include implements ISetXML {

	public var href         :String;
	public var loadImmediate:String;
	public var itemID       :String;
	public var lastModified :String;

	public function get xml():XML {
		var _xml:XML = <Include/>;
		if(href         )_xml.@href          = href         ;
		if(loadImmediate)_xml.@loadImmediate = loadImmediate;
		if(itemID       )_xml.@itemID        = itemID       ;
		if(lastModified )_xml.@lastModified  = lastModified ;
		return _xml;
	}

	public function set xml(value:XML):void {
		if(value.@href         )href          = value.@href         ;
		if(value.@loadImmediate)loadImmediate = value.@loadImmediate;
		if(value.@itemID       )itemID        = value.@itemID       ;
		if(value.@lastModified )lastModified  = value.@lastModified ;
	}
}
}
