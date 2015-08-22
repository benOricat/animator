/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 09/06/14
 * Time: 20:23
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.file {
public interface IMultiFileStream extends IFileStream{
	function get files():Vector.<IFileStream>;
	function set files(value:Vector.<IFileStream>):void;

}
}
