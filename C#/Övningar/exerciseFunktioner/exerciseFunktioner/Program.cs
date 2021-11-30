using System;

namespace exerciseFunktioner
{
    class Program
    {
        static int CalcSal(int hourlyS, int hoursWo, int age)
        {
            if (age > 47)
            {
                hourlyS += 20;
            }
            int mySal = hourlyS * hoursWo;
            return mySal;
        }

        static void Huvudmeny()
        {
            Console.WriteLine("1. En grej");
            Console.WriteLine("2. Annan grej");
            Console.WriteLine("3. Avsluta");
        }

        //static void Test(int i)
        //{
        //    i = i + 1;
        //}

        static string PrintMessage()
        {
            return "Hello World!";
        }

        static string ConcatenateStrings(string s1, string s2)
        {
            return s1 + s2;
        }

        static decimal CalculateVat(decimal priceWithoutVat)
        {
            return priceWithoutVat * 0.25m;
        }

        static void Main(string[] args)
        {
            string namn = "Stefan ";
            string namn2 = "Holmberg";
            string fillname = ConcatenateStrings(namn, namn2);
            
            //int i = 123;
            //Test(i);
            //Console.WriteLine(i);

            Huvudmeny();

            while (true)
            {
                Console.WriteLine("Hur gammal är du?");
                int age = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Hur mycket tjänar du i timmen?");
                int hourlyS = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Hur många timmar");
                int hoursWo = Convert.ToInt32(Console.ReadLine());

                int mySalary = CalcSal(hourlyS, hoursWo, age);
                Console.WriteLine($"Salary:{mySalary}");
            }
        }
    }
}
