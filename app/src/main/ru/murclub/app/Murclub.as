package ru.murclub.app {

import flash.display.Sprite;
import flash.text.TextField;

import org.spicefactory.parsley.core.context.Context;

import ru.murclub.component.view.model.ModelView;

public class Murclub extends Sprite {

    [Inject]
    public var controller:Controller;

    [Inject]
    public var model:Model;

    [Inject]
    public var context:Context;

    public function Murclub() {
        new ContextBuilderHelper().build(this);

        var modelView:ModelView = context.getObjectByType(ModelView) as ModelView;
        addChild(modelView);

        controller.startup();
    }
}
}

import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.app.config.appConfig;
import ru.murclub.component.pm.config.pmConfig;
import ru.murclub.component.view.config.viewConfig;

class ContextBuilderHelper {
    public function build(root:Object):void {
        ContextBuilder.newBuilder()
                .config(FlexConfig.forClass(pmConfig))
                .config(FlexConfig.forClass(viewConfig))
                .config(FlexConfig.forClass(appConfig))
                .object(root)
                .build();
    }
}
