/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class GradientEntry implements ISetXML{

	private var _color:String;
	private var _ratio:String;
    private var _alpha:String;

	public function get xml():XML {
		var _xml:XML = <GradientEntry/>;
        if(_color)_xml.@color = _color;
        if(_ratio)_xml.@ratio = _ratio;
		return _xml;
	}

	public function set xml(value:XML):void
    {
		if(value.@color)_color = value.@color;
		if(value.@ratio)_ratio = value.@ratio;
		if(value.@alpha)_alpha = value.@alpha;
	}

    public function get color():int {
        if(_color)
        {
            return parseInt("0x"+_color.substr(1));
        }
        return 0;
    }

    public function set color(value:int):void {
        _color = "#"+value.toString(16);
    }

    public function get ratio():Number{
        return parseFloat(_ratio);
    }

    public function set ratio(value:Number):void {
        _ratio = value.toString();
    }

    public function get alpha():Number {
        if(_alpha)
        {
            return parseFloat(_alpha);
        }
        return 1;
    }

    public function set alpha(value:Number):void {
        _alpha = value.toString();
    }
}
}
