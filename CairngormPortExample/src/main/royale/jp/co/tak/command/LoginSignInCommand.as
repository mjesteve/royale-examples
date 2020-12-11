package jp.co.tak.command
{
	/*import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;*/
	
	import org.apache.royale.crux.utils.commands.IEventAwareCommand;
	import org.apache.royale.events.Event;
	
	import jp.co.tak.business.LoginServiceDelegate;
	import jp.co.tak.event.LoginSignInEvent;
	/*import jp.co.tak.model.LoginModelLocator;
	import jp.co.tak.model.CommonModelLocator;*/
	import jp.co.tak.vo.UserMainVO;
	import jp.co.tak.model.LoginModel;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.mxml.RemoteObject;
	
	public class LoginSignInCommand implements IEventAwareCommand, IResponder
	{
		
		[Inject]
		public var loginModel:LoginModel;
		
		
		private var _event:LoginSignInEvent;
		protected function get loginSignInEvent():LoginSignInEvent{
			return _event;
		}
		
		public function set event( value:Event ):void{
			_event = value as LoginSignInEvent;
		}
		

		
		public function execute():void
		{
			var delegate:LoginServiceDelegate = new LoginServiceDelegate(this);
			delegate.signIn(loginSignInEvent.vo);
		}
		
		public function result(data:Object):void
		{
			COMPILE::JS{
				console.log('signIn Command result handler', data);
			}

			if (data != null && data.result != null)
			{
				if((data.result as UserMainVO).messageInfo != null && (data.result as UserMainVO).messageInfo.length > 0)
				{
					//LoginModel.getInstance().tokenStopAndCallBack(false);
					loginModel.tokenStopAndCallBack(false);
					//LoginModelLocator.getInstance().login.setEventListener();
					loginModel.setEventListener();
				    Alert.show((data.result as UserMainVO).messageInfo);
				}else
				{
					//LoginModelLocator.getInstance().tokenStopAndCallBack(false);
					loginModel.tokenStopAndCallBack(false);
					//LoginModelLocator.getInstance().callBack.call(this,(data.result as UserMainVO).userName,(data.result as UserMainVO).headerViewControl);
					loginModel.callBack.call(this,(data.result as UserMainVO).userName,(data.result as UserMainVO).headerViewControl);
					
				}
					
			}
			//LoginModelLocator.getInstance().tokenStopAndCallBack(false);
			loginModel.tokenStopAndCallBack(false);
		}
		
		public function fault(info:Object):void
		{
			//LoginModelLocator.getInstance().tokenStopAndCallBack(false);
			loginModel.tokenStopAndCallBack(false);
			var faultEvent:FaultEvent = FaultEvent(info);
			//LoginModelLocator.getInstance().login.setEventListener();
			loginModel.setEventListener();
			Alert.show(faultEvent.fault.message);
		}
	}
}
