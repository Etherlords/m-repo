/**
 * author: chaos-encoder
 * Date: 11.02.12 Time: 12:07
 */
package ru.murclub.app {
import ru.murclub.messages.MessageFactory;
import ru.murclub.util.EntityFactory;
import ru.murclub.vo.model.Model;

public class Controller {

    [MessageDispatcher]
    public var md:Function;

    public function Controller() {
    }

    public function startup():void {
        var model:Model = new Model();
        model.id = 123;
        model.body = EntityFactory.newEmptyMaleBody();

        md(MessageFactory.newAddModelMsg(model));
        md(MessageFactory.newAddModelToRoomMsg(model.id));
    }
}
}
