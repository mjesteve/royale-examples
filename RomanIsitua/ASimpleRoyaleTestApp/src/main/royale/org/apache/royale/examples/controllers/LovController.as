package org.apache.royale.examples.controllers
{

  import mx.collections.ArrayCollection;
  import mx.rpc.events.ResultEvent;
  import org.apache.royale.examples.services.LovBO;
  import org.apache.royale.collections.ArrayList;
  import org.apache.royale.examples.models.LovModel2;
  import org.apache.royale.crux.utils.services.ServiceHelper;
  import org.apache.royale.examples.dto.GenericLOV;
  import mx.rpc.events.FaultEvent;
  import org.apache.royale.examples.events.LovEvent;
  import org.apache.royale.events.IEventDispatcher;
  import org.apache.royale.events.EventDispatcher;
  import org.apache.royale.core.IBeadController;

  public class LovController
	{
    
    /**
		 *  Common todo model
		 */		
		  [Bindable]
      [Inject(source="lovModel", required="true")]     
      public var model:LovModel2;

      /**
       * the service delegate to store data in the browser
       */
      [Inject(source = "lovBO")]
      public var delegate:LovBO;

      [Dispatcher]
      public var dispatcher:IEventDispatcher;

      [Inject]
      public var serviceHelper:ServiceHelper;

      /**
       *  [PostConstruct] methods are invoked after all dependencies are injected.
       *  In this example, we set up a default user after the bean is created.
       */
      [PostConstruct]
      public function sepUpCrux():void {
			  trace(' -- [PostConstruct] LovController  -- ');
      }

      public function LovController()
      {
          trace('  -- LovController -- ');
      }
		
		  [EventHandler(event="LovEvent.GET_LIST_VALUES", properties="lovName", scope = "global")]
      public function addTodoItem(lovName:String):void 
      {
        if(lovName == "")
        {
            //Test data binding model
            var ar:Array = new Array();
            for(var idx:int = 0; idx<10; idx++)
            {
              var it:GenericLOV = new GenericLOV();
              it.code = idx;
              it.description = "Desc. "+idx.toString();
              ar.push(it);
            }
            model.lovs2 = new ArrayList(ar);
            
            setTimeout(responseTest,250);

        }else
          serviceHelper.executeServiceCall(delegate.getListOfValues(lovName), handleLovFetchResult, handleLovFetchFault);

      }

      /**
     * Handle the server call result
     */
      private function handleLovFetchResult( event : ResultEvent ) : void
      {
        // Show an Alert just to make it obvious that the save was successful.
        // currentUser = event.result as User;

        // Show an Alert just to make it obvious that the save was successful.
        // Alert.show( 'User saved successfully! id:' + currentUser.id, 'Success' );

        trace(" -- handleLovFetchResult -- ");

        var genericLovs:ArrayCollection =  event.result as ArrayCollection;

        trace(" lovs returned: " + genericLovs.length);

        model.lovs2 = toArray(genericLovs);
        responseTest();
      }

      private function responseTest():void
      {

        var evt:LovEvent = new LovEvent(LovEvent.GET_LIST_VALUES_RESPONSE);
        evt.result = "Get list ok. " + model.lovs2.length.toString() + "regs.";
        dispatcher.dispatchEvent(evt);

      }

      private function handleLovFetchFault(result:FaultEvent):void
      {
          // handle service fault
              trace(" -- handleLovFetchFault -- ");

              trace(" fault result: " + result.fault);
      }

      private function toArray(records:ArrayCollection):ArrayList
      {
        var myArList:ArrayList = new ArrayList();

        for each(var record:GenericLOV in records)
        {
          myArList.addItem(record);
        }
        return myArList;
      }

   }

}