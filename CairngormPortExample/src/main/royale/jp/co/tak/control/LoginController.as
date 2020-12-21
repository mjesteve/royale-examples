package jp.co.tak.control
{
	import jp.co.tak.event.LoginLoadEvent;
	//import jp.co.tak.event.LoginRoleViewEvent;
	import jp.co.tak.event.LoginSignInEvent;
	//import jp.co.tak.event.LoginLogOutEvent;
	//import jp.co.tak.command.LoginLoadCommand;
	//import jp.co.tak.command.LoginRoleViewCommand;
	import jp.co.tak.command.LoginSignInCommand;
	//import jp.co.tak.command.LoginLogOutCommand;
	
	import org.apache.royale.crux.utils.commands.CommandMap;
	
	public class LoginController extends CommandMap
	{
		
		override protected function mapCommands() : void
		{
			//mapCommand( LoginLoadEvent.EVENT_ID,LoginLoadCommand, LoginLoadEvent);
			//mapCommand( LoginRoleViewEvent.EVENT_ID,LoginRoleViewCommand, LoginRoleViewEvent);
			mapCommand( LoginSignInEvent.EVENT_ID,LoginSignInCommand, LoginSignInEvent);
			//mapCommand( LoginLogOutEvent.EVENT_ID,LoginLogOutCommand, LoginLogOutEvent);
		}
	}
}
