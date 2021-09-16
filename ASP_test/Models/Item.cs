using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace ASP_test.Models
{
    public class Item
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [DisplayName("Текущий владелец")]
        public string Borrower { get; set; }
        [Required]
        [DisplayName("Бывший владелец")]
        public string Lender { get; set; }
        [Required]
        [DisplayName("Наименование")]
        public string ItemName { get; set; }
    }
}
