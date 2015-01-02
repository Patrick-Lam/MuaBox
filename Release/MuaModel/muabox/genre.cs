using System;
using MuaBox._Config;
using MuaBox._Config._Attribute;

namespace MuaModel.muabox
{
    public class genre
    {
        [ColumnForeignSeed]
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.AutoIncrement, ColumnAttributeMode.PrimaryKey })]
        public int id_genre { get; set; }

        //public Extra.album.album_list[] id_genre { get; set; }
        //public Extra.album.album_list[] id_genre { get; set; }

        public string genre_name { get; set; }

        public string genre_description { get; set; }
    }
}
