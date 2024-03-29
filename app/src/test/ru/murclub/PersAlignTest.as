/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 16:15
 */
package ru.murclub {
import org.hamcrest.assertThat;
import org.hamcrest.object.equalTo;

import ru.murclub.component.pm.model.ModelPM;
import ru.murclub.component.view.model.PersModelRender;
import ru.murclub.util.EntityFactory;

public class PersAlignTest {

    [Test]
    public function testAlignTors():void {
        var persRender:PersModelRender = new PersModelRender();
        persRender.modelPM = new ModelPM();
        persRender.modelPM.model = EntityFactory.newEmptyMaleModel(1, 1);
        persRender.init();
        assertThat(Math.round(persRender.headRender.x), equalTo(Math.round(persRender.torsoRender.width/2 - persRender.headRender.width/2)));
        assertThat(persRender.headRender.y, equalTo(-persRender.headRender.height));
        assertThat(persRender.torsoRender.y, equalTo(0));

    }

    [Test]
    public function testFemaleAlign():void {
        var persRender:PersModelRender = new PersModelRender();
        persRender.modelPM = new ModelPM();
        persRender.modelPM.model = EntityFactory.newEmptyMaleModel(1, 1);
        persRender.init();
        assertThat(persRender.emoutionRender.x, equalTo(persRender.headRender.x));
        assertThat(persRender.emoutionRender.y, equalTo(persRender.headRender.y));
    }

}
}
