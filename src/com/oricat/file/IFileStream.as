/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 07/06/14
 * Time: 10:49
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.file {
public interface IFileStream {
	function load(path:String):Boolean;

	function save(path:String = null):Boolean;

	function get savePath():String;

	function set savePath(value:String):void;

	function get loadPath():String;

	function set loadPath(value:String):void;
}
}
