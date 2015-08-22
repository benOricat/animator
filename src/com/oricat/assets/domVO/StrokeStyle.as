/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {
public class StrokeStyle implements ISetXML{
	public function StrokeStyle() {
	}

	public var index:String;
	public var solidStroke:SolidStroke;

	public function get xml():XML {
		var _xml:XML = <StrokeStyle/>;
		if(index)_xml.@index = index;
		if(solidStroke)_xml.appendChild(solidStroke.xml);
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		if(value.@index)index = value.@index;
		if(value.SolidStroke){
            solidStroke = new SolidStroke();
            solidStroke.xml = value.SolidStroke[0];
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

    <StrokeStyle index="1">
        <SolidStroke scaleMode="normal">
            <fill>
                <SolidColor/>
            </fill>
        </SolidStroke>
    </StrokeStyle>
*/
}
}
