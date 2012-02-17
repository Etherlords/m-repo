/**
 * author: chaos-encoder
 * Date: 16.02.12 Time: 21:57
 */
package ru.murclub.controller {
import ru.murclub.component.pm.model.ModelStorePM;
import ru.murclub.messages.AddModelMessage;
import ru.murclub.vo.model.Model;

public class AddUserModelCommand {

    [Inject]
    public var modelStore:ModelStorePM;



    public function AddUserModelCommand() {
    }

    public function execute(msg:AddModelMessage):void {
        modelStore.addModel(msg.model);
    }
}
}
