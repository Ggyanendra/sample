using bookstore.data.Interface;
using bookstore.data.models;
using bookstore.data.repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
//using sampleforpracties.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace sampleforpracties.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class booksController : ControllerBase
    {
        //  public List<book> books = new List<book>
        //   {
        //     new book{id=1,title="the girl on the train",author="gyana",publicationyear=2021,callnumber="7978445480"},
        //        new book{id=2,title="the boy on the train",author="nilu",publicationyear=2021,callnumber="7978445480"},
        //        new book{id=3,title="the love on the train",author="gyana",publicationyear=2021,callnumber="7978445480"}
        //  };

        private bookrepository books = new bookrepository();
        [HttpGet]
        public ActionResult<IEnumerable<book>> GetAllbooks()
        {
            return books.GetAllbooks();
        }
        [HttpGet("{id}")]
        public ActionResult<book> Getbook(int id)
        {
            //  var book = books.FirstOrDefault(x => x.id == id);
            var book = books.GetBook(id);
            if (book == null)
            {
                return NotFound();
            }
            return book;
        }
    }
}
