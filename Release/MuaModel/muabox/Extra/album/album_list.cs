using System;
using MuaBox._InternalModelTemplate;
using MuaBox._InternalModelTemplate._ColumnDataType;

namespace MuaModel.muabox.Extra.album
{
    public class album_list
    {
        public int id_album { get; set; }

        public string album_title { get; set; }

        public int album_price { get; set; }

        public muabox.artist id_artist { get; set; }

        public int id_genre { get; set; }

        public uploadfile_default_property album_audition { get; set; }

        public uploadfile_image_property album_cover { get; set; }

        public uploadfile_thumbnailimage_property album_cover_thumbnail { get; set; }

        public DateTime album_date { get; set; }
    }
}
