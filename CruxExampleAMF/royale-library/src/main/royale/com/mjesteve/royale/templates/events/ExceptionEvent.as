package com.mjesteve.royale.templates.events
{
	import org.apache.royale.events.Event;
	import org.apache.royale.events.EventDispatcher;

	//import mx.modules.IModuleInfo;

	public class ExceptionEvent extends Event {

		public static const $DISPATCHER_NAME:String = 'ExceptionEventDispatcher';

		public static const defaultDispatcher:EventDispatcher = new EventDispatcher();

		/** Adds the specified module to the global exception handling management. */
	//	public static const HANDLE_MODULE_EXCEPTIONS :String = "exception.handleModuleException";

		/** Manage the specified exception. */
		public static const HANDLE_EXCEPTION :String = "exception.handle";

		/** Manage the specified connection error. */
		public static const HANDLE_CONNECTION_ERROR :String = "exception.handleConnectionError";

		/*public static function createHandleModuleExceptionsEvent(module :IModuleInfo) :ExceptionEvent {
			var exceptionEvent :ExceptionEvent = new ExceptionEvent(HANDLE_MODULE_EXCEPTIONS);
			exceptionEvent.module = module;
			return exceptionEvent;
		}*/

		public static function createHandleExceptionEvent(error :Error) :ExceptionEvent {
			var exceptionEvent :ExceptionEvent = new ExceptionEvent(HANDLE_EXCEPTION);
			exceptionEvent.error = error;
			return exceptionEvent;
		}

		public static function createHandleConnectionErrorEvent() :ExceptionEvent {
			return new ExceptionEvent(HANDLE_CONNECTION_ERROR);
		}

		public function ExceptionEvent(type :String) {
			super(type);
		}

	//	public var module :IModuleInfo;

		public var error :Error;
	}
}
