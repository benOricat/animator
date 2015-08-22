/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 21:15
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMBitmapItem implements ISetXML{

	public var name:String;
	public var itemID:String;
	public var sourceExternalFilepath:String;
	public var sourceLastImported:String;
	public var externalFileSize:String;
	public var allowSmoothing:String;
	public var quality:String;
	public var href:String;
	public var bitmapDataHRef:String;
	public var frameRight:String;
	public var frameBottom:String;
	public var isJPEG:String;

	public function get xml():XML {
		var _xml:XML = new XML(<DOMBitmapItem/>);
		if(name                   )_xml.@name                   = name                   ;
		if(itemID                 )_xml.@itemID                 = itemID                 ;
		if(sourceExternalFilepath )_xml.@sourceExternalFilepath = sourceExternalFilepath ;
		if(sourceLastImported     )_xml.@sourceLastImported     = sourceLastImported     ;
		if(externalFileSize       )_xml.@externalFileSize       = externalFileSize       ;
		if(allowSmoothing         )_xml.@allowSmoothing         = allowSmoothing         ;
		if(quality                )_xml.@quality                = quality                ;
		if(href                   )_xml.@href                   = href                   ;
		if(bitmapDataHRef         )_xml.@bitmapDataHRef         = bitmapDataHRef         ;
		if(frameRight             )_xml.@frameRight             = frameRight             ;
		if(frameBottom            )_xml.@frameBottom            = frameBottom            ;
		if(isJPEG                 )_xml.@isJPEG                 = isJPEG                 ;

		return _xml;
	}

	public function set xml(value:XML):void {
		if(value.@name                  )name                  =value.@name                   ;
		if(value.@itemID                )itemID                =value.@itemID                 ;
		if(value.@sourceExternalFilepath)sourceExternalFilepath=value.@sourceExternalFilepath ;
		if(value.@sourceLastImported    )sourceLastImported    =value.@sourceLastImported     ;
		if(value.@externalFileSize      )externalFileSize      =value.@externalFileSize       ;
		if(value.@allowSmoothing        )allowSmoothing        =value.@allowSmoothing         ;
		if(value.@quality               )quality               =value.@quality                ;
		if(value.@href                  )href                  =value.@href                   ;
		if(value.@bitmapDataHRef        )bitmapDataHRef        =value.@bitmapDataHRef         ;
		if(value.@frameRight            )frameRight            =value.@frameRight             ;
		if(value.@frameBottom           )frameBottom           =value.@frameBottom            ;
		if(value.@isJPEG                )isJPEG                =value.@isJPEG                 ;

	}
}
}
