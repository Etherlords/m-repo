/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 11:55
 */
package ru.murclub {
import org.hamcrest.assertThat;
import org.hamcrest.object.instanceOf;

import ru.murclub.component.view.model.TorsRender;
import ru.murclub.vo.body.Sex;
import ru.murclub.vo.body.Torso;

public class BodyPartsRenderTestCase {

    [Before]
    public function setUp():void {
    }

    [Test]
    public function testRenderMen():void {
        var torso:Torso = new Torso();
        torso.sex = Sex.MALE;
        var render:TorsRender = new TorsRender(torso);
        assertThat(render.getChildAt(0), instanceOf(bodyM));
    }

    [Test]
    public function testRenderWomen():void {
        var torso:Torso = new Torso();
        torso.sex = Sex.FEMALE;
        var render:TorsRender = new TorsRender(torso);
        assertThat(render.getChildAt(0), instanceOf(bodyW));
    }

}
}
