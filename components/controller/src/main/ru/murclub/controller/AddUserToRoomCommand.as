/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 9:40
 */
package ru.murclub.controller {
import ru.murclub.component.pm.room.RoomPM;
import ru.murclub.messages.AddModelToRoomMessage;

public class AddUserToRoomCommand {

    [Inject]
    public var roomPM:RoomPM;

    public function AddUserToRoomCommand() {
    }

    public function execute(msg:AddModelToRoomMessage):void {
        roomPM.registerUserModel(msg.id);
    }
}
}
