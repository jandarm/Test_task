using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace ASP_test.Models
{
    public class Expense
    {
        [Key]
        public int Id { get; set; }
        [DisplayName("Расходы")]
        [Required]
        public string ExpenseName { get; set; }
        [Required]
        [Range(1, int.MaxValue, ErrorMessage = "Кол-во не может быть меньше 0!")]
        [DisplayName("Кол-во")]
        public int Amount { get; set; }
    }
}
