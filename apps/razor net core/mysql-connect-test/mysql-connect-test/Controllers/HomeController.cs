using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using mysql_connect_test.Models;
using MySql.Data.MySqlClient;


namespace mysql_connect_test.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        string connString = "Server=localhost;Port=3306;Database=netcoredb;user=root;password=";
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }


        //custom methods
        [HttpPost]
        public IActionResult Index(Item item)
        {
            MySqlConnection conn = new MySqlConnection(connString);
            conn.Open();

            //do business here
            string query = "insert into items(name) value('" + item.name + "')";
            MySqlCommand command = new MySqlCommand(query, conn);
            command.ExecuteNonQuery();
            conn.Close();
            return View();
        }

        public IActionResult Check()
        {
            MySqlConnection conn = new MySqlConnection(connString);
            List<Item> array = new List<Item>();
            conn.Open();
            string query = "select * from items;";
            MySqlCommand command = new MySqlCommand(query, conn);
            MySqlDataReader reader = command.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Item item = new Item();
                    item.id = reader.GetInt32(0);
                    item.name = reader.GetString(1);
                    array.Add(item);
                }
                reader.Close();
            }
            conn.Close();
            return Json(array);
        }



    }
}
