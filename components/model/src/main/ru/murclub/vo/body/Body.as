/**
 * Created by IntelliJ IDEA.
 * User: DES
 * Date: 16.02.12
 * Time: 8:11
 * To change this template use File | Settings | File Templates.
 */
package ru.murclub.vo.body {
import ru.murclub.vo.*;

public class Body {

	public var skinColor:Number;

	public var tors:Torso;
	public var head:Head;
	public var leggs:Leggs;
	public var emo:Emotion
	public var haveBody:Boolean;
	public var shade:Shadow;
	public var visible:Boolean;
	public var bodyHeight:Number;

    public function Body() {
		bodyHeight = 0;
		visible = true;
		haveBody = false;
		skinColor = null;
    }
}
}
