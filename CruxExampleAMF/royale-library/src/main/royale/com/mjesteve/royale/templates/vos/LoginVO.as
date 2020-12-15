package com.mjesteve.royale.templates.vos
{   
	/**
	 *  @private
	 * Contains the username and password pair that we use in the authentication with the backend
	 * 
	 * username: User string
	 * password: password string
	 */
	[Bindable]
	[RemoteClass(alias="ServiceLibraryTemplate.LoginVO")]
	public class LoginVO /*implements IValueObject*/
	{	
		public function LoginVO()
		{
		}
		
		public var userName:String;
		public var password:String;
	}
}
