package com.mjesteve.royale.templates.events
{
	import org.apache.royale.events.Event;
	import com.mjesteve.royale.templates.vos.LoginVO;
	/**
	*  @private
	* Event for user login.
	*
	* We have three events defined:
	* EVEN_LOAD: Event launched from the view that will contain the LoginVO object for validation.
	* EVENT_COMPLETE_RES: Event launched from the controller that will handle the view when the event has resulted when the authentication is successful.
	* EVENT_FAILED_RES: Event thrown by the controller when authentication is unsuccessful.
	*/
	public class LoginSignInEvent extends Event
	{
		public static const EVENT_LOAD:String = "LoginLoadEvent";
		public static const EVENT_COMPLETE_RES:String = "LoginCompleteRes";
		public static const EVENT_FAILED_RES:String = "LoginFailedRes";
		
		public function LoginSignInEvent(eventName:String,vo:LoginVO = null)
		{
			super(eventName, true, true);
			this.vo = vo;
		}
		public var vo:LoginVO;
	}
}
