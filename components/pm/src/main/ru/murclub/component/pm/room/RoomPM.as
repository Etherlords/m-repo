/**
 * author: chaos-encoder
 * Date: 16.02.12 Time: 22:36
 */
package ru.murclub.component.pm.room {
import org.as3commons.collections.Map;
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.core.context.Context;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.config.userRoomConfig;
import ru.murclub.component.pm.model.ModelStorePM;

import ru.murclub.vo.model.Model;

public class RoomPM {

    [Inject]
    public var context:Context;

    [Inject]
    public var modelStorePM:ModelStorePM;

    public var userModelContextMap:Map;

    public function RoomPM() {
        userModelContextMap = new Map();
    }

    public function registerUserModel(id:Number):void {
        var model:Model = modelStorePM.getModel(id);
        var modelContext:Context = ContextBuilder.newSetup()
                                        .parent(context)
                                            .description("Context for model with id:" + model.id)
                                            .newBuilder()
                                                .object(model)
                                                .config(FlexConfig.forClass(userRoomConfig))
                                                .build();
        userModelContextMap.add(model.id, modelContext);
    }
}
}
