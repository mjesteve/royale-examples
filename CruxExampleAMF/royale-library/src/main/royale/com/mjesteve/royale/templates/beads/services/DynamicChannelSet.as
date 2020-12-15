package com.mjesteve.royale.templates.beads.services
{
	import mx.core.FlexGlobals;
	import mx.messaging.Channel;
	import mx.messaging.ChannelSet;
	import mx.messaging.channels.AMFChannel;
	import mx.messaging.channels.SecureAMFChannel;

	import org.apache.royale.collections.ArrayList;

	/**
	 * Helper Class to configure Channel Set's dynamically, using parts of the application url.
	 * Use this class to avoid re-compile application when changing application context-root or to use the
	 * same application form different url's.
	 * This class append '-secure' to the name of the channel if the url is https and the channel is not configured as secure.
	 */
	public class DynamicChannelSet extends ChannelSet
    {
		// Flash remoting config issues
		private static const DEFAULT_CHANNEL_ID :String = "fluorine-amf";
		private static const DEFAULT_SERVER_NAME :String = "localhost";
		private static const DEFAULT_SERVER_PORT :int = 8080;
		private static const DEFAULT_CONTEXT_ROOT :String = "/WebSiteFxTemplateSharp";
		private static const DEFAULT_ENDPOINT_NAME :String = "Gateway.aspx";

		private static const ENFORCE_SECURE :String = "secure";
		private static const CHANNEL_DELIM :String = "-";

		private var _channelId :String;
		private var _serverName :String;
		private var _serverPort :int;
		private var _contextRoot :String;
		private var _endPointName :String;
	    private var _smallMessages:Boolean  = true;

		private var channelCreated :Boolean = false;

		/**
		 * Initialize values.
		 */
		public function DynamicChannelSet(channelIds :Array = null, clusteredWithURLLoadBalancing :Boolean = false) {
			super(channelIds, clusteredWithURLLoadBalancing);
		}

		/**
		 * Actually initialize channel.
		 * Check if not channelCreated to do so.
		 */
		public function initialize() :void {
			if (!channelCreated) {
				// create a new AMF Channel with our configuration
				var amfChannel :Channel = null;
				if (isSecure()) {
					amfChannel = new SecureAMFChannel(CHANNEL_ID, AMF_ENDPOINT);
				} else {
					amfChannel = new AMFChannel(CHANNEL_ID, AMF_ENDPOINT);
				}
				amfChannel.enableSmallMessages = _smallMessages;
				amfChannel.id = CHANNEL_ID;
				addChannel(amfChannel);
				channelCreated = true;
			}
		}

		 private var _id:String;
	    public function get id():String{
		    return _id;
	    }
	    public function set id(value:String):void{
		    _id = value;
	    }

	    private var _document:Object;
	    public function get document():Object{
		    return _document;
	    }

	    public function setDocument(document:Object, id:String = null):void
	    {
		    this._document = document;
		    this._id = id;
		    initialize();
	    }


	    public function set useSmallMessages(value:Boolean):void{
		    _smallMessages = value;
	    }

		/**
		 * Config channelId
		 */
		public function set channelId(value :String) :void {
			_channelId = value;
		}

		/**
		 * Config serverName
		 */
		public function set serverName(value :String) :void {
			_serverName = value;
		}

		/**
		 * Config serverPort
		 */
		public function set serverPort(value :int) :void {
			_serverPort = value;
		}

		/**
		 * Config contextRoot, if not set, one will bve guessed from app url.
		 * Use this for 'standalone'.
		 */
		public function set contextRoot(value :String) :void {
			_contextRoot = value;
		}

		/**
		 * Config endPointName
		 */
		public function set endPointName(value :String) :void {
			_endPointName = value;
		}

		/**
		 * Creates a proper AMF Endpoint with configured parameters. Location depends on how
		 * the application is accessed (http(s):// or file://)
		 **/
		public function get AMF_ENDPOINT() :String {
			var appurl :String;
			COMPILE::SWF
			{
			appurl = FlexGlobals.topLevelApplication.url;
			}
			COMPILE::JS
			{
			appurl = window.location.href;
			}
			var context :String = getContext(appurl);
			var endpoint :String = null;
			if (isSecure()) {
				endpoint = "https://{server.name}:{server.port}" + context + "/" + ENDPOINT_NAME; // /messagebroker/amfsecure";
			/*} else if (appurl != null && appurl.indexOf("http:") != -1) {
				endpoint = "http://{server.name}:{server.port}" + context + "/" + ENDPOINT_NAME; // /messagebroker/amf";*/
			} else {
				endpoint = "http://" + SERVER_NAME + ":" + SERVER_PORT + CONTEXT_ROOT + "/" + ENDPOINT_NAME; // /messagebroker/amf";
			}
			return endpoint;
		}

		/**
		 * Check if  FlexGlobals.topLevelApplication
		 */
		private function isSecure() :Boolean {
			var secure :Boolean = false;
			var appurl :String;
			COMPILE::SWF
			{
			appurl = FlexGlobals.topLevelApplication.url;
			}
			COMPILE::JS
			{
			appurl = window.location.href;
			}
			if (appurl != null && appurl.indexOf("https:") != -1) {
				secure = true;
			}
			return secure;
		}

		/**
		 * Extract context path from url.
		 */
		private function getContext(url :String) :String {
			var context :String = null;
			if (url) {
				var slash :Array = url.replace("//", "/").split('/');
				if (slash.length > 3) {
					context = "/" + slash[2];
				} else {
					context = "/";
				}
			}
			return context;
		}

		/**
		 * Check if is configred to be secure or application url is secure
		 * to build the channel id.
		 */
		private function get CHANNEL_ID() :String {
			var channelId :String = _channelId != null ? _channelId : DEFAULT_CHANNEL_ID;
			if (isSecure() && channelId.indexOf(ENFORCE_SECURE) == -1) {
				var split :Array = channelId.split(CHANNEL_DELIM);
				var col :ArrayList = new ArrayList(split);
				col.addItemAt(ENFORCE_SECURE, 1);
				var slice :String = null;
				channelId = "";
				var max :Number = col.length - 1;
				var pos :Number = 0;
				for (pos = 0; pos < max; pos++) {
					channelId += col.getItemAt(pos);
					channelId += CHANNEL_DELIM;
				}
				channelId += col.getItemAt(pos);
			}
			return channelId;
		}

		/**
		 * returns either default or configured server name
		 **/
		private function get SERVER_NAME() :String {
			return _serverName != null ? _serverName : DEFAULT_SERVER_NAME;
		}

		/**
		 * returns either default or configured server port
		 **/
		private function get SERVER_PORT() :int {
			return _serverPort != 0 ? _serverPort : DEFAULT_SERVER_PORT;
		}

		/**
		 * returns either default or configured context root
		 **/
		private function get CONTEXT_ROOT() :String {
			return _contextRoot != null ? _contextRoot : DEFAULT_CONTEXT_ROOT;
		}

		/**
		 *
		 */
		private function get ENDPOINT_NAME() :String {
			var name :String = _endPointName != null ? _endPointName : DEFAULT_ENDPOINT_NAME;
			if (isSecure() && name.indexOf(ENFORCE_SECURE) == -1) {
				name += ENFORCE_SECURE;
			}
			return name;
		}

	}
}
