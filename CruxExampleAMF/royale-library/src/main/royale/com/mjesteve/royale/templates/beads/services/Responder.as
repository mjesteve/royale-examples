package com.mjesteve.royale.templates.beads.services
{
    import mx.rpc.IResponder;
	
	public class Responder implements IResponder
	{
		private var resultHandler:Function;
		private var faultHandler:Function;
		private var handlerArgs:Array;
		
		public function Responder(resultHandler:Function, faultHandler:Function = null, handlerArgs:Array = null)
		{
			this.resultHandler = resultHandler;
			this.faultHandler = faultHandler;
			this.handlerArgs = handlerArgs;
		}
		
		public function result(data:Object):void
		{
			if(handlerArgs == null)
			{
				resultHandler(data);
			}
			else
			{
				resultHandler.apply(null, [data].concat(handlerArgs));
			}
		}
		
		public function fault(info:Object):void
		{
			if(faultHandler != null)
			{
				if(handlerArgs == null)
				{
					faultHandler(info);
				}
				else
				{
					try
					{
						faultHandler(info);
					}
					catch(error:Error)
					{
						faultHandler.apply(null, [info].concat(handlerArgs));
					}
				}
			}
			else
			{
				// todo: what if there is no fault handler applied to dynamic responder
				// ben says fails silently, maybe logging is smarter...
			}
		}
	}
}