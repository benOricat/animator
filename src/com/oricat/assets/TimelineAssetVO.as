/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 11/06/14
 * Time: 21:07
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets {
import flash.geom.Matrix;

public class TimelineAssetVO {

	/**
	 * TimelineAssetVO is a store for a timeline asset it is linked to keyframe labels on the screens layer
	 * so that assets can be tagged to the screen they come from.
	 */
	public function TimelineAssetVO(){}

	private var xmlSample:XML =

	<DOMFrame index="10" duration="10" keyMode="9728" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://ns.adobe.com/xfl/2008/">
		<elements>
			<DOMBitmapInstance libraryItemName="portugal 129.JPG">
				<matrix>
					<Matrix a="0.140350341796875" d="0.140350341796875"/>
				</matrix>
			</DOMBitmapInstance>
		</elements>
	</DOMFrame>;

	public var index:String;
	public var name:String;
	public var libraryItemName:String;
	public var matrix:Matrix;

	public function toString():String{
		var str:String = "TimelineAssetVO:";
		str+="\n	name:"+name;
		str+="\n	libraryItemName:"+libraryItemName;
		str+="\n	index:"+index;
		str+="\n	matrix:"+matrix;
		return str;
	}
}
}
