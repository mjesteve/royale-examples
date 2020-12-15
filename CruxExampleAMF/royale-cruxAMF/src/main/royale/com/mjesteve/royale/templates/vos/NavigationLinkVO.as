package com.mjesteve.royale.templates.vos
{
    import org.apache.royale.collections.IArrayList;
    
    [Bindable]
    public class NavigationLinkVO
    {
        public var label:String;
        public var hash:String;
        public var icon:String;
        public var disabled:Boolean;
        
        //for collapsible example
        public var subMenu:IArrayList;
        public var open:Boolean;
        public var selectedChild:NavigationLinkVO;

        public function NavigationLinkVO(label:String, hash:String, icon:String = null, disabled:Boolean = false)
        {
            this.label = label;
            this.hash = hash;
            this.icon = icon;
            this.disabled = disabled;
        }
    }
}