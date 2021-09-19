package org.apache.royale.examples.services
{
 
    import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AsyncToken;
    import org.apache.royale.events.IEventDispatcher;

  	public class LovBO
	{
        [Dispatcher]
        /**
         * The [Dispatcher] metadata tag instructs Crux to inject an event dispatcher.
         * Event's dispatched via this dispatcher can trigger event mediators.
         */
        public var dispatcher:IEventDispatcher;
   		 /**
		 * Constructor.
		 */
		public function LovBO()	{	}
		/**
		 * @royalesuppresspublicvarwarning
		 */
   		 public var service:RemoteObject;

		[Inject(source="lovService", required="true")]
		public function setService(value:RemoteObject):void{
			service = value;
		}

		public function getListOfValues(lovName:String):AsyncToken{
			return service.getListOfValues(lovName);
		}


  }

}