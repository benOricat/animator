/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 20:42
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class Timelines implements ISetXML{

	private var _DOMTimelines:Vector.<DOMTimeline>;

	public function Timelines() {
		_DOMTimelines = new Vector.<DOMTimeline>();
	}

	public function get DOMTimelines():Vector.<DOMTimeline> {
		return _DOMTimelines;
	}

	public function set DOMTimelines(value:Vector.<DOMTimeline>):void {
		_DOMTimelines = value;
	}

	public function get xml():XML {
		var _xml:XML = <timelines/>;
		for (var i:int = 0; i < DOMTimelines.length; i++) {
			var domTimeline:DOMTimeline = DOMTimelines[i];
			_xml.appendChild(domTimeline.xml);
		}
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		var xmlList:XMLList = value..DOMTimeline;
		var domTimeline:DOMTimeline;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var itemXml:XML = xmlList[i];
			domTimeline = new DOMTimeline();
			domTimeline.xml = itemXml;
			DOMTimelines.push(domTimeline);
		}
	}
}
}
