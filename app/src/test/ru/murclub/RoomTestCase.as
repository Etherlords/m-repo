/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 9:30
 */
package ru.murclub {

import org.flexunit.asserts.assertTrue;
import org.flexunit.asserts.fail;
import org.hamcrest.assertThat;
import org.hamcrest.object.equalTo;
import org.hamcrest.object.notNullValue;
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.core.context.Context;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.PMConstaints;

import ru.murclub.component.pm.config.pmConfig;
import ru.murclub.component.pm.config.roomPMConfig;
import ru.murclub.component.pm.model.ModelPM;

import ru.murclub.component.pm.model.ModelStorePM;
import ru.murclub.component.pm.room.RoomPM;
import ru.murclub.controller.config.controllerConfig;
import ru.murclub.controller.config.roomControllerConfig;
import ru.murclub.messages.MessageFactory;
import ru.murclub.mock.MockRoomPersRender;
import ru.murclub.mock.mockRoomPersRenderConfig;
import ru.murclub.service.render.IPersModelRoomRender;
import ru.murclub.service.render.IRoomRenderService;
import ru.murclub.util.EntityFactory;
import ru.murclub.vo.model.Model;

public class RoomTestCase implements IRoomRenderService {
    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var modelStorePM:ModelStorePM;

    [Inject]
    public var roomPM:RoomPM;

    [Before]
    public function setUp():void {
        ContextBuilder.newSetup().scope(PMConstaints.SCOPE_NAME_ROOM).newBuilder()
                .config(FlexConfig.forClass(mockRoomPersRenderConfig))
                .config(FlexConfig.forClass(pmConfig))
                .config(FlexConfig.forClass(roomPMConfig))
                .config(FlexConfig.forClass(controllerConfig))
                .config(FlexConfig.forClass(roomControllerConfig))
                .object(this)
                .build();
    }

    [Test]
    public function testAddModelInRoom():void {
        var model:Model = new Model();
        model.id = 1;
        model.name = "test";
        modelStorePM.addModel(model);
        dispatcher(MessageFactory.newAddModelToRoomMsg(model.id));
        assertTrue(roomPM.userModelContextMap.hasKey(model.id));
        var modelPM:ModelPM = (roomPM.userModelContextMap.itemFor(model.id) as Context).getObjectByType(ModelPM) as ModelPM;

        assertThat(modelPM.model, model);

    }

    [Test]
    public function testAddTwoModel():void { //there is problem with scopes
       modelStorePM.addModel(EntityFactory.newEmptyFemaleModel(1, 2));
       modelStorePM.addModel(EntityFactory.newEmptyFemaleModel(2, 2));
       dispatcher(MessageFactory.newAddModelToRoomMsg(1));
       dispatcher(MessageFactory.newAddModelToRoomMsg(2));
       var mode1PM1:ModelPM = (roomPM.userModelContextMap.itemFor(1) as Context).getObjectByType(ModelPM) as ModelPM;
       var modelPM2:ModelPM = (roomPM.userModelContextMap.itemFor(2) as Context).getObjectByType(ModelPM) as ModelPM;
       assertThat(mode1PM1, notNullValue());
       assertThat(modelPM2, notNullValue());

    }

    [MessageError]
    public function handleError (error:Error) : void {
        fail(error.message);
    }


}
}
