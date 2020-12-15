package com.mjesteve.royale.templates.beads.services
{
    import mx.rpc.remoting.RemoteObject;

    import org.apache.royale.core.IBead;
    import org.apache.royale.core.IStrand;
    import org.apache.royale.events.Event;
    import org.apache.royale.events.IEventDispatcher;

    public class Delegate implements IDelegate, IBead
	{
		/**
		 * @royalesuppresspublicvarwarning
		 */
        public var service:RemoteObject;

        /**
		 * Constructor.
		 */
		public function Delegate()
		{
			super();
		}

        private var _strand:IStrand;

		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.4
		 */
		public function set strand(value:IStrand):void
		{
			_strand = value;
			IEventDispatcher(value).addEventListener("initComplete", finishSetup);
		}

        protected function finishSetup(event:Event):void
		{
			// service = _strand.getBeadByType(RemoteObject) as RemoteObject;
		}
    }
}