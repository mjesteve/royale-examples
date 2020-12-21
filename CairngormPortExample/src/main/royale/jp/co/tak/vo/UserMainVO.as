package jp.co.tak.vo
{   
	
	
	import mx.collections.ArrayCollection;
	
	[Bindable]
	[RemoteClass(alias="jp.co.tak.vo.UserMainVO")]
	public class UserMainVO /*implements IValueObject*/
	{	
		public function UserMainVO()
		{
		}
		
		public var userId:String;
		public var psw:String;
		public var roleId:String;
		public var messageInfo:String;
		public var workId:ArrayCollection;
		public var wsdlUrl:String;
		public var userName:String;
		public var headerViewControl:ArrayCollection;
	}
}
