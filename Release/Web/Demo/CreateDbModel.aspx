<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>创建数据表</title>
</head>
<body>
    <div>
    <%
        /*
            按照 MuaModel 类库的结构 在数据库中创建数据表
       
            注意：数据库必须已经存在
       
            例如 MuaModel 中的 muabox 代表在数据库中必须已经存在名为 muabox 的数据库
       */
        DbHelper.CreateDatabaseTableAndHashByModel();
    %>
    </div>
</body>
</html>
