/**
 * Created by IntelliJ IDEA.
 * User: DES
 * Date: 13.02.12
 * Time: 21:46
 */
package ru.murclub.component.view.model {
import flash.display.Sprite;
import flash.text.TextField;

public class ModelView extends Sprite {
    public function ModelView() {
        var textField:TextField = new TextField();
        textField.text = "model";
        addChild(textField);
    }
}
}
