using GH_Toolkit_Core.Methods;
using GH_Toolkit_Core.PAK;

string folderPath = args[0];
string rootPath = Path.GetDirectoryName(folderPath);
string pakName = Path.GetRelativePath(rootPath, folderPath);
PAK.PakCompiler pakCompiler = new PAK.PakCompiler("GHWT", false, false);
var (pak, pab, console) = pakCompiler.CompilePAK(folderPath, "PC");
string extension;
if (console == "PS2")
{
    extension = ".ps2";
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