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
import ru.murclub.service.render.IPersModelRender;
import ru.murclub.service.render.IPersModelRoomRender;

public class PersModelRender extends Sprite implements IPersModelRoomRender {

    [Inject]
    public var modelPM:ModelPM;

    public var torsoRender:TorsRender;
    public var headRender:HeadRender;

    private var _userName:String;

    private var _textField:TextField = new TextField();

    private var _alignHelper:PersAlignHelper;

    public var emoutionRender:EmotionRender;

    public function PersModelRender() {

        _textField.text = "model";
        addChild(_textField);
    }

    [Init]
    public function init():void {
        userName = modelPM.name;
        this.x = modelPM.position; //todo add set position test case for model pm
        torsoRender = new TorsRender(modelPM.model.body.tors);
        addChild(torsoRender);
        headRender = new HeadRender(modelPM.model.body.head);
        addChild(headRender);
        emoutionRender = new EmotionRender(modelPM.model.body);
        addChild(emoutionRender);
        _alignHelper = new PersAlignHelper(this);

        doAlign();
    }

    public function doAlign():void {
        _alignHelper.doAlign();
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
