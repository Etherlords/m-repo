/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 12:19
 */
package ru.murclub {
import org.hamcrest.assertThat;
import org.hamcrest.object.equalTo;
import org.hamcrest.object.instanceOf;
import org.hamcrest.object.notNullValue;
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.core.context.Context;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.PMConstaints;
import ru.murclub.component.pm.config.modelPMConfig;
import ru.murclub.component.pm.config.pmConfig;
import ru.murclub.component.pm.config.roomPMConfig;
import ru.murclub.component.pm.model.ModelPM;
import ru.murclub.component.view.config.PersRoomViewConfig;
import ru.murclub.component.view.model.PersModelRoomRender;
import ru.murclub.util.EntityFactory;
import ru.murclub.vo.body.Body;
import ru.murclub.vo.body.Sex;
import ru.murclub.vo.body.Torso;
import ru.murclub.vo.model.Model;

public class RenderRoomPersModelTestCase {

    public var model:Model;

    [Inject]
    public var modelPM:ModelPM;

    [Inject]
    public var context:Context;

    [Before]
    public function setUp():void {

        model = new Model();
        model.body = EntityFactory.newEmptyMaleBody();
        
        ContextBuilder.newSetup().scope(PMConstaints.SCOPE_NAME_PERS_MODEL).newBuilder()
                .config(FlexConfig.forClass(PersRoomViewConfig))
                .config(FlexConfig.forClass(pmConfig))
                .config(FlexConfig.forClass(modelPMConfig))
                .object(model)
                .object(this)
                .build();
    }

    [Test]
    public function testRenderMan():void {
        var render:PersModelRoomRender = context.getObjectByType(PersModelRoomRender) as PersModelRoomRender;
        assertThat(render.torsoRender, notNullValue());
        assertThat(render.torsoRender.getChildAt(0), instanceOf(bodyM));
    }
}
}
