/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 12:59
 */
package ru.murclub.component.view.model {
import flash.display.Sprite;

import ru.murclub.vo.body.Head;

public class HeadRender extends Sprite {
    
    private var _head:Head;
    
    public function HeadRender(aHead:Head) {
        _head = aHead;
        addChild(new HeadSymbol());
    }
}
}
