package jp.co.tak.event
{
	import org.apache.royale.events.Event;
	
	import jp.co.tak.vo.UserLoginVO;
	
	public class LoginLoadEvent extends Event
	{
		public static const EVENT_ID:String="LoginLoadEvent";
		
		public var callBack:Function;
		public function LoginLoadEvent(callBack:Function)
		{
			super(EVENT_ID);
			this.callBack = callBack;
		}
	}
}
