/**
 * author: chaos-encoder
 * Date: 16.02.12 Time: 21:41
 */
package ru.murclub.component.pm.model {
import flash.utils.Dictionary;

import org.as3commons.collections.Map;

import ru.murclub.vo.model.Model;

public class ModelStorePM {

    private var container:Map;

    public function ModelStorePM() {
        container = new Map();
    }

    public function hasModel(id:Number):Boolean {
        return container.hasKey(id);
    }

    public function addModel(model:Model):void {
        container.add(model.id, model);
    }
}
}
