/**
 * Created with IntelliJ IDEA.
 * User: ben
 * Date: 10/06/14
 * Time: 22:03
 * Copyright 2014 Benjamin Simon Bath
 */
package com.oricat.assets {
import com.oricat.assets.domVO.DOMBitmapInstance;
import com.oricat.assets.domVO.DOMFrame;
import com.oricat.assets.domVO.DOMLayer;
import com.oricat.assets.domVO.DOMShape;
import com.oricat.assets.domVO.DOMSymbolInstance;
import com.oricat.assets.domVO.DOMSymbolItem;
import com.oricat.assets.domVO.DomManager2;
import com.oricat.assets.domVO.Edge;
import com.oricat.assets.domVO.IElement;
import com.oricat.assets.interpreter.IInterpreter;
import com.oricat.assets.interpreter.ISymbol;
import com.oricat.assets.interpreter.flash.FlashInterpreter;
import com.oricat.file.IFileStream;
import com.oricat.file.IImageFileStream;
import com.oricat.file.IMultiFileStream;
import com.oricat.file.IXMLFileStream;

import flash.display.DisplayObject;

import flash.display.Graphics;

import flash.display.Shape;
import flash.display.Sprite;

public class AssetExtractor extends Sprite{

	private var _domFS:IXMLFileStream;
	private var _multiFileStream:IMultiFileStream;
	private var _donorAssets:Vector.<IImageFileStream>;
	private var _symbols:Vector.<DOMSymbolItem>;
	private var _domManager:DomManager2;
    private var _interpreter:IInterpreter;

    public function AssetExtractor(){}
	/**
	 * Method iterates over the files in the multiFileStream extracts the DOM and image assets.
	 * ...
	 * @param multiFileStream
	 * @return void
	 */
	public function processAssets(multiFileStream:IMultiFileStream):void {
		_multiFileStream = multiFileStream;
		_donorAssets = new <IImageFileStream>[];
		_symbols = new <DOMSymbolItem>[];
		var i:int;
		var iFileStream:IFileStream;
		for (i = 0; i < multiFileStream.files.length; i++) {
			iFileStream = multiFileStream.files[i];
			if(iFileStream is IXMLFileStream){
				if(iFileStream.loadPath == "\\DOMDocument.xml")
				{
					_domFS = iFileStream as IXMLFileStream;
					_domManager= new DomManager2();
					_domManager.xml = _domFS.xml;
                    //_domFS.xml = _domManager.xml;
				}
				else if(iFileStream.loadPath.indexOf("LIBRARY")!=-1)
				{
					var xmlFS:IXMLFileStream = iFileStream as IXMLFileStream;
					var symbol:DOMSymbolItem = new DOMSymbolItem();
					symbol.xml = xmlFS.xml;
                    xmlFS.xml = symbol.xml;
					_symbols.push(symbol);
				}
			}
			else if(iFileStream is IImageFileStream)
			{
				_donorAssets.push(iFileStream as IImageFileStream);
			}
		}
	}


    public function renderStage():* {
        _interpreter.renderSymbols();
        return _interpreter;
    }

    public function initialiseInterpreter(interpreter:IInterpreter = null):void
    {
        if(interpreter)
        {
            _interpreter = interpreter;
        }
        if (_interpreter) {
            if (!_interpreter.initialised) {
                _interpreter.domManager = _domManager;
                _interpreter.symbols = _symbols;
                _interpreter.initialised = true;
            }
        }
        else
        {
            trace("no interpreter to initialise");
        }
    }

    public function get domManager():DomManager2 {
        return _domManager;
    }

    public function get symbols():Vector.<DOMSymbolItem> {
        return _symbols;
    }
}
}
