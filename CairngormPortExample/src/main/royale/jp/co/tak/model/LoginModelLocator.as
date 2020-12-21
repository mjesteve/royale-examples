package jp.co.tak.model
{
	import com.adobe.cairngorm.model.IModelLocator;
	
	import jp.co.tak.view.Header;
	import jp.co.tak.view.Login;
	import jp.co.tak.view.usercomponent.IMonitorToken;
	import jp.co.tak.view.usercomponent.IProgressMonitor;
	import jp.co.tak.view.usercomponent.ProgressBarMonitor;
	
	import mx.core.UIComponent;
	
	[Bindable]
	public class LoginModelLocator implements IModelLocator
	{
		private static var _instance:LoginModelLocator=null;
		
		public function LoginModelLocator()
		{
		}
		
		public var token:IMonitorToken = null;
		public var callBack:Function;
		public var sessionTimeOutForward:Function;
		public var btnControls:Function;
		public var login:Login;
		public var header:Header;
		public static function getInstance():LoginModelLocator
		{
			if(_instance==null)
			{
				_instance=new LoginModelLocator();
			}
			return _instance;
		}
		
		public function tokenStopAndCallBack(callBackFlg:Boolean):void
		{
			if(token != null)
			{
				token.stop();
				token = null;
			}
			if(callBackFlg)
			{
			    callBack.call();
			}
		}
		
		public function setCallBack(callBack:Function):void
		{
			this.callBack = callBack;
		}
		
		public function setToken(window:UIComponent):void
		{
			var pm:IProgressMonitor = new ProgressBarMonitor();
			var tokenSet:IMonitorToken = pm.begin(null,window);
			this.token = tokenSet;
			this.login = window as Login;
		}
		
		
	}
}
