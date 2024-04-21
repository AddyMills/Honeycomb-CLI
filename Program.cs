using GH_Toolkit_Core.Methods;
using GH_Toolkit_Core.PAK;

string folderPath = args[0];
string rootPath = Path.GetDirectoryName(folderPath);
string pakName = Path.GetRelativePath(rootPath, folderPath);

string gameVersion = "GHWT"; // Default value
bool isQb = pakName == "qb" ? true : false;
bool split = false;
string console = "PC";

if (args.Contains("-gh3"))
{
    gameVersion = "GH3";
}

if (isQb || args.Contains("-split"))
{
    split = true;
}

if (args.Contains("-console"))
{
    console = args[Array.IndexOf(args, "-console") + 1];
}

PAK.PakCompiler pakCompiler = new PAK.PakCompiler(gameVersion, isQb, split);
var (pak, pab) = pakCompiler.CompilePAK(folderPath, console);
string extension;
if (console == "PS2")
{
    extension = ".ps2";
}
else if (console == "PS3")
{
    extension = ".PS3";
}
else
{
    extension = ".xen";
}
string pakPath = Path.Join(rootPath, pakName + ".pak" + extension);
string pabPath = Path.Join(rootPath, pakName + ".pab" + extension);
if (pab != null)
{

    using (FileStream pakFile = new FileStream(pakPath, FileMode.Create, FileAccess.Write))
    using (FileStream pabFile = new FileStream(pabPath, FileMode.Create, FileAccess.Write))
    {
        pakFile.Write(pak);
        pabFile.Write(pab);
    }
}
else
{
    using (FileStream pakFile = new FileStream(pakPath, FileMode.Create, FileAccess.Write))
    {
        pakFile.Write(pak);
        pakFile.Write(pab);
    }
}