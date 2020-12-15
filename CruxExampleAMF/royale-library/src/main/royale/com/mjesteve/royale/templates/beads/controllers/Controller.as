package com.mjesteve.royale.templates.beads.controllers
{
    import com.mjesteve.royale.templates.beads.services.IDelegate;
    import com.mjesteve.royale.templates.beads.services.Responder;

    import mx.rpc.AsyncToken;

    import org.apache.royale.core.IBeadController;
    import org.apache.royale.core.IBeadModel;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.EventDispatcher;
    import org.apache.royale.jewel.Snackbar;
    import org.apache.royale.net.remoting.messages.RoyaleClient;
    import org.apache.royale.utils.loadBeadFromValuesManager;

	import mx.rpc.events.FaultEvent;

	import com.mjesteve.royale.templates.events.ExceptionEvent;

    public class Controller extends EventDispatcher implements IBeadController
	{
        protected var _delegate:IDelegate;
		protected var _model:IBeadModel;

        /**
		 * Constructor.
		 */
		public function Controller()
		{
			super();
		}

		protected var _strand:IStrand;

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

			_model = _strand.getBeadByType(IBeadModel) as IBeadModel;
			_delegate = _strand.getBeadByType(IDelegate) as IDelegate;
			if(!_delegate)
			{
				_delegate = loadBeadFromValuesManager(IDelegate, "iDelegate", _strand) as IDelegate;
			}
		}

		/**
		 * Delegates execute service call
		 */
		protected function executeServiceCall(call:AsyncToken,
												resultHandler:Function,
												faultHandler:Function = null, handlerArgs:Array = null ):AsyncToken
		{
			if(faultHandler == null && defaultFaultHandler != null)
			{
				faultHandler = defaultFaultHandler;
			}
			//wrap the faultHandler to finally handle FaultEvents globally.
			faultHandler = wrapFaultHandler(faultHandler);

			call.addResponder(new Responder(resultHandler, faultHandler, handlerArgs));
			trace("[executeServiceCall]", call.message["operation"], call);
			return call;
		}


		private function wrapFaultHandler(handler:Function):Function{
			return function (...args):void{
				var err:Error;
				if (handler != null) {
					try{
						handler.apply(null,args);
					} catch (e:Error) {
						err = e;
					}
				}
				if (err) {
					trace("Error:",err);
				}
				var faultEvent:FaultEvent = args[0] as FaultEvent;
				if (faultEvent) {
					onFault(faultEvent, err);
				}
			}
		}

		/**
		 * Backing variable for the <code>defaultFaultHandler</code> property.
		 */
		protected var _defaultFaultHandler:Function;
		/**
		 *
		 */
		public function get defaultFaultHandler():Function
		{
			return _defaultFaultHandler;
		}

		public function set defaultFaultHandler( faultHandler:Function ):void
		{
			_defaultFaultHandler = faultHandler;
		}

		protected function onFault(event:FaultEvent, err:Error = null):void
		{
			trace("[Client: " + RoyaleClient.getInstance().id + "], Fault = ", event);
        //    Snackbar.show ("Se ha producido un error, por favor comunique este error al servicio técnico para resolverlo lo antes posible.", 10000, "Cerrar");

			if (!event.isDefaultPrevented()) {
				ExceptionEvent.defaultDispatcher.dispatchEvent(ExceptionEvent.createHandleExceptionEvent(event.fault));
			}
		}


		// override protected function defaultErrorHandler(event :FaultEvent, ...parameters) :void {
		// 	if (!event.isDefaultPrevented()) {
		// 		dispatcher.dispatchEvent(ExceptionEvent.createHandleExceptionEvent(event.fault));
		// 	}
		// }

		// override protected function defaultWarningHandler(event :ResultEvent, ...parameters) :void {
		// 	// Not necessary at this moment
		// }

		// override protected function messageErrorHandler(event :MessageFaultEvent, ...parameters) :void {
		// 	// Not necessary at this moment
		// }

		// override protected function messageWarningHandler(event :MessageEvent, ...parameters) :void {
		// 	// Not necessary at this moment
		// }

		// Used for testing session Timeout
		public function testTimeoutFault():void{
			trace("testTimeoutFault");
		}
    }
}
