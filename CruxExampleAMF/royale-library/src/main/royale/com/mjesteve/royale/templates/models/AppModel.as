package com.mjesteve.royale.templates.models
{

    import org.apache.royale.collections.ArrayList;
    import org.apache.royale.states.State;
    import com.mjesteve.royale.templates.beads.models.Model;

    /**
	 *  @private
     * The application model that contains the data to be read by the views while the data is updated by the AppController. 
     * */

    [Bindable]
    public class AppModel extends Model {

        private static var _instance:AppModel;

        public static function get instance():AppModel {
            return _instance || (_instance = new AppModel());
        }

        public function AppModel() {
            super();
            if (_instance) {
                trace('AppModel error');
                throw new Error("singleton");
            }
            _instance = this;
        }

        public static const STATE_LOGIN:String = "STATE_LOGIN";
        public static const STATE_DATA:String = "STATE_DATA";
        
        public var currentState:String = AppModel.STATE_LOGIN;

        [ArrayElementType("com.mjesteve.royale.templates.vos.dtMenuItemVO")]
        public var dtMenu:ArrayList = new ArrayList();

        [ArrayElementType("com.mjesteve.royale.templates.vos.CodeDescriptionVO")]
        public var dtMultiSingle:ArrayList
        
        [ArrayElementType("com.mjesteve.royale.templates.vos.DataItemVO")]
        public var dtCurrentData:ArrayList;

        public var dataState:String = ""

    }

}