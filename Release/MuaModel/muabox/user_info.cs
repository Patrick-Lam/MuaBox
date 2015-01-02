using System;
using System.Collections.Generic;
using System.Text;
using MuaBox._Config;
using MuaBox._Config._Attribute;
using MuaBox._Common;
using MuaBox._InternalModel;

namespace MuaModel.muabox
{
    public class user_info
    {
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.AutoIncrement, ColumnAttributeMode.UniqueKey })]
        public int id_userinfo { get; set; }

        [ColumnBackup(DataStatusMode.DataChanged, new Type[] { typeof(user_password_log), typeof(user_login_log) })]
        [ColumnHashSeed]
        [ColumnForeignSeed]
        [ColumnDefaultValue(ColumnDefaultValueExecutionMode.Fixed, PageProcessMode.DataInsert, typeof(ModelMethod), "GetGuid")]
        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 24)]
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.UniqueKey, ColumnAttributeMode.Binary })]
        public string user_guid { get; set; }

        [ColumnDefaultOption(ColumnDefaultOptionMode.WHERE_KEY)]
        [ColumnValueFilter(ColumnValueFilterCharsMode.MuaBoxDefaultIgnoreCaseChars)]
        [ColumnValueLengthRange(4, 32)]
        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 32)]
        [ColumnAttribute(ColumnAttributeMode.PrimaryKey)]
        public string user_login_name { get; set; }

        /*
        [ColumnBackup(typeof(user_password_log))]
        [ColumnBackup(new DataStatusMode[] { DataStatusMode.Insert, DataStatusMode.DataChanged }, typeof(user_password_log))]
        [ColumnBackup(DataStatusMode.NewData, typeof(user_password_log))]
        */

        /*
            这里设定 原表 ( S ) ColumnBackup 属性字段 ( CB ) 与 目标数据表 ( T ) 字段名称必须相同
        
            T 除了必须拥有 S 里的 CB 字段外 还可以自定义一些普通字段
       
            但作为 S 的 T , T 自定义的普通字段 必须设置为可以自动提供预设值 例如 [ColumnDefaultValue] [AI]
        
            2014.10.23 13:15
          
            T 中的非自定义字段属性应该全部设定为 NULL
          
            因为假设当 S 中存在两个待复制字段 A , B 复制时 A == DataStatusMode.EmptyToEmpty , B = DataStatusMode.DataChanged
        
            这种情况 S.A 不会被复制到 T.A 因为 S.A 没有数据可复制
        
            如果 T.A 字段没有设置为 NULL 程序会报错 T.A NOT NULL
          
            2014.10.24 13:46
        
            目前限定为 待复制字段中其中一个达到被复制条件时 将触发备份器 备份所有设定了备份属性的字段
         
            2014.12.20 22:49
        */

        //TODO: 2014.12.20 21:39 => 为备份属性增加一个选项 可设定为 所有待复制字段达到备份条件才触发备份器 还是 其中一个达到条件就触发备份器

        [ColumnBackup(new DataStatusMode[] { DataStatusMode.Insert, DataStatusMode.DataChanged }, typeof(user_password_log))]
        [ColumnDefaultOption(new ColumnDefaultOptionMode[] { ColumnDefaultOptionMode.SELECT_KEY, ColumnDefaultOptionMode.WHERE_KEY })]
        [ColumnValueConverter(ColumnValueConverterMode.MD5)]
        [ColumnValueFilter(ColumnValueFilterCharsMode.MuaBoxDefaultPasswordChars)]
        [ColumnValueLengthRange(8, 16)]
        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 32)]
        public string user_login_password { get; set; }

        [ColumnDefaultValue(ColumnDefaultValueExecutionMode.Fixed, PageProcessMode.DataInsert, HttpServerVariablesMode.UserHostAddress)]
        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 39)]
        public string user_reg_ip { get; set; }

        [ColumnDefaultValue(ColumnDefaultValueMode.DateTimeNow, ColumnDefaultValueExecutionMode.Fixed, PageProcessMode.DataInsert, "yyyy-MM-dd HH:mm:ss")]
        public DateTime user_reg_datetime { get; set; }

        [ColumnBackup(DataStatusMode.DataChanged, typeof(user_login_log))]
        [ColumnUpdater(ColumnUpdaterMode.Increment)]
        [ColumnDefaultValue(ColumnDefaultValueExecutionMode.Fixed, PageProcessMode.DataInsert, (Object)0)]
        public int user_login_count { get; set; }

        [ColumnBackup(DataStatusMode.DataChanged, typeof(user_login_log))]
        [ColumnUpdater(HttpServerVariablesMode.UserHostAddress)]
        [ColumnDefaultValue(ColumnDefaultValueExecutionMode.Fixed, PageProcessMode.DataInsert, HttpServerVariablesMode.UserHostAddress)]
        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 39)]
        public string user_last_login_ip { get; set; }

        [ColumnUpdater(ColumnUpdaterMode.DateTimeNow)]
        [ColumnDefaultValue(ColumnDefaultValueMode.DateTimeNow, ColumnDefaultValueExecutionMode.Fixed, PageProcessMode.DataInsert, "yyyy-MM-dd HH:mm:ss")]
        public DateTime user_last_login_datetime { get; set; }
    }
}
