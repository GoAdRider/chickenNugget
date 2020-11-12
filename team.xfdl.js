(function()
{
    return function()
    {
        if (!this._is_form)
            return;
        
        var obj = null;
        
        this.on_create = function()
        {
            this.set_name("test1");
            this.set_titletext("New Form");
            if (Form == this.constructor)
            {
                this._setFormPosition(1420,720);
            }
            
            // Object(Dataset, ExcelExportObject) Initialize
            obj = new Dataset("t_colum", this);
            obj._setContents("<ColumnInfo><Column id=\"글번호\" type=\"STRING\" size=\"150\"/><Column id=\"글제목\" type=\"STRING\" size=\"350\"/><Column id=\"날짜\" type=\"STRING\" size=\"200\"/><Column id=\"조회수\" type=\"STRING\" size=\"50\"/><Column id=\"작성자\" type=\"STRING\" size=\"100\"/></ColumnInfo><Rows><Row><Col id=\"글번호\">123</Col><Col id=\"글제목\">파뤼</Col><Col id=\"날짜\">오늘</Col><Col id=\"조회수\">0</Col><Col id=\"작성자\">나</Col></Row><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/><Row/></Rows>");
            this.addChild(obj.name, obj);
            
            // UI Components Initialize
            obj = new Button("btn_login","1240","60","100","40",null,null,null,null,null,null,this);
            obj.set_taborder("0");
            obj.set_text("로그인");
            this.addChild(obj.name, obj);

            obj = new Button("btn_singup","1120","60","100","40",null,null,null,null,null,null,this);
            obj.set_taborder("1");
            obj.set_text("회원가입");
            this.addChild(obj.name, obj);

            obj = new Static("Static00","350","100","150","60",null,null,null,null,null,null,this);
            obj.set_taborder("2");
            obj.set_text("임시게시판");
            this.addChild(obj.name, obj);

            obj = new Grid("Grid00","245","110","850","510",null,null,null,null,null,null,this);
            obj.set_taborder("3");
            obj.set_binddataset("t_colum");
            obj._setContents("<Formats><Format id=\"default\"><Columns><Column size=\"150\"/><Column size=\"350\"/><Column size=\"150\"/><Column size=\"95\"/><Column size=\"100\"/></Columns><Rows><Row size=\"24\" band=\"head\"/><Row size=\"24\"/></Rows><Band id=\"head\"><Cell text=\"글번호\"/><Cell col=\"1\" text=\"글제목\"/><Cell col=\"2\" text=\"날짜\"/><Cell col=\"3\" text=\"조회수\"/><Cell col=\"4\" text=\"작성자\"/></Band><Band id=\"body\"><Cell text=\"bind:글번호\"/><Cell col=\"1\" text=\"bind:글제목\"/><Cell col=\"2\" text=\"bind:날짜\"/><Cell col=\"3\" text=\"bind:조회수\"/><Cell col=\"4\" text=\"bind:작성자\"/></Band></Format></Formats>");
            this.addChild(obj.name, obj);

            obj = new Button("btn_search","990","630","105","45",null,null,null,null,null,null,this);
            obj.set_taborder("4");
            obj.set_text("검색");
            this.addChild(obj.name, obj);

            obj = new Combo("cb_title","245","630","99","45",null,null,null,null,null,null,this);
            obj.set_taborder("5");
            obj.set_text("제목");
            this.addChild(obj.name, obj);

            obj = new TextArea("ta_search","344","630","646","45",null,null,null,null,null,null,this);
            obj.set_taborder("6");
            this.addChild(obj.name, obj);

            obj = new Button("btn_next","810","680","40","25",null,null,null,null,null,null,this);
            obj.set_taborder("7");
            obj.set_text("다음");
            this.addChild(obj.name, obj);

            obj = new Button("btn_9","778","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("8");
            obj.set_text("9");
            this.addChild(obj.name, obj);

            obj = new Button("btn_8","745","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("9");
            obj.set_text("8");
            this.addChild(obj.name, obj);

            obj = new Button("btn_7","712","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("10");
            obj.set_text("7");
            this.addChild(obj.name, obj);

            obj = new Button("btn_6","677","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("11");
            obj.set_text("6");
            this.addChild(obj.name, obj);

            obj = new Button("btn_5","642","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("12");
            obj.set_text("5");
            this.addChild(obj.name, obj);

            obj = new Button("btn_4","605","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("13");
            obj.set_text("4");
            this.addChild(obj.name, obj);

            obj = new Button("btn_3","570","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("14");
            obj.set_text("3");
            this.addChild(obj.name, obj);

            obj = new Button("btn_2","535","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("15");
            obj.set_text("2");
            this.addChild(obj.name, obj);

            obj = new Button("btn_1","500","680","25","25",null,null,null,null,null,null,this);
            obj.set_taborder("16");
            obj.set_text("1");
            this.addChild(obj.name, obj);

            obj = new Button("btn_clientboard","770","60","150","45",null,null,null,null,null,null,this);
            obj.set_taborder("17");
            obj.set_text("c게시판");
            this.addChild(obj.name, obj);

            obj = new Button("btn_serverboard","597","60","150","45",null,null,null,null,null,null,this);
            obj.set_taborder("18");
            obj.set_text("서버게시판");
            this.addChild(obj.name, obj);

            obj = new Button("btn_freeboard","420","60","150","45",null,null,null,null,null,null,this);
            obj.set_taborder("19");
            obj.set_text("자유게시판");
            this.addChild(obj.name, obj);

            obj = new Button("btn_totalboard","245","60","150","45",null,null,null,null,null,null,this);
            obj.set_taborder("20");
            obj.set_text("통합게시판");
            this.addChild(obj.name, obj);

            obj = new Static("Static01","170","50","95","57",null,null,null,null,null,null,this);
            obj.set_taborder("21");
            obj.set_text("게시판");
            this.addChild(obj.name, obj);

            obj = new Button("btn_service","940","60","150","45",null,null,null,null,null,null,this);
            obj.set_taborder("22");
            obj.set_text("문의게시판");
            this.addChild(obj.name, obj);

            // Layout Functions
            //-- Default Layout : this
            obj = new Layout("default","",1420,720,this,function(p){});
            obj.set_mobileorientation("landscape");
            this.addLayout(obj.name, obj);
            
            // BindItem Information

        };
        
        this.loadPreloadList = function()
        {

        };
        
        // User Script
        this.registerScript("team.xfdl", function() {

        this.btn_free_onclick = function(obj,e)
        {
        	alert("조회 호출 성공")
        	this.transaction("empSearch","SvcURL::select_emp.jsp","in_emp=ds_emp","ds_emp=out_emp,","fn_callback");
        };

        this.Div00_Button01_00_00_00_onclick = function(obj,e)
        {

        };

        this.Div00_Button00_onclick = function(obj,e)
        {

        };

        this.Div00_Div01_Menu00_onmenuclick = function(obj,e)
        {

        };

        this.Div00_Div01_Button01_onclick = function(obj,e)
        {

        };

        this.Div00_Div01_TextArea00_onchanged = function(obj,e)
        {

        };

        this.Div00_Static00_onclick = function(obj,e)
        {

        };

        this.Div00_Button01_onclick = function(obj,e)
        {

        };

        this.Div00_Div01_onclick = function(obj,e)
        {

        };

        this.Static00_onclick = function(obj,e)
        {

        };

        this.Button02_04_onclick = function(obj,e)
        {

        };

        });
        
        // Regist UI Components Event
        this.on_initEvent = function()
        {
            this.Static00.addEventHandler("onclick",this.Static00_onclick,this);
            this.btn_6.addEventHandler("onclick",this.Button02_04_onclick,this);
        };

        this.loadIncludeScript("team.xfdl");
        this.loadPreloadList();
        
        // Remove Reference
        obj = null;
    };
}
)();
