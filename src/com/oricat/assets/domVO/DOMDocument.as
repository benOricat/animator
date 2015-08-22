/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 24/06/14
 * Time: 20:37
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets.domVO {

public class DOMDocument implements ISetXML{

	public function DOMDocument() {
	}

	public var xmlns:String;
	public var width:String;
	public var height:String;
	public var currentTimeline:String;
	public var xflVersion:String;
	public var creatorInfo:String;
	public var platform:String;
	public var versionInfo:String;
	public var majorVersion:String;
	public var minorVersion:String;
	public var buildNumber:String;
	public var objectsSnapTo:String;
	public var viewAngle3D:String;
	public var nextSceneIdentifier:String;
	public var playOptionsPlayLoop:String;
	public var playOptionsPlayPages:String;
	public var playOptionsPlayFrameActions:String;
	public var filetypeGUID:String;

	private var _media:Media;
	private var _timelines:Timelines;
	private var _persistentData:PersistentData;
	private var _printerSettings:PrinterSettings;
	private var _publishHistory:PublishHistory;

	public var symbols:Symbols;
	public var nameSpace:Namespace;

	public function get media():Media{
		return _media;
	}

	public function set media(value:Media):void {
		_media = value;
	}

	public function get timelines():Timelines {
		return _timelines;
	}

	public function set timelines(value:Timelines):void {
		_timelines = value;
	}

	public function get persistentData():PersistentData {
		return _persistentData;
	}

	public function set persistentData(value:PersistentData):void {
		_persistentData = value;
	}

	public function get printerSettings():PrinterSettings {
		return _printerSettings;
	}

	public function set printerSettings(value:PrinterSettings):void {
		_printerSettings = value;
	}

	public function get publishHistory():PublishHistory{
		return _publishHistory;
	}

	public function set publishHistory(value:PublishHistory):void {
		_publishHistory = value;
	}

	public function get xml():XML {
		var _xml:XML = new XML(<DOMDocument/>);
		for (var i:int = 0; i < namespaces.length; i++) {
			var ns:Object = namespaces[i];
			_xml.setNamespace(ns);
		}
		if(xmlns                      )_xml.@xmlns                       = xmlns                      ;
		if(width                      )_xml.@width                       = width                      ;
		if(height                     )_xml.@height                      = height                     ;
		if(currentTimeline            )_xml.@currentTimeline             = currentTimeline            ;
		if(xflVersion                 )_xml.@xflVersion                  = xflVersion                 ;
		if(creatorInfo                )_xml.@creatorInfo                 = creatorInfo                ;
		if(platform                   )_xml.@platform                    = platform                   ;
		if(versionInfo                )_xml.@versionInfo                 = versionInfo                ;
		if(majorVersion               )_xml.@majorVersion                = majorVersion               ;
		if(minorVersion               )_xml.@minorVersion                = minorVersion               ;
		if(buildNumber                )_xml.@buildNumber                 = buildNumber                ;
		if(objectsSnapTo              )_xml.@objectsSnapTo               = objectsSnapTo              ;
		if(viewAngle3D                )_xml.@viewAngle3D                 = viewAngle3D                ;
		if(nextSceneIdentifier        )_xml.@nextSceneIdentifier         = nextSceneIdentifier        ;
		if(playOptionsPlayLoop        )_xml.@playOptionsPlayLoop         = playOptionsPlayLoop        ;
		if(playOptionsPlayPages       )_xml.@playOptionsPlayPages        = playOptionsPlayPages       ;
		if(playOptionsPlayFrameActions)_xml.@playOptionsPlayFrameActions = playOptionsPlayFrameActions;
		if(filetypeGUID               )_xml.@filetypeGUID                = filetypeGUID               ;

		if(media)_xml.appendChild(media.xml);
		if(symbols)_xml.appendChild(symbols.xml);
		if(timelines)_xml.appendChild(timelines.xml);
		if(persistentData)_xml.appendChild(persistentData.xml);
		if(printerSettings)_xml.appendChild(printerSettings.xml);
		if(publishHistory)_xml.appendChild(publishHistory.xml);
		return _xml;
	}

	private var namespaces:Array;
	public function set xml(value:XML):void {
		namespaces = value.namespaceDeclarations();
		nameSpace = value.namespace();
		default xml namespace = nameSpace;

		if(value.@xmlns                      )xmlns                       = value.@xmlns;
		if(value.@width                      )width                       = value.@width;
		if(value.@height                     )height                      = value.@height;
		if(value.@currentTimeline            )currentTimeline             = value.@currentTimeline;
		if(value.@xflVersion                 )xflVersion                  = value.@xflVersion;
		if(value.@creatorInfo                )creatorInfo                 = value.@creatorInfo;
		if(value.@platform                   )platform                    = value.@platform;
		if(value.@versionInfo                )versionInfo                 = value.@versionInfo;
		if(value.@majorVersion               )majorVersion                = value.@majorVersion;
		if(value.@minorVersion               )minorVersion                = value.@minorVersion;
		if(value.@buildNumber                )buildNumber                 = value.@buildNumber;
		if(value.@objectsSnapTo              )objectsSnapTo               = value.@objectsSnapTo;
		if(value.@viewAngle3D                )viewAngle3D                 = value.@viewAngle3D;
		if(value.@nextSceneIdentifier        )nextSceneIdentifier         = value.@nextSceneIdentifier;
		if(value.@playOptionsPlayLoop        )playOptionsPlayLoop         = value.@playOptionsPlayLoop;
		if(value.@playOptionsPlayPages       )playOptionsPlayPages        = value.@playOptionsPlayPages;
		if(value.@playOptionsPlayFrameActions)playOptionsPlayFrameActions = value.@playOptionsPlayFrameActions;
		if(value.@filetypeGUID               )filetypeGUID                = value.@filetypeGUID;
		if(value.media && value.media[0]){
			media = new Media();
			media.xml = value.media[0];
		}
		if(value.symbols && value.symbols[0]){
			symbols = new Symbols();
			symbols.xml = value.symbols[0];
		}
		if(value.timelines && value.timelines[0]){
			timelines = new Timelines();
			timelines.xml = value.timelines[0];
		}
		if(value.persistantData && value.persistentData[0]){
			persistentData = new PersistentData();
			persistentData.xml = value.persistentData[0];
		}
		if(value.PrinterSettings && value.PrinterSettings[0]){
			printerSettings = new PrinterSettings();
			printerSettings.xml = value.PrinterSettings[0];
		}
		if(value.publishHistory && value.publishHistory[0]){
			publishHistory = new PublishHistory();
			publishHistory.xml = value.publishHistory[0];
		}
	}
}
}
