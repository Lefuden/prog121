using System;

namespace exercisesLoop
{
    class Program
    {
        static void Main(string[] args)
        {
            lab5();
            return;
            }

        static void lab3()
        {
            while (true)
            {
                Console.WriteLine("Mata in tal 1");
                int tal1 = Convert.ToInt32(Console.ReadLine());
                Console.WriteLine("Mata in tal 2");
                int tal2 = Convert.ToInt32(Console.ReadLine());

                Console.WriteLine($"Summa av {tal1} och {tal2} är {tal1 + tal2}");
                Console.WriteLine("Skriv sedan en fråga - Vill du fortsätta? [Y]ES/[N]O");
                string cont;
                while (true)
                {
                    cont = Console.ReadLine();
                    cont = cont.ToUpper();
                    if (cont == "YES" || cont == "NO" || cont == "N" || cont == "Y")
                    {
                        break;
                    }
                    Console.WriteLine("Skriv Y eller N tack");
                }

                if (cont == "N")
                {
                    break;
                }
            }
        }
        static void lab4()
        {
            int sum = 0;
            for (int i = 1; i <= 10; i++)
            {
                Console.Write($"Mata in tal {i}: ");
                int tal = Convert.ToInt32(Console.ReadLine());
                sum += tal;
            }
            Console.WriteLine($"Summan {sum}");
        }
        static void lab4while()
        {
            int sum = 0;
            int i = 1;
            while (i <= 10)
            {
                Console.Write($"Mata in tal {i}: ");
                int tal = Convert.ToInt32(Console.ReadLine());
                sum += tal;
                i = i + 1;
            }
            Console.WriteLine($"Summan {sum}");
        }
        static void lab5()
        {
            Console.WriteLine("Mata in ett tal");
            int tal = Convert.ToInt32(Console.ReadLine());
            for(int i = tal-1; i > tal; i--)
            {
                Console.WriteLine(i);
            }
        }
    }
}

