package org.apache.royale.examples.services
{
 
    import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AsyncToken;
    import org.apache.royale.events.IEventDispatcher;

  	public class LovBO
	{
		/**
		 * @royalesuppresspublicvarwarning
		 */
   		 public var service:RemoteObject;
			
   		 /**
		 * Constructor.
		 */
		public function LovBO()	{	}

		[Inject(source="lovService", required="true")]
		public function setService(value:RemoteObject):void{
			service = value;
		}

		public function getListOfValues(lovName:String):AsyncToken{
			return service.getListOfValues(lovName);
		}


  }

}