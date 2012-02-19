/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 12:41
 */
package ru.murclub.util {
import ru.murclub.vo.body.Body;
import ru.murclub.vo.body.Head;
import ru.murclub.vo.body.Sex;
import ru.murclub.vo.body.Torso;
import ru.murclub.vo.model.Model;

public class EntityFactory {
    public function EntityFactory() {
    }

    public static function newEmptyMaleBody():Body {
        var body:Body = new Body();
        body.tors = new Torso();
        body.tors.sex = Sex.MALE;
        body.head = new Head();
        return body;
    }

    public static function newEmptyMaleModel():Model {
        var model:Model = new Model();
        model.body = newEmptyMaleBody();
        return model;
    }
}
}
