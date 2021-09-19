package com.spacio.fm.client2.controllers
{

   import com.spacio.fm.client2.services.LovBO;
   import org.apache.royale.collections.ArrayList;

   public class LovController
   {
         [Inject]
         public var lovBO:LovBO; 

       //  [Bindable]
         public var genericLovs:ArrayList;

       public function LovController()
       {
           trace('  -- LovController -- ');
       }


       /**
		 * [PostConstruct] methods are invoked after all dependencies are injected.
		 * In this example, we set up a default user after the bean is created.
		 */ 
        [PostConstruct]
		public function fetchLovs() : void
		{

			trace(' -- [PostConstruct] fetch lovs country prefix  -- ');

			//genericLovs = lovBO.lov2;

            lovBO.lov2;
		}

   }

}