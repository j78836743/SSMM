$(function() {

    //初始化列表
    $("#emp-list").datagrid({
        //工具栏
        toolbar : '#emp-list-toolbar',
        //远程访问后台请求 并返回数据信息
        url : contextPath + "/emp/query",
        //请求类型
        method : 'post',
        //是否显示斑马线
        striped : true,
        //加载信息
        loadMsg : '正在玩命加载，请稍等...',
        //分页工具栏
        pagination : true,
        //显示行号
        rownumbers : true,
        //当前页
        pageNumber : 1,
        //每页记录数
        pageSize : 10,
        //每页记录数列表
        pageList : [10,50,100],
        //自适应
        fit : true,
        //列自适应
        fitColumns : true,
        //列 接收后台响应的json信息
        columns : [[
            {title:"主键ID",field:"id",checkbox:true},
            {title:"员工姓名",field:"ename",align:'center',width:50},
            {title:"员工编号",field:"eno",align:'center',width:80},
            {title:"员工职位",field:"job",align:'center',width:60,
                formatter:function(value,row,index){
                    //value表示当前列的值 员工职位信息
                    //row表示当前一行的数据信息  row.ename
                    //index表示行的下标   下标从0开始
                    if(value == 'gcs') {
                        return '<span style="color:red">工程师</span>';
                    }else if(value == "xzzl") {
                        return '行政助理';
                    }

                    return '';
                }
            },
            {title:"员工薪资",field:"salary",align:'center',width:80},
            {title:"员工部门",field:"dname",align:'center',width:80},
            {title:"入职时间",field:"hiredate",align:'center',width:100}
        ]]

    });

});


//操作事件
var eventObj = {
    query : function() {
        $("#emp-dialog").dialog({
            title: '员工查询',
            width: 400,
            height: 280,
            closed: false,
            cache: false,
            href: contextPath + '/pages/emp/query.jsp',
            modal: true ,
            buttons : [
                {
                    text : '查询',
                    iconCls : 'icon-search',
                    handler : function() {
                        //load方法会重新发送url属性和method属性
                        $("#emp-list").datagrid("load",{
                            ename : $("#ename").textbox("getValue"),
                            did : $("#did").combotree("getValue"),
                            startTime : $("#startTime").datebox("getValue"),
                            endTime : $("#endTime").datebox("getValue")
                        });
                        //关闭查询窗口
                        $("#emp-dialog").dialog("close");
                        $("#emp-dialog").dialog("clear");
                    }
                }
            ]
        });
    },
    add : function(){
        $("#emp-dialog").dialog({
            title: '增加',
            width: 400,
            height: 300,
            closed: false,
            cache: false,
            href: contextPath + '/pages/emp/addAndUpdate.jsp',
            modal: true ,
            buttons:[
                {
                    text:'添加',
                    iconCls:'icon-add',
                    handler:function(){

                        $("#emp-form").form("submit",{

                            url:contextPath + '/emp/add',

                            onSubmit : function(p){
                                p.etoak = 'et1807';

                                return $("#emp-form").form('validate');
                            },
                            success : function(result){
                                var data = $.parseJSON(result);
                                if(data.code == '200') {
                                    //关闭窗口
                                    $("#emp-dialog").dialog("close");
                                    //清除窗口信息
                                    $("#emp-dialog").dialog("clear");
                                }

                                $.messager.show({
                                    title:'提示',
                                    msg:data.msg,
                                    timeout:5000,
                                    showType:'slide'
                                });

                            }
                        });
                    }
                }
            ]

        });

    },
    update : function(){
        var rows = $("#emp-list").datagrid("getSelections");
        var row = $('#emp-list').datagrid('getSelected');

        if(rows.length != 1){
            alert("你选中了"+rows.length+"条，修改功能只能选一条");
        }else {

            $("#emp-dialog").dialog({
                title: '修改',
                width: 400,
                height: 300,
                closed: false,
                cache: false,
                href: contextPath + '/pages/emp/addAndUpdate.jsp',
                modal: true ,
                onLoad:function(){
                    $("#password").textbox('readonly');
                    $("#eno").textbox('readonly');
                    $('#cc').combotree('setValue', row.did);
                    $('#cc').combotree('setText', row.dname);
                    $('#emp-form').form('load',{
                        id:row.id,
                        ename:row.ename,
                        password:row.password,
                        eno:row.eno,
                        job:row.job,
                        salary:row.salary,


                    });


                },
                buttons:[
                    {
                        text:'添加',
                        iconCls:'icon-add',
                        handler:function(){

                            $("#emp-form").form("submit",{

                                url:contextPath + '/emp/update',

                                onSubmit : function(p){
                                    p.etoak = 'et1807';

                                    return $("#emp-form").form('validate');
                                },
                                success : function(result){

                                    $("#emp-list").datagrid('reload');
                                    var data = $.parseJSON(result);
                                    if(data.code == '200') {

                                        //关闭窗口
                                        $("#emp-dialog").dialog("close");
                                        //清除窗口信息
                                        $("#emp-dialog").dialog("clear");
                                    }

                                    $.messager.show({
                                        title:'提示',
                                        msg:data.msg,
                                        timeout:5000,
                                        showType:'slide'
                                    });

                                }
                            });
                        }
                    }
                ]
            });

        }


    },
    remove : function(){

    }
};





