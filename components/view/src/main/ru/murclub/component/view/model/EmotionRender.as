/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 21:15
 */
package ru.murclub.component.view.model {
import flash.display.MovieClip;
import flash.display.Sprite;

import ru.murclub.vo.body.Body;

import ru.murclub.vo.body.Emotion;
import ru.murclub.vo.body.Sex;

public class EmotionRender extends Sprite {

    private var _emo:Emotion;
    private var emoClip:MovieClip;

    public function EmotionRender(body:Body) {
        _emo = body.emo;
        emoClip = body.tors.sex == Sex.MALE ? new emoM() : new emoW();
        addChild(emoClip);
    }
}
}
