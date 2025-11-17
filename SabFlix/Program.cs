using Microsoft.EntityFrameworkCore;
using SabFlix.Data;

var builder = WebApplication.CreateBuilder(args);

// Configuração do contexto com Pomelo (MySQL)
builder.Services.AddDbContext<AppDbContext>(options =>
{
    var connectionString = builder.Configuration.GetConnectionString("Conexao");
    var serverVersion = new MySqlServerVersion(new Version(8, 0, 39)); // ajuste para sua versão
    options.UseMySql(connectionString, serverVersion);
});

// MVC
builder.Services.AddControllersWithViews();

var app = builder.Build();

// Pipeline padrão
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
