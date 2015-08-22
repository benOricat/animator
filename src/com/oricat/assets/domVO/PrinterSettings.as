/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 20:42
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class PrinterSettings implements ISetXML{
	public function PrinterSettings() {
	}

	public function get xml():XML {
		var _xml:XML = <PrinterSettings/>;
		return _xml;
	}

	public var nameSpace:Namespace;
	public function set xml(value:XML):void {
		nameSpace = value.namespace();
		default xml namespace = nameSpace;

		//TODO add children once I have discovered what they are
	}
}
}
