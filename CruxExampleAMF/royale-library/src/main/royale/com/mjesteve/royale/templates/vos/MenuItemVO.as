package com.mjesteve.royale.templates.vos
{   
		
	import org.apache.royale.collections.ArrayList;
	/**
	 *  @private
	 * Basic structure of a menu item
	 * 
	 * id: element id
	 *  Description: description of the menu item.
	 *  Items: List of children
	 */
	[Bindable]
	[RemoteClass(alias="ServiceLibraryTemplate.MenuItemVO")]
	public class MenuItemVO /*implements IValueObject*/
	{	
		public function MenuItemVO()
		{
		}
		
		public var id:int;
		public var description:String;
        [ArrayElementType("com.mjesteve.royale.templates.vos.MenuItemVO")]
        public var items:ArrayList = new ArrayList();
	}
}
