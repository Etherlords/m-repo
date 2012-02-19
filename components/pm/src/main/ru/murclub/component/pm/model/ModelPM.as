/**
 * Created by IntelliJ IDEA.
 * User: DES
 * Date: 14.02.12
 * Time: 7:15
 * To change this template use File | Settings | File Templates.
 */
package ru.murclub.component.pm.model {
import flash.errors.IllegalOperationError;
import flash.events.Event;
import flash.events.EventDispatcher;

import org.spicefactory.parsley.core.context.Context;

import ru.murclub.component.pm.PMConstaints;
import ru.murclub.vo.model.Model;

public class ModelPM extends EventDispatcher {

    [Inject]
    public var model:Model;

    [Inject]
    public var context:Context;

    public function ModelPM() {
    }

    [Init]
    public function init():void {
        if (!model) {
            throw new IllegalOperationError("model must be defined");
        }
    }

    public function get name():String {
        return model.name;
    }

    public function set name(value:String):void {
        model.name = value;
        dispatchEvent(new Event(PMConstaints.EVENT_TYPE_CHANGE_NAME));
    }

    public function get position():Number {
        return model.position;
    }
}
}
