/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 13/07/14
 * Time: 11:25
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class PublishHistory implements ISetXML{

	public var publishItems:Vector.<PublishItem>;

	public function PublishHistory() {
		publishItems = new Vector.<PublishItem>();
	}

	public function get xml():XML {
		var _xml:XML = <publishHistory/>;
		var publishItem:PublishItem;
		for (var i:int = 0; i < publishItems.length; i++) {
			publishItem = publishItems[i];
			_xml.appendChild(publishItem.xml);
		}
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		var xmlList:XMLList = value..PublishItem;
		var pi:PublishItem;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var item:XML = xmlList[i];
			pi = new PublishItem();
			pi.xml = item;
			publishItems.push(pi);
		}
	}
}
}
