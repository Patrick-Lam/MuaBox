using System;
using MuaBox._Config;
using MuaBox._Config._Attribute;
using MuaBox._InternalModelTemplate._ColumnDataType;

namespace MuaModel.muabox
{
    public class album
    {
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.AutoIncrement , ColumnAttributeMode.PrimaryKey })]
        public int id_album { get; set; }

        [ColumnForeign(ColumnForeignParameterValueEntranceMode.Session)]
        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 24)]
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.IndexKey, ColumnAttributeMode.Binary })]
        public string user_guid { get; set; }

        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 100)]
        [ColumnAttribute(ColumnAttributeMode.UniqueKey)]
        public string album_title { get; set; }

        [ColumnAttribute(ColumnAttributeMode.Null)]
        public string album_description { get; set; }

        public int album_price { get; set; }

        [ColumnForeign(ColumnForeignParameterValueEntranceMode.Form)]
        [ColumnAttribute(ColumnAttributeMode.IndexKey)]
        public int id_artist { get; set; }
        //public artist id_artist { get; set; }

        [ColumnForeign(ColumnForeignParameterValueEntranceMode.Form)]
        [ColumnAttribute(ColumnAttributeMode.IndexKey)]
        public int id_genre { get; set; }
        //public Extra.genre.genre_detail id_genre { get; set; }

        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 21)]
        [ColumnAttribute(ColumnAttributeMode.UniqueKey)]
        public uploadfile_default_property album_audition { get; set; }

        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 21)]
        [ColumnAttribute(ColumnAttributeMode.UniqueKey)]
        public uploadfile_image_property album_cover { get; set; }

        [ColumnDataType(ColumnDataTypeMode.VARCHAR, 21)]
        [ColumnAttribute(ColumnAttributeMode.UniqueKey)]
        public uploadfile_thumbnailimage_property album_cover_thumbnail { get; set; }

        [ColumnDefaultValue(ColumnDefaultValueMode.DateTimeNow, ColumnDefaultValueExecutionMode.FormValueEmpty, PageProcessMode.DataInsert, "yyyy-MM-dd HH:mm:ss")]
        [ColumnAttribute(ColumnAttributeMode.IndexKey)]
        public DateTime album_date { get; set; }
    }
}
