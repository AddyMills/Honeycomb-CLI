using GH_Toolkit_Core.Methods;
using PAK_Compiler;

string runProg = args[0];
string[] Args = args.Skip(1).ToArray();

void ShowHelp()
{
    Console.WriteLine("Usage:");
    Console.WriteLine("  pak <args> - Run the PAK compiler with specified arguments.");
    Console.WriteLine("For help with any of the commands, type '<command> --help'.");
    // Add more usage instructions as needed
}

if (runProg == "pak")
{
    PakFuncs pakFuncs = new PakFuncs(Args);
}
else
{
    ShowHelp();
}