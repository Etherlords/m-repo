/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 9:40
 */
package ru.murclub.controller {
import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.core.context.Context;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.PMConstaints;

import ru.murclub.component.pm.config.userRoomConfig;

import ru.murclub.component.pm.model.ModelStorePM;
import ru.murclub.component.pm.room.RoomPM;
import ru.murclub.messages.AddModelToRoomMessage;
import ru.murclub.service.render.IRoomRenderService;
import ru.murclub.vo.model.Model;

public class AddUserToRoomCommand {

    [Inject]
    public var roomPM:RoomPM;

    [Inject]
    public var modelStorePM:ModelStorePM;

    [Inject]
    public var context:Context;

    [Inject]
    public var roomRenderService:IRoomRenderService;

    public function AddUserToRoomCommand() {
    }

    public function execute(msg:AddModelToRoomMessage):void {
        var model:Model = modelStorePM.getModel(msg.id);
        var modelContext:Context = ContextBuilder.newSetup()
                .parent(context)
                .scope(PMConstaints.SCOPE_NAME_PERS_MODEL)
                .description("Context for model with id:" + model.id)
                .newBuilder()
                .object(model)
                .config(FlexConfig.forClass(userRoomConfig))
                .build();
        roomPM.registerUserModel(msg.id, modelContext);
    }
}
}
