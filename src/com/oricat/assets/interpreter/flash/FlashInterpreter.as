/**
 * Created by ben on 11/07/2015.
 */
package com.oricat.assets.interpreter.flash {
import com.oricat.assets.domVO.DOMBitmapInstance;
import com.oricat.assets.domVO.DOMFrame;
import com.oricat.assets.domVO.DOMLayer;
import com.oricat.assets.domVO.DOMShape;
import com.oricat.assets.domVO.DOMSymbolInstance;
import com.oricat.assets.domVO.DOMSymbolItem;
import com.oricat.assets.domVO.DomManager2;
import com.oricat.assets.domVO.Edge;
import com.oricat.assets.domVO.FillStyle;
import com.oricat.assets.domVO.GradientEntry;
import com.oricat.assets.domVO.IElement;
import com.oricat.assets.domVO.StrokeStyle;
import com.oricat.assets.interpreter.IInterpreter;

import flash.display.GradientType;
import flash.display.Graphics;
import flash.display.InterpolationMethod;
import flash.display.Shape;
import flash.display.SpreadMethod;
import flash.display.Sprite;
import flash.geom.Matrix;

public class FlashInterpreter extends Sprite implements IInterpreter {

    private var _symbols:Vector.<DOMSymbolItem>;
    private var _initialised:Boolean = false;
    private var _domManager:DomManager2;
    private var _display:Sprite;

    public function FlashInterpreter()
    {
        _display = new Sprite();
    }

    public function set symbols(value:Vector.<DOMSymbolItem>):void
    {
        _symbols = value;
    }

    public function renderSymbols():void
    {
        var symbol:DOMSymbolItem = new DOMSymbolItem();
        for (var i:int = 0; i < _symbols.length; i++) {
//            symbol = _symbols[i];
            renderSymbol(_symbols[i]);
        }
    }

    private function renderSymbol(symbol:DOMSymbolItem):void {
        var iLen:int = symbol.domTimeline.domLayers.length;
        var domLayer:DOMLayer;
        var jLen:int;
        var domFrame:DOMFrame;
        var kLen:int;
        var iElement:IElement;
        for (var i:int = 0; i < iLen; i++) {
            domLayer = symbol.domTimeline.domLayers[i];
            jLen = domLayer.DOMFrames.length;
            for (var j:int = 0; j < jLen; j++) {
                domFrame = domLayer.DOMFrames[j];
                kLen = domFrame.elements.length;
                for (var k:int = 0; k < kLen; k++) {
                    iElement = domFrame.elements[k];
                    switch (true)
                    {
                        case iElement is DOMShape:
                            renderShape(iElement as DOMShape)
                            break;
                        case iElement is DOMBitmapInstance:
                            break;
                        case iElement is DOMSymbolInstance:
                            break;
                    }
                }
            }
        }
    }

    private function renderShape(domShape:DOMShape):void {
        var shape:Shape = new Shape();
        shape.x = 400*Math.random();
        shape.y = 400*Math.random();
        _display.addChild(shape);
        var graphics:Graphics = shape.graphics;
        for (var i:int = 0; i < domShape.edges.length; i++) {
            var edge:Edge = domShape.edges[i];
            if(edge.edges)
            {
                if(edge.strokeStyle)
                {
                    generateStroke(domShape.strokes,edge.strokeStyle,graphics);
                }
                if(edge.fillStyle1)
                {
                    generateFill(domShape.fills,edge.fillStyle1,graphics);
                }
                renderEdge(edge.edges,graphics);
                graphics.endFill();
            }
        }
    }

    private function generateFill(fills:Vector.<FillStyle>, fillStyle1:String, graphics:Graphics):void {
        for (var i:int = 0; i < fills.length; i++) {
            var style:FillStyle = fills[i];
            if(style.index == fillStyle1)
            {
                if(style.solidColor)
                {
                   graphics.beginFill(style.solidColor.color,style.solidColor.alpha);
                }else if(style.linearGradient)
                {
                    var p_colours:Array = [];
                    var p_alphas:Array = [];
                    var p_ratios:Array = [];
                    for (var j:int = 0; j < style.linearGradient.gradients.length; j++) {
                        var entry:GradientEntry = style.linearGradient.gradients[j];
                        p_colours.push(entry.color);
                        p_alphas.push(entry.alpha);
                        p_ratios.push(entry.ratio*255);
                    }
                    var p_matrix:Matrix = style.linearGradient.matrix.getMatrix();
                    p_matrix.tx*=20;
                    p_matrix.ty*=20;
                    //todo fix this
                    var p_spreadMethod:String = SpreadMethod.PAD;
                    //todo fix this
                    var p_interpolationMethod:String = InterpolationMethod.RGB;
                    //todo fix this
                    var p_focalPointRatio:Number = 0;
                    graphics.beginGradientFill(GradientType.LINEAR,p_colours,p_alphas,p_ratios,p_matrix/*,p_spreadMethod,p_interpolationMethod,p_focalPointRatio*/);

                }
            }
        }
    }

    private function generateStroke(strokes:Vector.<StrokeStyle>, strokeStyle:String, graphics:Graphics):void {
        for (var i:int = 0; i < strokes.length; i++) {
            var style:StrokeStyle = strokes[i];
            if(style.index == strokeStyle)
            {

                if (style.solidStroke) {
                    var p_thickness:Number = style.solidStroke.weight;
                    var p_color:uint = 0;//
                    var p_alpha:Number = 1;//
                    //todo fix this
                    var p_pixelHinting:Boolean = false;
                    var p_scaleMode:String = style.solidStroke.scaleMode;
                    var p_caps:String = style.solidStroke.caps;
                    var p_joints:String = style.solidStroke.joints;
                    //todo fix this
                    var p_miterLimit:Number = 3;
                    if (style.solidStroke.solidColor) {
                        p_color = style.solidStroke.solidColor.color;
                        p_alpha = style.solidStroke.solidColor.alpha;
                    }
                    graphics.lineStyle(p_thickness, p_color, p_alpha, p_pixelHinting, p_scaleMode, p_caps, p_joints, p_miterLimit);

                    if(style.solidStroke.linearGradient){
                        var p_colours:Array = [];
                        var p_alphas:Array = [];
                        var p_ratios:Array = [];
                        for (var j:int = 0; j < style.solidStroke.linearGradient.gradients.length; j++) {
                            var entry:GradientEntry = style.solidStroke.linearGradient.gradients[j];
                            p_colours.push(entry.color);
                            p_alphas.push(entry.alpha);
                            p_ratios.push(entry.ratio*255);
                        }
                        var p_matrix:Matrix = style.solidStroke.linearGradient.matrix.getMatrix();
                        p_matrix.tx*=20;
                        p_matrix.ty*=20;
                        //todo fix this
                        var p_spreadMethod:String = SpreadMethod.PAD;
                        //todo fix this
                        var p_interpolationMethod:String = InterpolationMethod.RGB;
                        //todo fix this
                        var p_focalPointRatio:Number = 0;
                        graphics.lineGradientStyle(GradientType.LINEAR,p_colours,p_alphas,p_ratios,p_matrix/*,p_spreadMethod,p_interpolationMethod,p_focalPointRatio*/);
                    }
                }
            }
        }
    }

    private function renderEdge(edges:String,graphics:Graphics):void {
        var regex:RegExp = /(\!|\[|\||\/)/;
        var regex1:RegExp = /S\d/;
        var lastEnd:Array;
        var index:int;
        while(edges.search(regex)!=-1)
        {
            index=edges.search(regex);
            var type:String;
            switch(edges.charAt(index))
            {
                case "!":
                    type = "moveTo";
                    break;
                case "|":
                    type = "lineTo";
                    break;
                case "[":
                    type = "curveTo";
                    break;
            }
            edges = edges.substr(index+1);
            index = index=edges.search(regex);
            var pos:Array;

            if(index!=-1)
            {
                var temp:String = edges.substr(0, index);
                if(temp.search(regex1))
                {
                    temp = temp.replace(regex1,"");
                }
                pos = temp.split(" ");
            }else{
                pos = edges.split(" ");
            }
            switch(type){
                case "moveTo":
                    if(lastEnd && lastEnd[0]==pos[0]/20 && lastEnd[1]==pos[1]/20 )break;
                    graphics.moveTo(pos[0]/20,pos[1]/20);
                    lastEnd = [pos[0]/20,pos[1]/20];
                    break;
                case "lineTo":
                    graphics.lineTo(pos[0]/20,pos[1]/20);
                    lastEnd = [pos[0]/20,pos[1]/20];
                    break;
                case "curveTo":
                    graphics.curveTo(pos[0]/20,pos[1]/20,pos[2]/20,pos[3]/20);
                    lastEnd = [pos[2]/20,pos[3]/20];
                    break;
            }
            edges = edges.substring(index);
        }
        /*
         ! == move to position
         | == draw line from the position to the new position
         / == probably same like |
         [ == draw curve
         ( == probably same like [
         */

    }

    public function set domManager(domManager:DomManager2):void {
        _domManager = domManager
    }

    public function get initialised():Boolean {
        return _initialised;
    }

    public function set initialised(value:Boolean):void {
        _initialised = value;
    }

    public function get display():* {
        return _display;
    }
}
}
