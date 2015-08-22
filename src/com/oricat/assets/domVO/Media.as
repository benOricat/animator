/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 20:42
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class Media implements ISetXML{

	private var _DOMBitmapItems:Vector.<DOMBitmapItem>;
	public var nameSpace:Namespace;

	public function Media() {
		_DOMBitmapItems = new Vector.<DOMBitmapItem>();
	}

	public function get DOMBitmapItems():Vector.<DOMBitmapItem> {
		return _DOMBitmapItems;
	}

	public function set DOMBitmapItems(value:Vector.<DOMBitmapItem>):void {
		_DOMBitmapItems = value;
	}

	public function get xml():XML {
		var _xml:XML = <media/>;
		for (var i:int = 0; i < DOMBitmapItems.length; i++) {
			var domBitmapItem:DOMBitmapItem = DOMBitmapItems[i];
			_xml.appendChild(domBitmapItem.xml);
		}
		return _xml;
	}

	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;

		var xmlList:XMLList = value..DOMBitmapItem;
		var domBitmapItem:DOMBitmapItem;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var itemXml:XML = xmlList[i];
			domBitmapItem = new DOMBitmapItem();
			domBitmapItem.xml = itemXml;
			DOMBitmapItems.push(domBitmapItem);
		}
	}
}
}
