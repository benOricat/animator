/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/07/14
 * Time: 23:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class LinearGradient implements ISetXML{

    public var matrix:Matrix;
    public var gradients:Vector.<GradientEntry> = new <GradientEntry>[];

	public function get xml():XML {
		var _xml:XML = <LinearGradient/>;
        if(matrix){
            _xml.appendChild(<matrix/>);
            _xml.matrix.appendChild(matrix.xml);
        }
        for (var i:int = 0; i < gradients.length; i++) {
            _xml.appendChild(gradients[i].xml);
        }
		return _xml;
	}

    public var nameSpace:Namespace;
	public function set xml(value:XML):void
    {
        nameSpace = value.namespace();
        default xml namespace = nameSpace;
        var xmlList:XMLList = value.matrix..Matrix;
        for (var i:int = 0; i < xmlList.length(); i++) {
            var item:XML = xmlList[i];
            matrix = new Matrix();
            matrix.xml = item;
        }
        xmlList = value..GradientEntry;
        var gradientEntry:GradientEntry;
        for (var i:int = 0; i < xmlList.length(); i++) {
            var item:XML = xmlList[i];
            gradientEntry = new GradientEntry();
            gradientEntry.xml = item;
            gradients.push(gradientEntry);
        }
	}
}
}
/*
<LinearGradient>
    <matrix>
        <Matrix a="0.10992431640625" d="0.06353759765625" tx="103" ty="83"/>
    </matrix>
    <GradientEntry color="#FFFFFF" ratio="0"/>
    <GradientEntry ratio="1"/>
</LinearGradient>
*/
