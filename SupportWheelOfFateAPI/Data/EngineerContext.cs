using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using SupportWheelOfFateAPI.Models;

public class EngineerContext : DbContext
{
    private readonly IGenerateEngineers _generateEngineers;

    public EngineerContext(DbContextOptions options, IGenerateEngineers generateEngineers) : base(options)
    {
        _generateEngineers = generateEngineers;
    }

    public DbSet<Engineer> Engineers { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Engineer>().HasData(_generateEngineers.Generate());
    }
}
