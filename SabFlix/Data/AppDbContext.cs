using Microsoft.EntityFrameworkCore;
using SabFlix.Models;

namespace SabFlix.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        { }

        public DbSet<Filme> Filmes { get; set; }
        public DbSet<Genero> Generos { get; set; }
        public DbSet<FilmeGenero> FilmeGeneros { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
            {
                modelBuilder.Entity<FilmeGenero>()
                    .HasKey(fg => new { fg.FilmeId, fg.GeneroId });

                modelBuilder.Entity<FilmeGenero>()
                    .HasOne(fg => fg.Filme)
                    .WithMany(f => f.FilmeGeneros)
                    .HasForeignKey(fg => fg.FilmeId);

                modelBuilder.Entity<FilmeGenero>()
                    .HasOne(fg => fg.Genero)
                    .WithMany(g => g.FilmeGeneros)
                    .HasForeignKey(fg => fg.GeneroId);
            }

    }
}
