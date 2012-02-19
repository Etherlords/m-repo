/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 16:26
 */
package ru.murclub.component.view.model {
public class PersAlignHelper {

    public var _persRender:PersModelRender;

    public function PersAlignHelper(persRender:PersModelRender) {
       _persRender = persRender;
    }

    public function doAlign():void {
        _persRender.headRender.y = -_persRender.headRender.height;
        _persRender.headRender.x = _persRender.torsoRender.width/2 - _persRender.headRender.width/2;
        _persRender.emoutionRender.x = _persRender.headRender.x;
        _persRender.emoutionRender.y = _persRender.headRender.y;
    }
}
}
