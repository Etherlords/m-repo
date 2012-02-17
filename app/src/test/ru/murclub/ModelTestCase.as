/**
 * author: chaos-encoder
 * Date: 16.02.12 Time: 20:49
 */
package ru.murclub {

import org.hamcrest.assertThat;
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.flex.FlexConfig;


import ru.murclub.component.pm.config.pmConfig;
import ru.murclub.component.pm.model.ModelStorePM;
import ru.murclub.controller.config.controllerConfig;
import ru.murclub.messages.MessageFactory;
import ru.murclub.vo.model.Model;

public class ModelTestCase {

    [MessageDispatcher]
    public var dispatcher:Function;

    [Inject]
    public var modelStorePM:ModelStorePM;

    [Before]
    public function setUp():void {
        ContextBuilder.newBuilder()
                .config(FlexConfig.forClass(pmConfig))
                .config(FlexConfig.forClass(controllerConfig))
                .object(this)
                .build();
    }

    [Test]
    public function testAddModel():void {
        var model:Model = new Model();
        model.id = 1;
        modelStorePM.addModel(model);
        assertThat(modelStorePM.hasModel(model.id));
    }
    
    [Test]
    public function testAddModelInRoom():void {
        var model:Model = new Model();
        model.id = 1;
        modelStorePM.addModel(model);
        dispatcher(MessageFactory.newAddModelToRoomMsg(id));
    }

}
}

class MockPersModelRender {

}
