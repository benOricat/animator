/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 03/06/14
 * Time: 13:38
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.file {
import flash.filesystem.File;

public class FileStatics {


	public static var IMAGE_TYPE_JPG:Array = [".jpg",".jpeg"];
	public static var IMAGE_TYPE_PNG:Array = [".png"];
	public static function IMAGE_TYPE(type:String):Array{
		if(IMAGE_TYPE_JPG.indexOf(type.toLowerCase())!=-1)
		{
			return IMAGE_TYPE_JPG;
		}
		else if(IMAGE_TYPE_PNG.indexOf(type.toLowerCase())!=-1)
		{
			return IMAGE_TYPE_PNG;
		}
		return null;
	}


	public static var FILE_TYPES_IMAGE:Array = [".png",".jpg",".jpeg"];
	public static var FILE_TYPES_XML:Array = [".xml"];
	public static function FILE_TYPE(type:String):Array{
		if(FILE_TYPES_IMAGE.indexOf(type.toLowerCase())!=-1)
		{
			return FILE_TYPES_IMAGE;
		}
		else if(FILE_TYPES_XML.indexOf(type.toLowerCase())!=-1)
		{
			return FILE_TYPES_XML;
		}
		return null;
	}


	public static var LOAD_DIR:File = File.applicationDirectory;
	public static var LOAD_PROJECT_DIR:String = "source/";//"xfl/webAS3/";

	public static var SAVE_DIR:File = File.documentsDirectory;
	public static var SAVE_PROJECT_DIR:String = "xfl/exported/";
}
}
