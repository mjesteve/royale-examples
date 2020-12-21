package jp.co.tak.vo
{   
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="jp.co.tak.vo.UserLoginVO")]
	public class UserLoginVO /*implements IValueObject*/
	{	
		public function UserLoginVO()
		{
		}
		
		public var userId:String;
		public var psw:String;
		public var roleId:String;
		public var roleName:String;
	}
}
