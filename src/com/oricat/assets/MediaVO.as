/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 15/06/14
 * Time: 14:28
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets {

public class MediaVO {

	/**
	 * MediaVO stores a media node from the DOM file. The media node references links items on the stage to their
	 * library location. In this context it is used to map new assets to replaced stage items.
	 */
	public function MediaVO(){}


//		<DOMBitmapItem name="portugal 119.JPG" itemID="5398a24f-0000001f" allowSmoothing="true" quality="50" href="portugal 119.JPG" frameRight="72960" frameBottom="54720" isJPEG="true"/>

	public var name:String;// 				="portugal 119.JPG"
	public var itemID:String;// 			="5398a24f-0000001f"
	public var allowSmoothing:String;// 	="true"
	public var quality:String;// 			="50"
	public var href:String;// 				="portugal 119.JPG"
	public var frameRight:String;// 		="72960"
	public var frameBottom:String;// 		="54720"
	public var isJPEG:String;// 			="true"

	public function setXml(mediaNode:XML, ns:Namespace):void{
		default xml namespace = ns;
		//var mediaVO:MediaVO = new MediaVO();
		if(mediaNode.@name)                      name = mediaNode.@name;
		if(mediaNode.@itemID)                  itemID = mediaNode.@itemID;
		if(mediaNode.@allowSmoothing)  allowSmoothing = mediaNode.@allowSmoothing ;
		if(mediaNode.@quality)  	          quality = mediaNode.@quality;
		if(mediaNode.@href)                      href = mediaNode.@href;
		if(mediaNode.@frameRight)          frameRight = mediaNode.@frameRight;
		if(mediaNode.@frameBottom)        frameBottom = mediaNode.@frameBottom;
		if(mediaNode.@isJPEG)                  isJPEG = mediaNode.@isJPEG;
		default xml namespace = new Namespace();
	}

	public function toString():String{
		return "MediaVO name="+name+" itemID="+itemID+" allowSmoothing="+allowSmoothing+" quality="+quality+" href="+href+" frameRight="+frameRight+" frameBottom="+frameBottom+" isJPEG="+isJPEG;
	}

	public function get xml():XML{
		return <DOMBitmapItem name={name} itemID={itemID} allowSmoothing={allowSmoothing} quality={quality} href={href} frameRight={frameRight} frameBottom={frameBottom} isJPEG={isJPEG}/>;

	}

	public function clone():MediaVO{
		var mediaVO:MediaVO = new MediaVO();
		mediaVO.name           = name;
		mediaVO.itemID         = itemID;
		mediaVO.allowSmoothing = allowSmoothing;
		mediaVO.quality        = quality;
		mediaVO.href           = href;
		mediaVO.frameRight     = frameRight;
		mediaVO.frameBottom    = frameBottom;
		mediaVO.isJPEG	       = isJPEG;
		return mediaVO;
	}

}
}
