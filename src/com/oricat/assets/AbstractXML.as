/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 01/08/14
 * Time: 07:17
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets {
public class AbstractXML {
	public function AbstractXML(value:Object) {
		_xml = new XML(value);
	}

	public static function get ignoreComments(): Boolean{return XML.ignoreComments;}
	public static function get ignoreProcessingInstructions() : Boolean{return XML.ignoreProcessingInstructions;}
	public static function get ignoreWhitespace() : Boolean{return XML.ignoreWhitespace;}
	public static function get prettyIndent() : int{return XML.prettyIndent;}
	public static function get prettyPrinting() : Boolean{return XML.prettyPrinting;}

	public static function set ignoreComments(value:Boolean):void{XML.ignoreComments=value;}
	public static function set ignoreProcessingInstructions(value:Boolean):void {XML.ignoreProcessingInstructions=value;}
	public static function set ignoreWhitespace(value: Boolean):void {XML.ignoreWhitespace=value;}
	public static function set prettyIndent(value: int):void {XML.prettyIndent=value;}
	public static function set prettyPrinting(value: Boolean):void {XML.prettyPrinting=value;}


	public function defaultSettings():Object{return XML.defaultSettings();}

	private var _xml:XML;

	public function addNamespace(ns:Object):XML{return _xml.addNamespace(ns);}
	public function appendChild(child:Object):XML{return _xml.appendChild(child);}
	public function attribute(attributeName:*):XMLList{return _xml.attribute(attributeName);}
	public function attributes():XMLList{return _xml.attributes();}
	public function child(propertyName:Object):XMLList{return child(propertyName);}
	public function childIndex():int{return _xml.childIndex();}
	public function children():XMLList{return _xml.children();}
	public function comments():XMLList{return _xml.comments();}
	public function contains(value:XML):Boolean{return _xml.contains(value);}
	public function copy():XML{return _xml.copy();}
	public function descendants(name:Object =  "*"):XMLList{return _xml.descendants(name);}
	public function elements(name:Object =  "*"):XMLList{return _xml.elements(name);}
	public function hasComplexContent():Boolean{return _xml.hasComplexContent();}
	public function hasOwnProperty(p:String):Boolean{return _xml.hasOwnProperty(p);}
	public function hasSimpleContent():Boolean{return _xml.hasSimpleContent();}
	public function inScopeNamespaces():Array{return _xml.inScopeNamespaces();}
	public function insertChildAfter(child1:Object, child2:Object):*{return _xml.insertChildAfter(child1,child2);}
	public function insertChildBefore(child1:Object, child2:Object):*{return _xml.insertChildBefore(child1,child2);}
	public function length():int{return _xml.length()}
	public function localName():Object{return _xml.localName()}
	public function name():Object{return _xml.name()}
	public function namespace(prefix:String = null):*{return _xml.namespace(prefix)}
	public function namespaceDeclarations():Array{return _xml.namespaceDeclarations()}
	public function nodeKind():String{return _xml.nodeKind()}
	public function normalize():XML{return _xml.normalize()}
	public function parent():*{return _xml.parent()}
	public function prependChild(value:Object):XML{return _xml.prependChild(value)}
	public function processingInstructions(name:String = "*"):XMLList{return _xml.processingInstructions(name)}
	public function propertyIsEnumerable(p:String):Boolean{return _xml.propertyIsEnumerable(p);}
	public function removeNamespace(ns:Namespace):XML{return _xml.removeNamespace(ns);}
	public function replace(propertyName:Object, value:XML):XML{return _xml.replace(propertyName,value)}
	public function setChildren(value:Object):XML{return _xml.setChildren(value);}
	public function setLocalName(name:String):void{return _xml.setLocalName(name);}
	public function setName(name:String):void{return _xml.setName(name);}
	public function setNamespace(ns:Namespace):void{return _xml.setNamespace(ns);}
	public function setSettings(... rest):void{return XML.setSettings(rest);}
	public function settings():Object{return XML.settings();}
	public function text():XMLList{return _xml.text()}
	public function toJSON(k:String):*{return _xml.toJSON(k);}
	public function toString():String{return _xml.toString();}
	public function toXMLString():String{return _xml.toXMLString()}
	public function valueOf():XML{return _xml.valueOf()}


}
}
