package org.apache.royale.examples.models
{
   import org.apache.royale.collections.ArrayList;
   import org.apache.royale.events.Event;
	import org.apache.royale.events.EventDispatcher;
    
 
  //[Event(name="lovsChanged", type="org.apache.royale.events.Event")]

	[Bindable]
	public class LovModel2 extends EventDispatcher
	{
		/**
		 * Constructor.
		 */
		public function LovModel2()
		{
			super();
      trace(" -- LovModel2() -- ");
		}

    private var _lovs:Array = new Array();
    [ArrayElementType("org.apache.royale.examples.dto.GenericLOV")]
    public function get lovs():Array{ return _lovs; }
    public function set lovs(value:Array):void
    { 
      _lovs = value; 
      //This line is only needed if you would like to explicitly capture the change [ lovModel.addEventListener("lovsChanged", lovsChangeHandler) ]
      dispatchEvent(new Event("lovsChanged"));
    }

    public var _lovs2:ArrayList = new ArrayList();
    [ArrayElementType("org.apache.royale.examples.dto.GenericLOV")]
    public function get lovs2():ArrayList{ return _lovs2; }
    public function set lovs2(value:ArrayList):void
    { 
      _lovs2 = value; 
      dispatchEvent(new Event("lovs2Changed"));
    }

   }

}