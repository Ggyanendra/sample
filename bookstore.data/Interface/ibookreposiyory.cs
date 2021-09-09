using bookstore.data.models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace bookstore.data.Interface
{
  public  interface ibookreposiyory
    {
        List<book> GetAllbooks();
        book GetBook(int id);
    }
}
