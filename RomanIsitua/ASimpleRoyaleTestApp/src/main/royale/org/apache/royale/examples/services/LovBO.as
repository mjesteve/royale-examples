package org.apache.royale.examples.services
{
 
    import mx.rpc.remoting.RemoteObject;
	  import mx.rpc.AsyncToken;
    import mx.rpc.remoting.RemoteObject;

  public class LovBO
	{
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