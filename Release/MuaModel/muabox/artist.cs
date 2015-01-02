using System;
using MuaBox._Config;
using MuaBox._Config._Attribute;

namespace MuaModel.muabox
{
    public class artist
    {
        [ColumnForeignSeed]
        [ColumnAttribute(new ColumnAttributeMode[] { ColumnAttributeMode.AutoIncrement, ColumnAttributeMode.PrimaryKey })]
        public int id_artist { get; set; }

        public string artist_name { get; set; }
    }
}
