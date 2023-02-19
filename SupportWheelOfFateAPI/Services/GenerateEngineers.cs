using System;
using System.Collections.Generic;
using SupportWheelOfFateAPI.Models;

public class GenerateEngineers : IGenerateEngineers
{
    private readonly int _engineerCount = 10;

    public List<Engineer> Generate()
    {
        var engineers = new List<Engineer>();
        for (int i = 1; i <= _engineerCount; i++)
        {
            var name = $"Engineer {i}";
            var engineer = new Engineer(name)
            {
                Id = i,
                Available = true,
                LastShift = DateTime.MinValue,
                ShiftsThisPeriod = 0
            };
            engineers.Add(engineer);
        }
        return engineers;
    }
}
