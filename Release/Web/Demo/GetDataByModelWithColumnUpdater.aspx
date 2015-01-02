<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox" %>
<%@ Import Namespace="MuaBox._Common" %>
<%@ Import Namespace="MuaModel.muabox" %>
<%@ Import Namespace="MuaBox._Config" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>通过模型获取用户信息 (相当于用户登录行为)</title>
    <style type="text/css">
    span { color: #0000ff; }
    </style>
</head>
<body>

    <%
        // ========== ========== ========== ==========
        // 下方代码相当于用户登录行为 并且登录后 向 Session 添加用户唯一标识符 (字段名为 user_guid )
        //
        // 每次登录 会自动向数据表 user_login_log 添加登录记录
        // ========== ========== ========== ==========
        //
        MySqlParameter[] mySqlParameters = new MySqlParameter[2];

        mySqlParameters[0] = new MySqlParameter("@user_login_name", MySqlDbType.VarChar);
        mySqlParameters[0].Value = "user002";

        mySqlParameters[1] = new MySqlParameter("@user_login_password", MySqlDbType.VarChar);
        mySqlParameters[1].Value = "12345678";

        user_info[] user_info_s = DbHelper.GetModelData<user_info>(mySqlParameters);

        if (user_info_s != null)
        {
            foreach (user_info user_info in user_info_s)
            {
                Response.Write("<p>user_info id: [<span>" + user_info.id_userinfo + "</span>] "
                    
                    + "user_login_name: [<span>" + user_info.user_login_name + "</span>] "
                    + "user_guid: [<span>" + user_info.user_guid + "</span>] "

                    + "user_login_count: [<span>" + user_info.user_login_count + "</span>] "
                    + "user_last_login_ip: [<span>" + user_info.user_last_login_ip + "</span>] "
                    + "user_last_login_datetime: [<span>" + user_info.user_last_login_datetime + "</span>] "
                    
                    + "</p>");
            }
        }
        
        string session_user_guid = StringInit.GetSessionString("user_guid");

        Response.Write("session user_guid : [" + session_user_guid + "]");
        
    %>
    
</body>
</html>
