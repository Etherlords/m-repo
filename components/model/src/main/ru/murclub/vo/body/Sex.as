/**
 * author: chaos-encoder
 * Date: 19.02.12 Time: 12:05
 */
package ru.murclub.vo.body {
public class Sex {

    public static const MALE:Sex = new Sex("M");
    public static const FEMALE:Sex = new Sex("W2");

    public var typeName:String;

    public function Sex(typeName:String) {
    }
}
}
