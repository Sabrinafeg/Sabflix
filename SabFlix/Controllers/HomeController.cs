using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SabFlix.Models;
using SabFlix.Data;

namespace SabFlix.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly AppDbContext _context;

        public HomeController(ILogger<HomeController> logger, AppDbContext context)
        {
            _logger = logger;
            _context = context;
        }

        // Página inicial: lista todos os filmes com seus gêneros
        public async Task<IActionResult> Index()
        {
            var filmes = await _context.Filmes
                .Include(f => f.FilmeGeneros)
                    .ThenInclude(fg => fg.Genero)
                .ToListAsync();

            return View(filmes);
        }

        // Exibe detalhes de um filme específico
        public async Task<IActionResult> Detalhes(int id)
        {
            var filme = await _context.Filmes
                .Include(f => f.FilmeGeneros)
                    .ThenInclude(fg => fg.Genero)
                .FirstOrDefaultAsync(f => f.Id == id);

            if (filme == null)
                return NotFound();

            return View(filme);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
