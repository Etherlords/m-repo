/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 9:30
 */
package ru.murclub {
import org.flexunit.asserts.assertTrue;
import org.flexunit.asserts.fail;
import org.hamcrest.assertThat;
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.core.context.Context;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.config.pmConfig;
import ru.murclub.component.pm.model.ModelPM;

import ru.murclub.component.pm.model.ModelStorePM;
import ru.murclub.component.pm.room.RoomPM;
import ru.murclub.controller.config.controllerConfig;
import ru.murclub.messages.MessageFactory;
import ru.murclub.mock.MockRoomPersRender;
import ru.murclub.mock.mockRoomPersRenderConfig;
import ru.murclub.service.render.IRoomPersModelRender;
import ru.murclub.service.render.IRoomRenderService;
import ru.murclub.vo.model.Model;

public class RoomTestCase implements IRoomRenderService {
    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var modelStorePM:ModelStorePM;

    [Inject]
    public var roomPM:RoomPM;

    public var mockPersRender:MockRoomPersRender;

    [Before]
    public function setUp():void {

        ContextBuilder.newBuilder()
                .config(FlexConfig.forClass(mockRoomPersRenderConfig))
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
        assertTrue(roomPM.userModelContextMap.hasKey(model.id));
        var modelPM:ModelPM = (roomPM.userModelContextMap.itemFor(model.id) as Context).getObjectByType(ModelPM) as ModelPM;
        assertTrue(MockRoomPersRender(modelPM.modelRender).wasInited);
        assertThat(modelPM.model, model);
    }

    [MessageError]
    public function handleError (error:Error) : void {
        fail(error.message);
    }


}
}
