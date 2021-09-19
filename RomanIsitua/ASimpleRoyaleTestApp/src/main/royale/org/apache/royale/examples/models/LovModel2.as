package org.apache.royale.examples.models
{

    import mx.rpc.remoting.mxml.RemoteObject;
   import org.apache.royale.crux.utils.services.ServiceHelper;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.events.FaultEvent;
   import mx.collections.ArrayCollection;
   import org.apache.royale.collections.ArrayList;
   import org.apache.royale.examples.dto.GenericLOV;
   import org.apache.royale.events.Event;
	import org.apache.royale.core.IBeadModel;
	import org.apache.royale.core.IStrand;
	import org.apache.royale.events.EventDispatcher;
    
 
  //[Event(name="lovsChanged", type="org.apache.royale.events.Event")]

	[Bindable]
	public class LovModel2 extends EventDispatcher implements IBeadModel
	{
		/**
		 * Constructor.
		 */
		public function LovModel2()
		{
			super();
      trace(" -- LovModel2() -- ");
		}

    private var _strand:IStrand;
		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
		public function set strand(value:IStrand):void
		{
			_strand = value;
		}

    [ArrayElementType("org.apache.royale.examples.dto.GenericLOV")]
    private var _lovs:Array = new Array();;
    public function get lovs():Array{ return _lovs; }
    public function set lovs(value:Array):void
    { 
      _lovs = value; 
      //This line is only needed if you would like to explicitly capture the change [ lovModel.addEventListener("lovsChanged", lovsChangeHandler) ]
      dispatchEvent(new Event("lovsChanged"));
    }

    [ArrayElementType("org.apache.royale.examples.dto.GenericLOV")]
    public var _lovs2:ArrayList = new ArrayList();
    public function get lovs2():ArrayList{ return _lovs2; }
    public function set lovs2(value:ArrayList):void
    { 
      _lovs2 = value; 
      dispatchEvent(new Event("lovs2Changed"));
    }

   }

}