package com.longtailvideo.adaptive.utils {


    import flash.utils.ByteArray;


    /** Class that groups some byte manipulation tools. **/
    public class Bytes {


        private static var BITS:Array = [
            '0000','0001','0010','0011',
            '0100','0101','0110','0111',
            '1000','1001','1010','1011',
            '1100','1101','1110','1111'
        ];
        private static var HEXES:Array = [
            '0','1','2','3','4','5','6','7',
            '8','9','A','B','C','D','E','F'
        ];


        /** Convert a binary string to a number. **/
        public static function toNumber(string:String,binary:Boolean=true):Number {
            var value:Number = 0;
            for (var i:Number = 1; i <= string.length; i++) {
                value += Number(string.charAt(string.length-i)) * Math.pow(2,i-1);
            }
            return value;
        };


        /** Return a print of a certain data range, in hex or binary. **/
        public static function toString(data:ByteArray,length:Number=-1,binary:Boolean=true):String {
            var start:Number = data.position;
            var index:Number = start;
            var string:String = '';
            if(length == -1 ) { length = data.length - start; }
            while(index < start + length) {
                var byte:uint = data.readByte();
                if(binary) { 
                    string += BITS[(byte & 0xF0) >> 4] + BITS[byte & 0x0F];
                } else {
                    string += HEXES[(byte & 0xF0) >> 4] + HEXES[byte & 0x0F];
                }
                index++;
            }
            data.position = start;
            return string;
        };


    };


}