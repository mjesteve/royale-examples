package org.apache.royale.examples.events
{
	import org.apache.royale.events.Event;

	public class LovEvent extends Event
	{
		/**
		 * Actions
		 */
		public static const GET_LIST_VALUES:String = "getListValues";
		public static const GET_LIST_VALUES_RESPONSE:String = "getListValuesRes";
		
		/**
         * constructor
		 * 
		 * This is just a normal Royale event which will be dispatched from a view instance.
		 * The only thing to note is that we set 'bubbles' to true, so that the event will bubble
		 * up the 'display' list, allowing Crux to listen for your events.
		 */ 
		public function LovEvent(type:String, lovName:String = null) {
			super(type, true, true);
			this.lovName = lovName;
		}

		public var lovName:String;
		public var result:String;
	}
}