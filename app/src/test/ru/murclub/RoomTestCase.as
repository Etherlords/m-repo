/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 9:30
 */
package ru.murclub {
import org.flexunit.asserts.assertTrue;
import org.hamcrest.assertThat;
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.config.pmConfig;

import ru.murclub.component.pm.model.ModelStorePM;
import ru.murclub.component.pm.room.RoomPM;
import ru.murclub.controller.config.controllerConfig;
import ru.murclub.messages.MessageFactory;
import ru.murclub.vo.model.Model;

public class RoomTestCase {
    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var modelStorePM:ModelStorePM;

    [Inject]
    public var roomPM:RoomPM;

    [Before]
    public function setUp():void {
        ContextBuilder.newBuilder()
                .config(FlexConfig.forClass(pmConfig))
                .config(FlexConfig.forClass(controllerConfig))
                .object(this)
                .build();
    }

    [Test]
    public function testAddModelInRoom():void {
        var model:Model = new Model();
        model.id = 1;
        modelStorePM.addModel(model);
        dispatcher(MessageFactory.newAddModelToRoomMsg(model.id));
        assertTrue(roomPM.userModelContextMap.hasKey(model.id))
    }
}
}
