package ru.murclub.app {

import flash.display.Sprite;
import flash.text.TextField;

import org.spicefactory.parsley.core.context.Context;

public class Murclub extends Sprite {

    [Inject]
    public var controller:Controller;

    [Inject]
    public var model:Model;

    [Inject]
    public var context:Context;

    public function Murclub() {
        new ContextBuilderHelper().build(this);
        controller.startup();
        var textField:TextField = new TextField();
        textField.text = "app state: " + model.value;
        addChild(textField);
    }
}
}

import org.spicefactory.parsley.context.ContextBuilder;
import org.spicefactory.parsley.flex.FlexConfig;

import ru.murclub.app.config.appConfig;

class ContextBuilderHelper {
    public function build(root:Object):void {
        ContextBuilder.newBuilder()
                .config(FlexConfig.forClass(appConfig))
                .object(root)
                .build();
    }
}
