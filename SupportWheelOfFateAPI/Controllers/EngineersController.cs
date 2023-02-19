using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using SupportWheelOfFateAPI.Models;

namespace SupportWheelOfFateAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EngineersController : ControllerBase
    {
        private readonly EngineerContext _context;

        public EngineersController(EngineerContext context)
        {
            _context = context;

            if (_context.Engineers.Count() == 0)
            {
                // Add default engineers if there are no engineers in the context
                var engineers = new List<Engineer>
                {
                    new Engineer { Name = "Alice" },
                    new Engineer { Name = "Bob" },
                    new Engineer { Name = "Charlie" },
                    new Engineer { Name = "Dave" },
                    new Engineer { Name = "Eve" },
                    new Engineer { Name = "Frank" },
                    new Engineer { Name = "Grace" },
                    new Engineer { Name = "Heidi" },
                    new Engineer { Name = "Ivan" },
                    new Engineer { Name = "Judy" }
                };

                foreach (var engineer in engineers)
                {
                    _context.Engineers.Add(engineer);
                }
                _context.SaveChanges();
            }
        }

        // GET: api/engineers
        [HttpGet]
        public ActionResult<IEnumerable<Engineer>> GetEngineers()
        {
            return _context.Engineers.ToList();
        }

        // GET: api/engineers/5
        [HttpGet("{id}")]
        public ActionResult<Engineer> GetEngineer(long id)
        {
            var engineer = _context.Engineers.Find(id);
            if (engineer == null)
            {
                return NotFound();
            }
            return engineer;
        }

        // POST: api/engineers
        [HttpPost]
        public ActionResult<Engineer> PostEngineer(Engineer engineer)
        {
            var newEngineer = new Engineer(engineer.Name);
            _context.Engineers.Add(newEngineer);
            _context.SaveChanges();

            return CreatedAtAction(nameof(GetEngineer), new { id = newEngineer.Id }, newEngineer);
        }

        // PUT: api/engineers/5
        [HttpPut("{id}")]
        public IActionResult PutEngineer(long id, Engineer engineer)
        {
            if (id != engineer.Id)
            {
                return BadRequest();
            }
            _context.Entry(engineer).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
            _context.SaveChanges();
            return NoContent();
        }

        // DELETE: api/engineers/5
        [HttpDelete("{id}")]
        public IActionResult DeleteEngineer(long id)
        {
            var engineer = _context.Engineers.Find(id);
            if (engineer == null)
            {
                return NotFound();
            }
            _context.Engineers.Remove(engineer);
            _context.SaveChanges();
            return NoContent();
        }
    }
}
