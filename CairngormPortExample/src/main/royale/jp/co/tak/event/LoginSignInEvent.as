package jp.co.tak.event
{
	import org.apache.royale.events.Event;
	
	import jp.co.tak.vo.UserLoginVO;
	
	public class LoginSignInEvent extends Event
	{
		public static const EVENT_ID:String="LoginSignInEvent";
		
		public var vo:UserLoginVO;
		public function LoginSignInEvent(vo:UserLoginVO)
		{
			super(EVENT_ID);
			this.vo = vo;
		}
	}
}
