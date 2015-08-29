/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
import flash.geom.Matrix;

public class Matrix implements ISetXML{

	public var a:String;
	public var b:String;
	public var c:String;
	public var d:String;
	public var tx:String;
	public var ty:String;

	public function get xml():XML {
		var _xml:XML = <Matrix/>;
		if(a)_xml.@a = a;
		if(b)_xml.@b = b;
		if(c)_xml.@c = c;
		if(d)_xml.@d = d;
		if(tx)_xml.@tx = tx;
		if(ty)_xml.@ty = ty;
		return _xml;
	}

	public function set xml(value:XML):void {
		if(value.@a)a = value.@a;
		if(value.@b)b = value.@b;
		if(value.@c)c = value.@c;
		if(value.@d)d = value.@d;
		if(value.@tx)tx = value.@tx;
		if(value.@ty)ty = value.@ty;
	}

    public function getInstanceMatrix():flash.geom.Matrix {
        return new flash.geom.Matrix(	a?Number(a):1,
                b?Number(b):0,
                c?Number(c):0,
                d?Number(d):1,
                tx?Number(tx):0,
                ty?Number(ty):0);
    }

    public function getMatrix():flash.geom.Matrix {
        return new flash.geom.Matrix(	a?Number(a):1,
                b?Number(b):0,
                c?Number(c):0,
                d?Number(d):1,
                tx?Number(tx)/20:0,
                ty?Number(ty)/20:0);
    }

	public function setMatrix(value:flash.geom.Matrix) {
		a=String(value.a);
		b=String(value.b);
		c=String(value.c);
		d=String(value.d),
		tx=String(value.tx);
		ty=String(value.ty);
	}
}
}
