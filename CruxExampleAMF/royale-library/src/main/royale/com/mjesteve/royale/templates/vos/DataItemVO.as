package com.mjesteve.royale.templates.vos
{   
	/**
	 *  @private
	* Company data structure.
	*
	* Id: company id
	* name: Name of the company.
	* active: active company
	* multiSingle: single or multiple attribute of the company
	 */
	[Bindable]
	[RemoteClass(alias="ServiceLibraryTemplate.DataItemVO")]
	public class DataItemVO /*implements IValueObject*/
	{	
		public function DataItemVO(id:String, name:String, active:int,multiSingle:int)
		{
            this.id = id;
            this.name = name;
            this.active = active
            this.multiSingle = multiSingle
		}
		
		public var id:String;
		public var name:String;
		public var active:int;
		public var multiSingle:int;
	}
}
