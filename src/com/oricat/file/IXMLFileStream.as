/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 03/06/14
 * Time: 21:21
 * Copyright 2014 Benjamin Simon Bath

 */
package com.oricat.file {
public interface IXMLFileStream extends IFileStream {
	function get xml():XML;
	function set xml(value:XML):void;

}
}
