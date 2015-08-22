/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 25/06/14
 * Time: 22:12
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMFrame implements ISetXML{

	private var _elements:Vector.<IElement>;

	public function DOMFrame() {
		_elements = new Vector.<IElement>();
	}
	public var index:String;
	public var duration:String;
	public var name:String;
	public var labelType:String;
	public var keyMode:String;


	public function get elements():Vector.<IElement> {
		return _elements;
	}

	public function set elements(value:Vector.<IElement>):void {
		_elements = value;
	}

	public function get xml():XML {
		var _xml:XML = <DOMFrame/>;
		if(index    )_xml.@index     = index    ;
		if(duration )_xml.@duration  = duration ;
		if(name     )_xml.@name      = name     ;
		if(labelType)_xml.@labelType = labelType;
		if(keyMode  )_xml.@keyMode   = keyMode  ;
		_xml.appendChild(<elements/>);
		for (var i:int = 0; i < elements.length; i++) {
			var element:ISetXML = elements[i] as ISetXML;
			_xml.children()[0].appendChild(element.xml);
		}
		return _xml;
	}

    public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		if(value.@index    ) index     = value.@index    ;
		if(value.@duration ) duration  = value.@duration ;
		if(value.@name     ) name      = value.@name     ;
		if(value.@labelType) labelType = value.@labelType;
		if(value.@keyMode  ) keyMode   = value.@keyMode  ;

		var xmlList:XMLList = value.children()[0].children();
		var element:ISetXML;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var item:XML = xmlList[i];
			switch(item.name().localName){
				case "DOMShape":
					element = new DOMShape();
					break;
				case "DOMBitmapInstance":
					element = new DOMBitmapInstance();
					break;
				case "DOMSymbolInstance":
					element = new DOMSymbolInstance();
					break;
			}
            if(element)
            {
                element.xml = item;
                elements.push(element);
            }
		}
	}
}
}
