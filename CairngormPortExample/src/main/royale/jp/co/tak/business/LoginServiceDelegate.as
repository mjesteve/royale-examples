package jp.co.tak.business
{
	//import com.adobe.cairngorm.business.ServiceLocator;
	import jp.co.tak.vo.UserLoginVO;
	
	import mx.controls.Alert;
	import mx.rpc.IResponder;
	import mx.rpc.remoting.mxml.RemoteObject;

	//mock response imports:
	import jp.co.tak.vo.UserMainVO;
	import mx.collections.ArrayCollection;
	import org.apache.royale.crux.utils.services.MockDelegateHelper;
	
	public class LoginServiceDelegate
	{
		private var responder:IResponder;
		private var service:RemoteObject; //RemoteObject
		private var call:Object; // AsyncToken ?
		
		
		/**
		 * To avoid a live server dependency, we use a Crux
		 * helper class to let us create fake AsyncTokens
		 */
		private var mockHelper : MockDelegateHelper;
		
		public function LoginServiceDelegate(responder:IResponder)
		{
			this.service=Services.getInstance().getRemoteObject("loginServiceId");
			this.responder=responder;
			//for local testing:
			mockHelper = new MockDelegateHelper();
		}
				
		// Other functions
		public function signIn(userVO:UserLoginVO):void{
			COMPILE::JS{
				console.log('signIn stub called:', userVO);
			}
			
			//mock the result of the call
			var response:UserMainVO = createFakeResponse(userVO);
			mockHelper.createMockResult( response ).addResponder(this.responder);
			COMPILE::JS{
				console.log('signIn mock call generated', userVO);
			}
		}
		
		private function createFakeResponse(source:UserLoginVO):UserMainVO{
			var responseUser:UserMainVO = new UserMainVO();
			responseUser.userId = source.userId;
			responseUser.psw = source.psw;
			responseUser.roleId = source.roleId;
			responseUser.messageInfo = "This is a fake SignIn response";
			responseUser.workId = new ArrayCollection(["some_workId", "some_other_workId"]);
			responseUser.wsdlUrl = "https://fakse.wsdlUrl.com";
			responseUser.userName = "fake_userName";
			responseUser.headerViewControl = new ArrayCollection(["headerViewControl_fake_1", "headerViewControl_fake_2"]);
			return responseUser;
		}
	}
}
