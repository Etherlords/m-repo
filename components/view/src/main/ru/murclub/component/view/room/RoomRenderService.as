/**
 * author: chaos-encoder
 * Date: 18.02.12 Time: 12:10
 */
package ru.murclub.component.view.room {
import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.text.TextField;

import mx.controls.Text;

import org.spicefactory.parsley.context.ContextBuilder;

import org.spicefactory.parsley.core.context.Context;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.component.pm.PMConstaints;

import ru.murclub.component.pm.model.ModelPM;
import ru.murclub.component.view.config.PersRoomViewConfig;
import ru.murclub.component.view.config.roomViewConfig;

import ru.murclub.component.view.model.PersModelRender;

import ru.murclub.service.render.IPersModelRoomRender;

import ru.murclub.service.render.IRoomRenderService;

public class RoomRenderService extends Sprite implements IRoomRenderService {

    [Inject]
    public var context:Context;

    public var viewRoot:Sprite;

    private var _textField:TextField;

    private var _modelHolder:Sprite;

    public function RoomRenderService() {
        _textField = new TextField();
        _textField.text = "room view render";
        addChild(_textField);
        _modelHolder = new Sprite();
        addChild(_modelHolder);
        _modelHolder.y = 150;
    }

    [Init]
    public function init():void {
        viewRoot.addChild(this);
    }


    public function register(modelPM:ModelPM):void {
        var renderContext:Context = ContextBuilder.newSetup()
                .parent(modelPM.context)
                .description("model render scope")
                .newBuilder()
                    .config(FlexConfig.forClass(PersRoomViewConfig))
                    .build();
        var render:PersModelRender = renderContext.getObjectByType(PersModelRender) as PersModelRender;
        _modelHolder.addChild(render)
    }

}
}
