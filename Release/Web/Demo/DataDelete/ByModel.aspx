<%@ Page Language="C#" %>
<%@ Import Namespace="MuaBox" %>
<%@ Import Namespace="MuaBox._Common" %>
<%@ Import Namespace="MuaModel.muabox" %>
<%@ Import Namespace="MuaModel.muabox.Extra.artist" %>
<%@ Import Namespace="MuaModel.muabox.Extra.user_info" %>
<%@ Import Namespace="MuaBox._Config" %>
<%@ Import Namespace="MySql.Data.MySqlClient" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>通过模型实例删除指定ID的歌手信息</title>
</head>
<body>

    <% 
        
        artist_delete artist_delete = new artist_delete();

        artist_delete.id_artist = 2;

        PageProcess pageProcess = new PageProcess(typeof(artist_delete), artist_delete, PageProcessMode.DataDelete);

        pageProcess.Execute();
        
    %>

</body>
</html>
