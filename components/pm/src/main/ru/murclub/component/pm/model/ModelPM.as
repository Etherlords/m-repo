/**
 * Created by IntelliJ IDEA.
 * User: DES
 * Date: 14.02.12
 * Time: 7:15
 * To change this template use File | Settings | File Templates.
 */
package ru.murclub.component.pm.model {
import flash.events.Event;
import flash.events.EventDispatcher;

import ru.murclub.component.pm.PMConstaints;

public class ModelPM extends EventDispatcher {

    private var _name:String;

    public function ModelPM() {
    }


    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
        dispatchEvent(new Event(PMConstaints.EVENT_TYPE_CHANGE_NAME));
    }
}
}