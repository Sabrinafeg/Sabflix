using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace SabFlix.Models
{
    [Table("generos")]
    public class Genero
    {
        [Column("id_genero")]
        public int Id { get; set; }

        [Column("nome")]
        public string Nome { get; set; } = "";

        public ICollection<FilmeGenero> FilmeGeneros { get; set; } = new List<FilmeGenero>();
    }
}
