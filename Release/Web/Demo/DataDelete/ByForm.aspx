<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox._Common" %>
<%@ Import Namespace="MuaModel.muabox.Extra.artist" %>
<%@ Import Namespace="MuaBox._Config" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>通过 HTML Form 删除指定ID的歌手信息</title>
</head>
<body>

    <%  
        Response.Write(ModelMethod.GetFormHTMLByModel(typeof(artist_delete), PageProcessMode.DataDelete, 1, true));
    %>

</body>
</html>
