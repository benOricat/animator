/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class SolidColor implements ISetXML{

    private var _color:String;
    private var _alpha:String;

	public function get xml():XML {
		var _xml:XML = <SolidColor/>;
        if(_color)_xml.@color = _color;
        if(_alpha)_xml.@alpha = _alpha;
		return _xml;
	}

	public function set xml(value:XML):void
    {
        if(value && value.@color)_color = value.@color;
        if(value && value.@alpha)_alpha = value.@alpha;
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
