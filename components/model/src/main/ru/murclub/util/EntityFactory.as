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

    public static function newEmptyBody(sex:Sex):Body {
        var body:Body = new Body();
        body.tors = new Torso();
        body.tors.sex = sex;
        body.head = new Head();
        return body;
    }

    public static function newEmptyMaleBody():Body {
       return newEmptyBody(Sex.MALE);
    }

    public static function newEmptyMaleModel(id:Number, position:Number):Model {
        var model:Model = new Model();
        model.id = id;
        model.body = newEmptyMaleBody();
        model.position = position;
        return model;
    }
    
    public static function newEmptyFemaleModel(id:Number, position:Number):Model {
        var model:Model = new Model();
        model.id = id;
        model.body = newEmptyBody(Sex.FEMALE);
        model.position = position;
        return model;
    }
    
}
}
