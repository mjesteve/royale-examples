package jp.co.tak.model
{
	
	
	//import jp.co.tak.view.Header;
	import jp.co.tak.view.Login;
	/*import jp.co.tak.view.usercomponent.IMonitorToken;
	import jp.co.tak.view.usercomponent.IProgressMonitor;
	import jp.co.tak.view.usercomponent.ProgressBarMonitor;*/
	
	import mx.core.UIComponent;
	
	[Bindable]
	public class LoginModel
	{
		private static var _instance:LoginModel=null;
		
		public function LoginModel()
		{
			_instance = this;
		}
		//[Greg] commented out because missing local references:
		//public var token:IMonitorToken = null;
		public var callBack:Function;
		public var sessionTimeOutForward:Function;
		public var btnControls:Function;
		public var login:Login;
		//[Greg] commented out because missing local references:
		//public var header:Header;
		
		//may not be needed, retained only in case there is a need to use ModelLocator-style Singleton access:
		public static function getInstance():LoginModel
		{
			if(_instance==null)
			{
				throw new Error('access before Crux configuration');
				/*_instance=new LoginModel();*/
			}
			return _instance;
		}
		
		public function tokenStopAndCallBack(callBackFlg:Boolean):void
		{
			//[Greg] commented out because missing local references:
			/*if(token != null)
			{
				token.stop();
				token = null;
			}*/
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
			//[Greg] commented out because missing local references:
			/*var pm:IProgressMonitor = new ProgressBarMonitor();
			var tokenSet:IMonitorToken = pm.begin(null,window);
			this.token = tokenSet;*/
			this.login = window as Login;
		}
		
		
		public function setEventListener():void {
			trace('setEventListener called')
		}
	}
}
