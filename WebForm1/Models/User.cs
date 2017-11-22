using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebTest.Models
{
    public class User
    {
        public string UserName {get; set;}
        public int UserId { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        
    }

    public class Priority
    {
        public int PriorityId { get; set; }
        public string PriorityName { get; set; }
    }

    public class Catelog
    {
        public int CatelogId { get; set; }
        public string CatelogName { get; set; }
    }

    public class Task
    {
        public int TaskId { get; set; }
        public string TaskName { get; set; }
        public string What { get; set; }
        public DateTime When { get; set; }
        public string Where { get; set; }
        public string Who { get; set; }
        public int TaskCatelogId { get; set; }
        public int TaskPriorityId { get; set; }
    }
}