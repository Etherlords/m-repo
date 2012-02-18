/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 12:10
 */
package ru.murclub.component.view.room {
import flash.display.Sprite;
import flash.text.TextField;

import mx.controls.Text;

import org.spicefactory.parsley.core.context.Context;

import ru.murclub.service.render.IRoomRenderService;

public class RoomRenderService extends Sprite implements IRoomRenderService {

    [Inject]
    public var context:Context;

    public var viewRoot:Sprite;

    private var _textField:TextField;

    public function RoomRenderService() {
        _textField = new TextField();
        _textField.text = "room view render";
        addChild(_textField);
    }

    [Init]
    public function init():void {
        viewRoot.addChild(this);
    }

}
}
