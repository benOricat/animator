/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 25/06/14
 * Time: 22:31
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMShape implements ISetXML,IElement{

	public function get type():Class {
		return DOMShape;
	}

	public function DOMShape() {
		_fills = new <FillStyle>[];
		_edges = new <Edge>[];
        _strokes = new <StrokeStyle>[];
	}

    private var _fills:Vector.<FillStyle>;

    public function get fills():Vector.<FillStyle> {
        return _fills;
    }

    public function set fills(value:Vector.<FillStyle>):void {
        _fills = value;
    }

    private var _strokes:Vector.<StrokeStyle>;

    public function get strokes():Vector.<StrokeStyle> {
        return _strokes;
    }

    public function set strokes(value:Vector.<StrokeStyle>):void {
        _strokes = value;
    }

	private var _edges:Vector.<Edge>;

	public function get edges():Vector.<Edge> {
		return _edges;
	}

	public function set edges(value:Vector.<Edge>):void {
		_edges = value;
	}


	public function get xml():XML {
		var _xml:XML = <DOMShape/>;
        if(fills && fills.length>0)
        {
            _xml.appendChild(<fills/>);
            for (var i:int = 0; i < fills.length; i++) {
                var fillStyle:FillStyle = fills[i];
                _xml.fills.appendChild(fillStyle.xml);
            }
        }
        if(strokes && strokes.length)
        {
            _xml.appendChild(<strokes/>);
            for (var i:int = 0; i < strokes.length; i++) {
                var strokeStyle:StrokeStyle = strokes[i];
                _xml.strokes.appendChild(strokeStyle.xml);
            }
        }
        if(edges && edges.length)
        {
            _xml.appendChild(<edges/>);
            for (i = 0; i < edges.length; i++) {
                var edge:Edge = edges[i];
                _xml.edges.appendChild(edge.xml);
            }
        }
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		var xmlList:XMLList;
        xmlList = value.fills..FillStyle;
        var fillStyle:FillStyle;
        var item:XML;
        for (var i:int = 0; i < xmlList.length(); i++) {
            item = xmlList[i];
            fillStyle = new FillStyle();
            fillStyle.xml = item;
            fills.push(fillStyle);
        }


        xmlList = value.strokes..StrokeStyle;
        var strokeStyle:StrokeStyle;
        var item:XML;
        for (var i:int = 0; i < xmlList.length(); i++) {
            item = xmlList[i];
            strokeStyle = new StrokeStyle();
            strokeStyle.xml = item;
            strokes.push(strokeStyle);
        }

		xmlList = value.edges..Edge;
		var edge:Edge;
		for ( i = 0; i < xmlList.length(); i++) {
			item = xmlList[i];
			edge = new Edge();
			edge.xml = item;
			edges.push(edge);
		}

	}

}
}
