using System;

namespace Loop2
{
    class Program
    {
        static void Main(string[] args)
        {
            //skriv ut alla årtal mellan 1972 och 2021 på skärmen(while loop)
            int year2 = 1972;

            while (year2 <= 2021)
            {
                Console.WriteLine($"År {year2}");
                year2++;
            }

            //skriv ut alla årtal mellan 1972 och 2021 på skärmen(for loop)
            for (int year = 1972; year < 2021; year++)
            {
                Console.WriteLine($"År {year}");
            }

        }
    }
}
