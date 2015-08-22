/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 07/06/14
 * Time: 10:52
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.file {
import flash.display.Bitmap;

public interface IImageFileStream extends IFileStream{
	function get bitmap():Bitmap;
	function set bitmap(value:Bitmap):void;
	function clone():IImageFileStream;
}
}
