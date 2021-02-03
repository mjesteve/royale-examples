package com.iest.winplusweb.beads.controls.popup
{
        
    import org.apache.royale.core.IStrand;
    import org.apache.royale.jewel.beads.views.PopUpView;
    import org.apache.royale.core.DispatcherBead;
    import org.apache.royale.crux.events.BeanEvent;
    import org.apache.royale.events.Event;

    public class PopUpContentActiveCrux extends DispatcherBead
    {

		public function PopUpContentActiveCrux()
		{
		}

		private var viewBead:PopUpView;
		
		/**
		 *  @copy org.apache.royale.core.IBead#strand
		 *  
		 *  @langversion 3.0
		 *  @playerversion Flash 10.2
		 *  @playerversion AIR 2.6
		 *  @productversion Royale 0.9.8
		 */
		override public function set strand(value:IStrand):void
		{
			super.strand = value;
			
			viewBead = _strand.getBeadByType(PopUpView) as PopUpView;
			listenOnStrand("closePopUp", closePopUpHandler);
			listenOnStrand("showingPopUp", addContentListeners);
		}
		/**
		 * @private
		 */
		public function addContentListeners(event:Event):void
		{
			if(viewBead && viewBead.content)
			{
				dispatchEvent(new BeanEvent(BeanEvent.ADD_BEAN,viewBead.content));
				viewBead.content.addEventListener("closePopUp", closePopUpHandler);
			}
		}

		protected function closePopUpHandler(event:Event = null):void
		{
			if(viewBead && viewBead.content)
			{
				dispatchEvent(new BeanEvent(BeanEvent.REMOVE_BEAN,viewBead.content));
				viewBead.content.removeEventListener("closePopUp", closePopUpHandler);
			}
		}

	}
}