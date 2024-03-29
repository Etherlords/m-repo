/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 12:02
 */
package ru.murclub.component.view.model {
import flash.display.MovieClip;
import flash.display.Sprite;

import ru.murclub.vo.body.Sex;

import ru.murclub.vo.body.Torso;

public class TorsRender extends Sprite {
    private var _torso:Torso;
    private var attachedTorso:MovieClip;
    private var bodyShade:Sprite;

    public function TorsRender(torso:Torso) {
        _torso = torso;
        if (_torso.sex == Sex.MALE) {
            attachedTorso = new bodyM();
        } else {
            attachedTorso = new bodyW();
            attachedTorso.gotoAndStop(0);
        }

        addChild(attachedTorso);
    }



}
}
