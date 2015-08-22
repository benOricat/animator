/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 20:42
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class PersistentData implements ISetXML{

	public var PDs:Vector.<PD>;

	public function PersistentData() {
		PDs = new Vector.<PD>();
	}


	public function get xml():XML {
		var _xml:XML = <persistentData/>;
		var pd:PD;
		for (var i:int = 0; i < PDs.length; i++) {
			pd = PDs[i];
			_xml.appendChild(pd.xml);
		}
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;
		var xmlList:XMLList = value..PD;
		var _pd:PD;
		for (var i:int = 0; i < xmlList.length(); i++) {
			var item:XML = xmlList[i];
			_pd = new PD();
			_pd.xml = item;
			PDs.push(_pd);
		}
	}
}
}
