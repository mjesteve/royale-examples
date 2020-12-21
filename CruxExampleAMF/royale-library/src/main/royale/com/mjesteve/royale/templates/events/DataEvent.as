package com.mjesteve.royale.templates.events
{
	import org.apache.royale.events.Event;
	import com.mjesteve.royale.templates.vos.DataItemVO;
	
	/**
	 *  @private
	 * Event used for company management.
	 * We have 4 types, which cover getting, adding, removing, and deleting data. */
	public class DataEvent extends Event
	{
		public static const GET_COMPANIES:String = "getCompanies";
		public static const ADD_COMPANY:String = "addCompany";
		public static const EDIT_COMPANY:String = "editCompany";
		public static const DELETE_COMPANY:String = "deleteCompany";

		public function DataEvent(eventName:String, data:DataItemVO=null, id:String="")
		{
			super(eventName, true, true);
			//this.callBack = callBack;
			this.data = data;
			this.id = id
		}
		//public var callBack:Function;
		public var data:DataItemVO;
		public var id:String;
	}
}
