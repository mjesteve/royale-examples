package com.spacio.fm.client2.services
{
 
   import mx.rpc.remoting.mxml.RemoteObject;
   import org.apache.royale.crux.utils.services.ServiceHelper;
   import mx.rpc.events.ResultEvent;
   import mx.rpc.events.FaultEvent;
   import mx.collections.ArrayCollection;
   import org.apache.royale.collections.ArrayList;
   import com.spacio.mdx.generic.dto.GenericLOV;
   import org.apache.royale.events.Event;
    //import org.apache.royale.events.EventDispatcher;
    import org.apache.royale.events.IEventDispatcher;
    
 
 //[Event(name="lovsChanged", type="org.apache.royale.events.Event")]
  //[Bindable] 
   public class LovBO
   {

      /**
         * The [Dispatcher] metadata tag instructs Crux to inject an event dispatcher.
         * Event's dispatched via this dispatcher can trigger event mediators.
         */ 
        [Dispatcher]
        public var dispatcher : IEventDispatcher;
      
      [Inject( "lovService" )]
      public var lovService:RemoteObject;

      [Inject]
      public var serviceHelper:ServiceHelper;

       [Bindable]
      public var _lovs:Array;

       [Bindable]
      public var _lovs2:ArrayList;

       private var genericLovs:ArrayCollection;

      public function LovBO()
      {
          trace(" -- LovBO() -- ");

           _lovs = new Array();

            _lovs2 = new ArrayList();

      }


      public function get lov():Array
     {

        trace(" -- lov() -- ");

          if (_lovs.length == 0)
          {
            trace(" fetch lovs ");
            // call here
            //  serviceHelper.executeServiceCall(userService.saveUser( user ), handleSaveUserResult);
               
              var lovName:String = "phoneCountryPrefix";



              serviceHelper.executeServiceCall(lovService.getListOfValues(lovName), handleLovFetchResult, handleLovFetchFault);
         
          }


         return _lovs;
     }


     public function get lov2():ArrayList
     {

        trace(" -- lov2() -- ");

          if (_lovs2.length == 0)
          {
            trace(" fetch lovs ");
            // call here
            //  serviceHelper.executeServiceCall(userService.saveUser( user ), handleSaveUserResult);
               
              var lovName:String = "phoneCountryPrefix";



              serviceHelper.executeServiceCall(lovService.getListOfValues(lovName), handleLovFetchResult, handleLovFetchFault);
         
          }


         return _lovs2;
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

        genericLovs =  event.result as ArrayCollection;

          trace(" lovs returned: " + genericLovs.length);

          toArray(genericLovs);

          if (_lovs2.length > 0)
          {
            // fire event here
          //  trace(" dispatch lov changed event ...");
           //  dispatcher.dispatchEvent( new Event("lovsChanged") );

           trace(" lov fetched !");
             
          }
          else
          {
            trace(" no lov returned");
          }
    }


    private function handleLovFetchFault(result: FaultEvent):void
   {
      // handle service fault
          trace(" -- handleLovFetchFault -- ");

          trace(" fault result: " + result.fault);
   }


   private function toArray(records:ArrayCollection): void
   {
          
        for each(var record:GenericLOV in records)
         {
          // _lovs.push(record);
            _lovs2.addItem(record);
         }

   }


   }

}