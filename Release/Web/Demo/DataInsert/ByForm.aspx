<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox._Common" %>
<%@ Import Namespace="MuaModel.muabox" %>
<%@ Import Namespace="MuaBox._Config" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>使用 HTML Form 新增数据</title>
</head>
<body>

    <%  
        Response.Write(ModelMethod.GetFormHTMLByModel(typeof(user_info), PageProcessMode.DataInsert, true));

        //Response.Write(ModelMethod.GetFormHTMLByModel(typeof(album), PageProcessMode.DataInsert, true));

        //Response.Write(ModelMethod.GetFormHTMLByModel(typeof(genre), PageProcessMode.DataInsert, true));
        
    %>

</body>
</html>
