package com.mjesteve.royale.templates.services
{
    import mx.rpc.remoting.RemoteObject;
	import mx.rpc.AsyncToken;
	import com.mjesteve.royale.templates.beads.services.Delegate;
	import com.mjesteve.royale.templates.beads.services.DynamicChannelSet;
	import com.mjesteve.royale.templates.vos.DataItemVO;
	/**
	 *  @private
	 * This delegate contains the functions mapped to the backend
	 * 
	 * When we declare a new function in the backend, we must declare it here with the same definition.
	 */
    public class AppDelegate extends Delegate
	{

        public function AppDelegate()
		{
			super();
		}

        [Inject(source="SampleService", required="true")]
		public function setService(value:RemoteObject):void{
			service = value;
			var dynamicChannelSet:DynamicChannelSet = service.channelSet as DynamicChannelSet;
			dynamicChannelSet.initialize();
		}

		public function login(userName:String,userPwd:String):AsyncToken
		{
            return service.login(userName,userPwd);
		}

		public function getCompanies():AsyncToken
		{
            return service.getCompanies();
		}

		public function addCompany(reg:DataItemVO):AsyncToken
		{
            return service.addCompany(reg);
		}

		public function editCompany(idOld:String,reg:DataItemVO):AsyncToken
		{
            return service.editCompany(idOld,reg);
		}

		public function deleteCompany(id:String):AsyncToken
		{
            return service.deleteCompany(id);
		}

    }

}