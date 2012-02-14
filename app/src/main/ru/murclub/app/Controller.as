/**
 * author: chaos-encoder
 * Date: 11.02.12 Time: 12:07
 */
package ru.murclub.app {
import ru.murclub.component.pm.model.ModelPM;

public class Controller {

    [Inject]
    public var model:ModelPM;

    public function Controller() {
    }

    public function startup():void {
        model.name = "started";
    }
}
}
