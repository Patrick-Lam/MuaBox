using System;
using System.Collections.Generic;
using System.Text;
using MuaBox._Config;
using MuaBox._Config._Attribute;

namespace MuaModel.muabox
{
    public class user_password_log
    {
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.AutoIncrement, ColumnAttributeMode.PrimaryKey })]
        public int id_user_password_log { get; set; }

        [ColumnForeign(ColumnForeignParameterValueEntranceMode.Form)]
        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 24)]
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.IndexKey, ColumnAttributeMode.Binary })]
        public string user_guid { get; set; }

        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 32)]
        public string user_login_password { get; set; }

        [ColumnDefaultValue(ColumnDefaultValueMode.DateTimeNow, ColumnDefaultValueExecutionMode.Fixed, PageProcessMode.DataInsert, "yyyy-MM-dd HH:mm:ss")]
        public DateTime user_last_password_log_time { get; set; }
    }
}
