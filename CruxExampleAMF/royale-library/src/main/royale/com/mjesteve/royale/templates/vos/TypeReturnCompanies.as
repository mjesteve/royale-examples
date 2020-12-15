package com.mjesteve.royale.templates.vos
{   
		
	import org.apache.royale.collections.ArrayList;
	/**
	 *  @private
	 * Contains the structure returned by the update or get data calls.
	 * 
	 * Result: Indicates if the result is positive.
	 * ResultStatus: Contains a text string with the result message.
	 * dtSource: Contains the data set of the companies
	 */
	[RemoteClass(alias="ServiceLibraryTemplate.TypeReturnCompanies")]
	public class TypeReturnCompanies /*implements IValueObject*/
	{	
		public function TypeReturnCompanies()
		{
		}
		
		public var result:Boolean;
		public var resultStatus:String;

        [ArrayElementType("com.mjesteve.royale.templates.vos.DataItemVO")]
        public var dtSource:ArrayList = new ArrayList();
	}
}
