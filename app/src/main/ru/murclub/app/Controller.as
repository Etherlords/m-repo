/**
 * author: chaos-encoder
 * Date: 11.02.12 Time: 12:07
 */
package ru.murclub.app {
public class Controller {

    [Inject]
    public var model:Model;

    public function Controller() {
    }

    public function startup():void {
        model.value = "started";
    }
}
}
