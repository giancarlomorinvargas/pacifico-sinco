using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Pacifico.SINCO.EN
{
    [Table("PROCURADOR")]
    public class ProcuradorEN
    {
        [Key]
        [Column("Procurador_Id")]
        public int MS_Procurador_Id { get; set; }
        [Column("V_NumProcurador")]
        public string NumProcurador { get; set; }
        [Column("V_Nombre")]
        public string Nombre { get; set; }
        [Column("V_ApellidoPaterno")]
        public string ApellidoPaterno { get; set; }
        [Column("V_ApellidoMaterno")]
        public string ApellidoMaterno { get; set; }
    }
}