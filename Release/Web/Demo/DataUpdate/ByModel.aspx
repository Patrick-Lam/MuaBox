<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox" %>
<%@ Import Namespace="MuaBox._Common" %>
<%@ Import Namespace="MuaBox._Config" %>
<%@ Import Namespace="MuaModel.muabox" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>
<%@ Import Namespace="MuaModel.muabox.Extra.user_info" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>通过模型实例修改用户名称</title>
</head>
<body>

    <% 
        // ========== ========== ========== ==========
        // 下方代码相当于用户登录行为 并且登录后 向 Session 添加用户唯一标识符 (字段名为 user_guid )
        // ========== ========== ========== ==========
        
        MySqlParameter[] user_info_mySqlParameters = new MySqlParameter[2];

        user_info_mySqlParameters[0] = new MySqlParameter("@user_login_name", MySqlDbType.VarChar);
        user_info_mySqlParameters[0].Value = "user002";

        user_info_mySqlParameters[1] = new MySqlParameter("@user_login_password", MySqlDbType.VarChar);
        user_info_mySqlParameters[1].Value = "12345678";

        user_info[] user_info_s = DbHelper.GetModelData<user_info>(user_info_mySqlParameters);

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

        // ------------

        string session_user_guid = StringInit.GetSessionString("user_guid");

        Response.Write("session user_guid : [" + session_user_guid + "]");

        // ------------

        // ========== ========== ========== ==========
        // 下方代码创建一个模型实例 提交数据后修改用户名称
        // (提交数据时将自动从 Session 中获取并向模型填充 user_guid 的值)
        // ========== ========== ========== ==========

        user_info_update_name user_info_update_name = new user_info_update_name();

        user_info_update_name.id_userinfo = 18;
        user_info_update_name.user_login_name = "user002";

        PageProcess pageProcess = new PageProcess(typeof(user_info_update_name), user_info_update_name, PageProcessMode.DataUpdate);

        pageProcess.Execute();
        
    %>

</body>
</html>
