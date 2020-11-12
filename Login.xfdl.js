(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("Login");
            this.set_titletext("New Form");
            if (Form == this.constructor)
            {
                this._setFormPosition(450,250);
            }
            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Edit("Edit00","26","15","394","225",null,null,null,null,null,null,this);
            obj.set_taborder("0");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cancel","330","205","70","30",null,null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_text("취소");
            this.addChild(obj.name, obj);

            obj = new Button("btn_login","254","205","70","30",null,null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_text("로그인");
            this.addChild(obj.name, obj);

            obj = new Button("btn_singup","179","205","70","30",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            obj.set_text("회원가입");
            this.addChild(obj.name, obj);

            obj = new Edit("Edit01","60","40","340","154",null,null,null,null,null,null,this);
            obj.set_taborder("4");
            this.addChild(obj.name, obj);

            obj = new TextArea("t_lid","170","80","200","35",null,null,null,null,null,null,this);
            obj.set_taborder("5");
            this.addChild(obj.name, obj);

            obj = new TextArea("TextArea00_00","170","120","200","35",null,null,null,null,null,null,this);
            obj.set_taborder("6");
            this.addChild(obj.name, obj);

            obj = new Static("Static00","121","80","50","35",null,null,null,null,null,null,this);
            obj.set_taborder("7");
            obj.set_text("ID");
            this.addChild(obj.name, obj);

            obj = new Static("Static01","120","120","50","35",null,null,null,null,null,null,this);
            obj.set_taborder("8");
            obj.set_text("PW");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","",450,250,this,function(p){});
            obj.set_mobileorientation("landscape");
            this.addLayout(obj.name, obj);
            
            // BindItem Information

        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script

        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.TextArea00_00.addEventHandler("onchanged",this.TextArea00_00_onchanged,this);
        };

        this.loadIncludeScript("Login.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
