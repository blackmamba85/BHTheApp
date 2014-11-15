using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BHSCMSApp.Models
{
    public class DocumentFile
    {
        public int TypeID { get; set; }
        public int ReferenceID { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public byte[] FileData { get; set; }
    }
}