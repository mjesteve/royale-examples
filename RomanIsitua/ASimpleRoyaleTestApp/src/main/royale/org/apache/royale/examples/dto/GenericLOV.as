package org.apache.royale.examples.dto
{

   [RemoteClass(alias="com.spacio.crx.dto.GenericLOV")]
   [Bindable]
   public class GenericLOV
   {      
        private var _code:int;

        private var _description:String;

        public function GenericLOV()
        {
            trace(" --- init GenericLOV() --- ");
        }


        public function set code(code:int) : void
       {
           this._code = code;
       }

       public function get code():int
       {

           return this._code;
       }


        public function set description(description:String) : void
       {
           this._description = description;
       }

       public function get description():String
       {
           return this._description;
       }

   }

}