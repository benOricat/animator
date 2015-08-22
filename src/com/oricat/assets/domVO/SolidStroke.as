/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class SolidStroke implements ISetXML{

	public var scaleMode:String;
    public var caps:String;
    private var _weight:String;
    public var joints:String;
    public var solidColor:SolidColor;
    public var linearGradient:LinearGradient;


	public function get xml():XML {
		var _xml:XML = <SolidStroke/>;
		if(scaleMode    )   _xml.@scaleMode     = scaleMode;
		if(caps         )   _xml.@caps          = caps;
		if(_weight      )   _xml.@weight        = _weight;
		if(joints       )   _xml.@joints        = joints;
        if(solidColor)_xml.appendChild(<fill/>.appendChild(solidColor.xml));
        if(linearGradient)_xml.appendChild(<fill/>.appendChild(linearGradient.xml));
        return _xml;
	}

    public var nameSpace:Namespace;
	public function set xml(value:XML):void {
        nameSpace = value.namespace();
        default xml namespace = nameSpace;

        if(value.@scaleMode )scaleMode  = value.@scaleMode;
		if(value.@caps      )caps       = value.@caps;
		if(value.@weight    )_weight     = value.@weight;
		if(value.@joints    )joints     = value.@joints;
        if(value.fill.SolidColor && value.fill.SolidColor.length()>0){
            solidColor = new SolidColor();
            solidColor.xml = value.fill.SolidColor[0];
        }
        if(value.fill.LinearGradient && value.fill.LinearGradient.length()>0){
            linearGradient = new LinearGradient();
            linearGradient.xml = value.fill.LinearGradient[0];
        }
    }

    public function get weight():Number {
        if(_weight)
        {
            return parseFloat(_weight);
        }
        return 1;
    }

    public function set weight(value:Number):void {
        _weight = value.toString();
    }
}

/*
<StrokeStyle index="1">
    <SolidStroke scaleMode="normal" caps="none" weight="0.1" joints="bevel">
        <fill>
            <SolidColor/>
        </fill>
    </SolidStroke>
</StrokeStyle>
*/
}
