/**
 * author: chaos-encoder
 * Date: 16.02.12 Time: 21:10
 */
package ru.murclub.messages {
import ru.murclub.vo.model.Model;

public class MessageFactory {
    public function MessageFactory() {
    }

    public static function newAddModelMsg(model:Model):AddModelMessage {
        var msg:AddModelMessage = new AddModelMessage();
        msg.model = model;
        return msg;
    }
}
}
