(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("Singup");
            this.set_titletext("New Form");
            if (Form == this.constructor)
            {
                this._setFormPosition(1280,720);
            }
            
            // Object(Dataset, ExcelExportObject) Initialize

            
            // UI Components Initialize
            obj = new Edit("Edit00","30","30","800","549",null,null,null,null,null,null,this);
            obj.set_taborder("0");
            this.addChild(obj.name, obj);

            obj = new Button("btn_singup2","339","460","60","40",null,null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_text("회원가입");
            this.addChild(obj.name, obj);

            obj = new Button("btn_cell","441","460","60","40",null,null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_text("취소");
            this.addChild(obj.name, obj);

            obj = new TextArea("t_sid","299","114","201","40",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            this.addChild(obj.name, obj);

            obj = new TextArea("t_spw","300","170","201","40",null,null,null,null,null,null,this);
            obj.set_taborder("4");
            this.addChild(obj.name, obj);

            obj = new TextArea("t_spw2","299","220","201","40",null,null,null,null,null,null,this);
            obj.set_taborder("5");
            this.addChild(obj.name, obj);

            obj = new TextArea("t_name","299","270","201","40",null,null,null,null,null,null,this);
            obj.set_taborder("6");
            this.addChild(obj.name, obj);

            obj = new TextArea("t_pn","299","319","201","40",null,null,null,null,null,null,this);
            obj.set_taborder("7");
            this.addChild(obj.name, obj);

            obj = new TextArea("t_zip","300","370","301","40",null,null,null,null,null,null,this);
            obj.set_taborder("8");
            this.addChild(obj.name, obj);

            obj = new Button("btn_idcheck","540","114","80","35",null,null,null,null,null,null,this);
            obj.set_taborder("9");
            obj.set_text("중복확인");
            this.addChild(obj.name, obj);

            obj = new Button("btn_zipsearch","631","370","80","40",null,null,null,null,null,null,this);
            obj.set_taborder("10");
            obj.set_text("주소찾기");
            this.addChild(obj.name, obj);

            obj = new Static("Static00","241","113","60","41",null,null,null,null,null,null,this);
            obj.set_taborder("11");
            obj.set_text("ID");
            this.addChild(obj.name, obj);

            obj = new Static("Static01","239","170","60","40",null,null,null,null,null,null,this);
            obj.set_taborder("12");
            obj.set_text("PW");
            this.addChild(obj.name, obj);

            obj = new Static("Static02","239","219","60","40",null,null,null,null,null,null,this);
            obj.set_taborder("13");
            obj.set_text("PW확인");
            this.addChild(obj.name, obj);

            obj = new Static("Static03","241","269","60","40",null,null,null,null,null,null,this);
            obj.set_taborder("14");
            obj.set_text("이름");
            this.addChild(obj.name, obj);

            obj = new Static("Static04","239","319","60","40",null,null,null,null,null,null,this);
            obj.set_taborder("15");
            obj.set_text("PH");
            this.addChild(obj.name, obj);

            obj = new Static("Static05","239","370","60","40",null,null,null,null,null,null,this);
            obj.set_taborder("16");
            obj.set_text("주소");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","",1280,720,this,function(p){});
            obj.set_mobileorientation("landscape");
            this.addLayout(obj.name, obj);
            
            // BindItem Information

        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script
        this.registerScript("Singup.xfdl", function() {

        this.Button00_onclick = function(obj,e)
        {

        };

        this.Static03_onclick = function(obj,e)
        {

        };

        });
        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.Static03.addEventHandler("onclick",this.Static03_onclick,this);
        };

        this.loadIncludeScript("Singup.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
