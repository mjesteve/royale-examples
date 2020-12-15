package com.mjesteve.royale.templates.beads.models
{
	import org.apache.royale.core.IBeadModel;
	import org.apache.royale.core.IStrand;
	import org.apache.royale.events.EventDispatcher;

	[Bindable]
	public class Model extends EventDispatcher implements IBeadModel
	{
		/**
		 * Constructor.
		 */
		public function Model()
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
		}
    }
}