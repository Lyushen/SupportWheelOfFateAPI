namespace SupportWheelOfFateAPI.Models
{
public class Engineer
{
    public int Id { get; set; }
    public string Name { get; set; }
    public bool Available { get; set; }
    public DateTime LastShift { get; set; }
    public int ShiftsThisPeriod { get; set; }

    public Engineer()
    {
    }

    public Engineer(string name)
    {
        Name = name;
    }
}
}
