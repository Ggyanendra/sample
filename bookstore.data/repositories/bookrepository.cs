using bookstore.data.Interface;
using bookstore.data.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bookstore.data.repositories
{
    public class bookrepository : ibookreposiyory
    {
        public List<book> books = new List<book>
        {
            new book{id=1,title="the girl on the train",author="gyana",publicationyear=2021,callnumber="7978445480"},
             new book{id=2,title="the boy on the train",author="nilu",publicationyear=2021,callnumber="7978445480"},
              new book{id=3,title="the love on the train",author="gyana",publicationyear=2021,callnumber="7978445480"}
        };
        public List<book> GetAllbooks()
        {
           return books ;
        }

        public book GetBook(int id)
        {
            return books.FirstOrDefault(x => x.id == id);
        }
    }
}
