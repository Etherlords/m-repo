package ru.murclub.app {

import flash.display.Sprite;
import flash.text.TextField;

import org.spicefactory.parsley.core.context.Context;

import ru.murclub.component.view.model.PersModelRoomRender;
import ru.murclub.vo.model.Model;

public class Murclub extends Sprite {

    [Inject]
    public var controller:Controller;

    [Inject]
    public var context:Context;



    public function Murclub() {
        new ContextBuilderHelper().build(this);
    }
}
}

import flash.display.DisplayObject;

import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.app.config.appConfig;
import ru.murclub.component.pm.config.pmConfig;
import ru.murclub.component.view.ViewConstants;
import ru.murclub.component.view.config.viewConfig;
import ru.murclub.controller.config.controllerConfig;

class ContextBuilderHelper {
    public function build(root:DisplayObject):void {
        ContextBuilder.newSetup()
                .viewRoot(root)
                .newBuilder()
                .config(FlexConfig.forClass(pmConfig))
                .config(FlexConfig.forClass(viewConfig))
                .config(FlexConfig.forClass(appConfig))
                .config(FlexConfig.forClass(controllerConfig))
                .object(root, ViewConstants.VIEW_ROOT_ID)
                .build();
    }
}
