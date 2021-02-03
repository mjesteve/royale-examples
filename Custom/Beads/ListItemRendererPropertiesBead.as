package com.iest.winplusweb.jewel.beads.itemRenderers
{
	import org.apache.royale.core.Bead;
	import com.iest.winplusweb.beads.IPropertiesBead;
	import org.apache.royale.events.Event;
	import org.apache.royale.core.IDataProviderModel;
	
	public class ListItemRendererPropertiesBead extends Bead implements IPropertiesBead
	{
		
		public function ListItemRendererPropertiesBead()
		{
		}

		private var _propertiesIt:Object;
		public function get propertiesIt():Object
        {
            return _propertiesIt;
        }
        public function set propertiesIt(value:Object):void
        {
            _propertiesIt = value;
			(_strand.getBeadByType(IDataProviderModel) as IDataProviderModel).dispatchEvent(new Event('dataProviderChanged'));
        }

	}
}
