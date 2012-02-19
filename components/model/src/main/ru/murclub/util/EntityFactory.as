/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 12:41
 */
package ru.murclub.util {
import ru.murclub.vo.body.Body;
import ru.murclub.vo.body.Sex;
import ru.murclub.vo.body.Torso;

public class EntityFactory {
    public function EntityFactory() {
    }

    public static function newEmptyMaleBody():Body {
        var body:Body = new Body();
        body.tors = new Torso();
        body.tors.sex = Sex.MALE;
        return body;
    }
}
}
