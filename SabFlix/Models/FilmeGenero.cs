using System.ComponentModel.DataAnnotations.Schema;

namespace SabFlix.Models
{
    [Table("filme_genero")]
    public class FilmeGenero
    {
        [Column("id_filme")]
        public int FilmeId { get; set; }
        public Filme Filme { get; set; }

        [Column("id_genero")]
        public int GeneroId { get; set; }
        public Genero Genero { get; set; }
    }
}
