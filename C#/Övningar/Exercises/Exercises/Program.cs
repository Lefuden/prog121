using System;

namespace Exercises
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!\n");
            //Console.Write("\nPress 'Enter' to continue\n");
            //    while (Console.ReadKey().Key != ConsoleKey.Enter)
            //{
            //}
            //-------------------------------------------------------------------

            string name = "Daniel";
            Console.WriteLine("Hello " + name + "\n");

            int age = 36;
            Console.WriteLine("Jag heter " + name + " och är " + age + " år.\n");

            //-------------------------------------------------------------------

            Console.Write("Skriv in ditt förnamn:");
            string fname = Console.ReadLine();
            Console.Write("Skriv in ditt efternamn:");
            string lname = Console.ReadLine();
            Console.WriteLine("\nDu heter: " + lname + " " + fname + "\n");

            //-------------------------------------------------------------------

            Console.WriteLine("Mata in tal 1");
                int tal1 = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("Mata in tal 2");
                int tal2 = Convert.ToInt32(Console.ReadLine());
            //Console.WriteLine("\nSumman av tal 1 och tal 2 är: " + (tal1 + tal2) + "\n");
            Console.WriteLine($"\nSumman av tal 1 och tal 2 är: {tal1 + tal2}\n");

            //-------------------------------------------------------------------

            DateTime today = DateTime.Now;
            string tYear = today.ToString();
            tYear = tYear.Substring(0, 4);
            int tYearINT = int.Parse(tYear);
            Console.WriteLine("Nuvarande år: " + tYear);

            Console.Write("\nSkriv in ditt födelseår i format YYYY: ");
            string uYear = Console.ReadLine();
            int uYearINT = int.Parse(uYear);

            //Console.WriteLine("\nDin ålder är: " + (tYearINT - uYearINT));
            Console.WriteLine($"\nDin ålder är: {tYearINT - uYearINT}");
            //-------------------------------------------------------------------

            

        }
    }
}
