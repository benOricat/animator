/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
public class FillStyle implements ISetXML{
	public function FillStyle() {
	}

	public var index:String;
	public var solidColor:SolidColor;
    public var linearGradient:LinearGradient;

	public function get xml():XML {
		var _xml:XML = <FillStyle/>;
		if(index)_xml.@index = index;
		if(solidColor)_xml.appendChild(solidColor.xml);
        if(linearGradient)_xml.appendChild(linearGradient.xml);

        return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		if(value.@index)index = value.@index;
		if(value.SolidColor && value.SolidColor.length()>0){
			solidColor = new SolidColor();
			solidColor.xml = value.SolidColor[0];
		}
        if(value.LinearGradient && value.LinearGradient.length()>0){
            linearGradient = new LinearGradient();
            linearGradient.xml = value.LinearGradient[0];
        }

    }
}
}
/*
 <FillStyle index="1">
 <LinearGradient>
 <matrix>
 <Matrix a="0.0567626953125" d="0.0360107421875" tx="46.5" ty="29.5"/>
 </matrix>
 <GradientEntry color="#FFFFFF" ratio="0"/>
 <GradientEntry ratio="1"/>
 </LinearGradient>
 </FillStyle>
*/