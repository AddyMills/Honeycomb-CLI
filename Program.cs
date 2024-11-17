using GH_Toolkit_Core.Methods;
using PAK_Compiler;
using static GH_Toolkit_Core.PAK.PAK;

string runProg = args[0];
string[] Args = args.Skip(1).ToArray();

if (runProg == "pak")
{
    PakFuncs pakFuncs = new PakFuncs(Args);
}
