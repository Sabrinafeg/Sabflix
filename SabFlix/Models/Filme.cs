using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace SabFlix.Models
{
    [Table("filmes")]
    public class Filme
    {
        [Column("id_filme")]
        public int Id { get; set; } // para combinar com a View


        [Column("nome")]
        public string Nome { get; set; } = "";

        [Column("descricao")]
        public string Descricao { get; set; } = "";

        public ICollection<FilmeGenero> FilmeGeneros { get; set; } = new List<FilmeGenero>();
    }
}
