using System;

namespace exercisesStrings
{
    class Program
    {
        static void Main(string[] args)
        {
            string namn = "Stefan dum hej hej";
            while(true)
            {
                string meddelande = Console.ReadLine();
                if (meddelande.Length > 10)
                {
                    Console.WriteLine("Minst 9 tecken");
                }
                if (meddelande.Contains("dum") || meddelande.Contains("blä"))
                {
                    meddelande = meddelande.Replace("dum", "***");
                }

                
                Console.WriteLine($"Chatten: {meddelande}");
            }
        }
    }
}
