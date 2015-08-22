/**
 * Created by ben on 12/07/2015.
 */
package com.oricat.assets.interpreter {
import com.oricat.assets.domVO.DOMSymbolItem;
import com.oricat.assets.domVO.DomManager2;

public interface IInterpreter {

    function set domManager(domManager:DomManager2):void;
    function set symbols(value:Vector.<DOMSymbolItem>):void;
    function renderSymbols():void;

    function get initialised():Boolean;
    function set initialised(value:Boolean):void;

    function get display():*;
}
}
