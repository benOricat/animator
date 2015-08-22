/**
 * Created by ben on 11/07/2015.
 */
package com.oricat.assets.domVO {
import com.oricat.assets.domVO.DOMTimeline;
import com.oricat.assets.domVO.ISetXML;

public class DOMSymbolItem implements ISetXML{

    public var name:String;
    public var itemID:String;
    public var linkageExportForAS:String;
    public var linkageClassName:String;
    public var lastModified:String;

    public function DOMSymbolItem() {
    }

    public function get xml():XML
    {
        default xml namespace = nameSpace;
        var _xml:XML = <DOMSymbolItem/>;
        //TODO is this required? I cannot see it being used anywhere.
        _xml.addNamespace(new Namespace("xsi","http://www.w3.org/2001/XMLSchema-instance"));

        if(name              )_xml.@name               = name              ;
        if(itemID            )_xml.@itemID             = itemID            ;
        if(linkageExportForAS)_xml.@linkageExportForAS = linkageExportForAS;
        if(linkageClassName  )_xml.@linkageClassName   = linkageClassName  ;
        if(lastModified      )_xml.@lastModified       = lastModified      ;
        _xml.appendChild(<timeline/>);
        _xml.timeline.appendChild(domTimeline.xml);
        return _xml;
    }

    public var nameSpace:Namespace;
    public var domTimeline:DOMTimeline;
    public function set xml(value:XML):void {
//        trace("DOMSymbolItem",value.toXMLString());
        nameSpace = value.namespace();
        default xml namespace = nameSpace;

        if(value.@name              )name               =value.@name;
        if(value.@itemID            )itemID             =value.@itemID;
        if(value.@linkageExportForAS)linkageExportForAS =value.@linkageExportForAS;
        if(value.@linkageClassName  )linkageClassName   =value.@linkageClassName;
        if(value.@lastModified      )lastModified       =value.@lastModified;

        var xmlList:XMLList = value..DOMTimeline;
        var itemXml:XML = xmlList[0];
        domTimeline = new DOMTimeline();
        domTimeline.xml = itemXml;
    }
}
}
