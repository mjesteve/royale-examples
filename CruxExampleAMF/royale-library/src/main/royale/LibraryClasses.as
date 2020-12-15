package 
{

	/**
	 *  @private
	 *  This class is used to link additional classes into rpc.swc
	 *  beyond those that are found by dependency analysis starting
	 *  from the classes specified in manifest.xml.
	 */
	internal class LibraryClasses
	{		
		import com.mjesteve.royale.templates.beads.services.ServicesConfig; ServicesConfig;
		import com.mjesteve.royale.templates.beads.services.ServicesConfigREST; ServicesConfigREST;

		import com.mjesteve.royale.templates.beads.controllers.Controller; Controller;
		import com.mjesteve.royale.templates.beads.services.BeanProvider; BeanProvider;
		import com.mjesteve.royale.templates.beads.services.Delegate;Delegate;
		import com.mjesteve.royale.templates.beads.services.DynamicChannelSet;DynamicChannelSet;
		import com.mjesteve.royale.templates.beads.services.IDelegate;IDelegate;
		import com.mjesteve.royale.templates.beads.services.Responder;Responder;

		import com.mjesteve.royale.templates.models.AppModel; AppModel;
		
		import com.mjesteve.royale.templates.events.ExceptionEvent;ExceptionEvent;

		import  com.mjesteve.royale.templates.services.AppDelegate;AppDelegate;		
		import  com.mjesteve.royale.templates.controllers.AppController;AppController;		

		import com.mjesteve.royale.templates.events.LoginSignInEvent; LoginSignInEvent;
		import com.mjesteve.royale.templates.events.DataEvent; DataEvent;

		import com.mjesteve.royale.templates.vos.DataItemVO; DataItemVO;
		import com.mjesteve.royale.templates.vos.LoginVO; LoginVO;
		import com.mjesteve.royale.templates.vos.MenuItemVO; MenuItemVO;
		import com.mjesteve.royale.templates.vos.TypeReturnCompanies; TypeReturnCompanies;
		import com.mjesteve.royale.templates.vos.TypeReturnLogin; TypeReturnLogin;
	}
}

