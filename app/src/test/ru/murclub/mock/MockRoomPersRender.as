/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 11:26
 */
package ru.murclub.mock {

import ru.murclub.component.pm.model.ModelPM;
import ru.murclub.service.render.IPersModelRender;

public class MockRoomPersRender implements IPersModelRender {
    [Inject]
    public var modelPM:ModelPM;

    public var wasInited:Boolean = false;

    private var _userName:String;
    
    [Init]
    public function init():void {
        wasInited = true;
        _userName = modelPM.name;
    }

    public function get userName():String {
        return _userName;
    }

    public function set userName(value:String):void {
        _userName = value;
    }
}
}
