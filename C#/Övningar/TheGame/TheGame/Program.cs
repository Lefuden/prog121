using System;

namespace TheGame
{
    class Program
    {
        static void Main(string[] args)
        {
            System.Random oRand = new Random();

            while (true)
            {
                Console.Clear();
                Console.WriteLine("1. Play");
                Console.WriteLine("2. Highscore");
                Console.WriteLine("3. Exit");
                int sel = Convert.ToInt32(Console.ReadLine());
                if(sel == 1)
                {
                    int secretNr = oRand.Next(1, 100);
                    Console.WriteLine("Guess # between 1 and 100");
                    
                    while (true)
                    {
                        int guess = Convert.ToInt32(Console.ReadLine());
                        if (guess == secretNr)
                        {
                            Console.WriteLine($"You did it! The correct number is {secretNr}!");
                            break;
                        }
                        else if(guess < secretNr)
                        {
                            Console.WriteLine("Higher");
                        }
                        else if (guess > secretNr)
                        {
                            Console.WriteLine("Lower");
                        }
                    }
                }
                if(sel == 2)
                {
                    Console.Clear();
                    Console.WriteLine("HIGHSCORE");
                }
                else if (sel == 3)
                {
                    break;
                }
            }

            Console.WriteLine("GAME OVER");
        }
    }
}
