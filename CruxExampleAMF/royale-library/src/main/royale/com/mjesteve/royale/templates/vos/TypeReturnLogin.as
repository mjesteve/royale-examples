package com.mjesteve.royale.templates.vos
{   
		
	import org.apache.royale.collections.ArrayList;
	/**
	 *  @private
	 * Contains the structure returned by the backend when performing user authentication.
	 * 
	 * Result: Indicates if the result is positive.
	 * ResultStatus: Contains a text string with the result message.
	 * dtMenu: Contains a list of menu items from which the user menu will be drawn
	 */
	[RemoteClass(alias="ServiceLibraryTemplate.TypeReturnLogin")]
	public class TypeReturnLogin /*implements IValueObject*/
	{	
		public function TypeReturnLogin()
		{
		}
		
		public var result:Boolean;
		public var resultStatus:String;

        [ArrayElementType("com.mjesteve.royale.templates.vos.MenuItemVO")]
        public var dtMenu:ArrayList = new ArrayList();
	}
}
