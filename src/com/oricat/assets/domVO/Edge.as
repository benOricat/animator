/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
public class Edge implements ISetXML{
	public var fillStyle1:String;
	public var strokeStyle:String;
    public var edges:String;
    public var cubics:String;

	public function get xml():XML {
		var _xml:XML = <Edge/>;
		if(fillStyle1)_xml.@fillStyle1 = fillStyle1;
		if(strokeStyle)_xml.@strokeStyle = strokeStyle;
		if(edges)_xml.@edges = edges;
		if(cubics)_xml.@cubics = cubics;
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		if(value.@fillStyle1)fillStyle1 = value.@fillStyle1;
		if(value.@strokeStyle)strokeStyle = value.@strokeStyle;
		if(value.@edges)edges = value.@edges;
        //TODO replace &#xD; /r   &#xA; /n in final output and remove 2 lines below
        edges = edges.split("\n").join("");
        edges = edges.split("\r").join("");
		if(value.@cubics)cubics = value.@cubics;
	}
}
}
