/**
 * author: chaos-encoder
 * Date: 16.02.12 Time: 22:36
 */
package ru.murclub.component.pm.room {
import org.as3commons.collections.Map;
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.core.context.Context;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.config.userRoomPMConfig;
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

    public function registerUserModel(id:Number, modelContext):void {
        userModelContextMap.add(id, modelContext);
    }
}
}
