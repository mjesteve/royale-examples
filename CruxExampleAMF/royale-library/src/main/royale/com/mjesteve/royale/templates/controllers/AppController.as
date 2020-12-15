package com.mjesteve.royale.templates.controllers
{

    import com.mjesteve.royale.templates.beads.controllers.Controller;
    import org.apache.royale.events.IEventDispatcher;
    import org.apache.royale.core.IStrand;
    import com.mjesteve.royale.templates.models.AppModel;
    import com.mjesteve.royale.templates.events.LoginSignInEvent;
    import com.mjesteve.royale.templates.services.AppDelegate;
    import mx.rpc.events.FaultEvent;
    import mx.rpc.events.ResultEvent;
    import com.mjesteve.royale.templates.vos.TypeReturnLogin;
    import com.mjesteve.royale.templates.vos.TypeReturnCompanies;
    import com.mjesteve.royale.templates.vos.DataItemVO;
    import com.mjesteve.royale.templates.vos.LoginVO;
    
    /**
     * AppController receives events from both views and backend and updates the AppModel.
     * 
     * In order to register a new model / controller and let crux do its magic, it will be necessary to register it in App.mxml.
     */

    public class AppController extends Controller {

        public function get delegate():AppDelegate {
            return _delegate as AppDelegate;
        }

        public function get model():AppModel {
            return _model as AppModel;
        }

        [Inject]
        public function setModel(value:AppModel):void {
            _model = value;
        }

        [Inject]
        public function setDelegate(value:AppDelegate):void {
            _delegate = value;
        }

        [Dispatcher]
        public var dispatcher:IEventDispatcher;

        /**
        * Constructor.
        */
        public function AppController()
        {
            super();
        }

        /**
         *  @copy org.apache.royale.core.IBead#strand
         *
         *  @langversion 3.0
         *  @playerversion Flash 10.2
         *  @playerversion AIR 2.6
         *  @productversion Royale 0.9.4
         */
        override public function set strand(value:IStrand):void {
            super.strand = value;
        }

        [EventHandler(event = "LoginSignInEvent.EVENT_LOAD", properties = "vo",scope="global")]            
        public function toLoginSignInEvent(vo:LoginVO):void{
            executeServiceCall(delegate.login(vo.userName, vo.password), loginResHandler, errorHandler );
        }

        protected function loginResHandler(event:ResultEvent):void {

            var returnValue:TypeReturnLogin = event.result as TypeReturnLogin;

            if (returnValue.result) {
                model.dtMenu = returnValue.dtMenu;
                dispatcher.dispatchEvent(new LoginSignInEvent(LoginSignInEvent.EVENT_COMPLETE_RES));
            }else{
                dispatcher.dispatchEvent(new LoginSignInEvent(LoginSignInEvent.EVENT_FAILED_RES));
                
            }

        }

        [EventHandler(event = "DataEvent.GET_COMPANIES", scope="global")]            
        public function toDataEventGetCompanies():void{
            executeServiceCall(delegate.getCompanies(), getCompaniesHandler, errorHandler );
        }
        
        [EventHandler(event = "DataEvent.ADD_COMPANY", properties = "data", scope="global")]            
        public function toDataEventAddCompanies(data:DataItemVO):void{
            executeServiceCall(delegate.addCompany(data), getCompaniesHandler, errorHandler );
        }
    
        [EventHandler(event = "DataEvent.EDIT_COMPANY", properties = "data, id", scope="global")]            
        public function toDataEventEditCompanies(data:DataItemVO, id:String):void{
            executeServiceCall(delegate.editCompany(id,data), getCompaniesHandler, errorHandler );
        }
                
        [EventHandler(event = "DataEvent.DELETE_COMPANY", properties = "data", scope="global")]            
        public function toDataEventDeleteCompanies(data:DataItemVO):void{
            executeServiceCall(delegate.deleteCompany(data.id), getCompaniesHandler, errorHandler );
        }

        protected function getCompaniesHandler(event:ResultEvent):void {

            var returnValue:TypeReturnCompanies = event.result as TypeReturnCompanies;

            if (returnValue.result) {
                model.dtCurrentData = returnValue.dtSource;
            }
            model.dataState = returnValue.resultStatus

        }

        public function errorHandler(event:FaultEvent):void {
            trace(event.fault.faultCode + '\n' + event.fault.faultString);

        }

    }
}