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

    [Init]
    public function init():void {
        wasInited = true;
    }
}
}
