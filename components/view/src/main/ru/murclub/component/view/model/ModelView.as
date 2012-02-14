/**
 * Created by IntelliJ IDEA.
 * User: DES
 * Date: 13.02.12
 * Time: 21:46
 */
package ru.murclub.component.view.model {
import flash.display.Sprite;
import flash.text.TextField;

import ru.murclub.component.pm.model.ModelPM;

public class ModelView extends Sprite {

    [Inject]
    public var modelPM:ModelPM;

    private var _userName:String;

    private var _textField:TextField = new TextField();

    public function ModelView() {

        _textField.text = "model";
        addChild(_textField);
    }

    public function get userName():String {
        return _userName;
    }

    public function set userName(value:String):void {
        _userName = value;
        _textField.text = value ? value : "";
    }
}
}
