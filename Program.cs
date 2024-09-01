using GH_Toolkit_Core.Methods;
using static GH_Toolkit_Core.PAK.PAK;

void ShowHelpMenu()
{
    Console.WriteLine("Usage: honeycomb <mode> <options>");
    Console.WriteLine("Modes:");
    Console.WriteLine("  extract <filePath> [options]               Extracts files from a PAK archive.");
    Console.WriteLine("  compile <folderPath> -g <game> [options]   Compiles PAK files.");
    Console.WriteLine("Options for extract mode:");
    Console.WriteLine("  -q, --qb                                   Specifies that the scripts are not converted to text.");
    Console.WriteLine("Options for compile mode:");
    Console.WriteLine("  -g <game>, --game <game>                   Specifies the game version.");
    Console.WriteLine("  -c, --console <console>                    Specifies the console type (e.g., PC, PS2, PS3). Default is PC.");
    Console.WriteLine("  -s, --split                                Splits the final file into a PAK and PAB file.");
    Console.WriteLine("Available games options:");
    Console.WriteLine("GH3, GHA, GHWT, GHM, GHSH, GHVH, GH5, WOR, GHWOR");
}

void RunDeflater(string[] args)
{
    if (args.Length < 2)
    {
        ShowHelpMenu();
        return;
    }

    string filePath = args[1];

    List<string> files = GetFilesFromFolder(filePath);
    foreach (string file in files)
    {
        byte[] data = DeflateData(file);
        string output = Path.ChangeExtension(file, ".deflated");
        File.WriteAllBytes(output, data);
    }
}

void RunExtractor(string[] args)
{
    if (args.Length < 2)
    {
        ShowHelpMenu();
        return;
    }

    string filePath = args[1];
    bool convertQ = !(args.Contains("-q") || args.Contains("--qb"));

    List<string> files = GetFilesFromFolder(filePath);
    foreach (string file in files)
    {
        ProcessPAKFromFile(file, convertQ);
    }
}

void RunCompiler(string[] args)
{
    if (!args.Contains("-g"))
    {
        ShowHelpMenu();
        return;
    }

    // Initialize default values
    string gameVersion = "GHWT"; // Default value
    bool isQb = false;
    bool split = false;
    string console = "PC";

    // Parse required argument for game version
    int gameIndex = Array.IndexOf(args, "-g");
    if (gameIndex != -1 && gameIndex + 1 < args.Length)
    {
        gameVersion = args[gameIndex + 1];
    }
    else
    {
        ShowHelpMenu();
        return;
    }

    int consoleIndex = Array.IndexOf(args, "-c");
    if (consoleIndex == -1)
    {
        consoleIndex = Array.IndexOf(args, "--console");
    }

    if (consoleIndex != -1 && consoleIndex + 1 < args.Length)
    {
        console = args[consoleIndex + 1].ToUpper();
    }

    // Determine if it's a QB file based on the folder name
    string folderPath = args[1];
    if (!Directory.Exists(folderPath))
    {
        Console.WriteLine("Folder not found.");
        ShowHelpMenu();
        return;
    }
    string rootPath = Path.GetDirectoryName(folderPath);
    string pakName = Path.GetRelativePath(rootPath, folderPath);
    isQb = pakName.Equals("qb", StringComparison.OrdinalIgnoreCase);
    // Optional arguments
    if (args.Contains("-s") || args.Contains("--split") || isQb)
    {
        split = true;
    }

    // Compile PAK and PAB files
    PakCompiler pakCompiler = new PakCompiler(gameVersion, isQb, split);
    var (pak, pab) = pakCompiler.CompilePAK(folderPath, console);
    string extension = console == "PS2" ? ".ps2" : (console == "PS3" ? ".PS3" : ".xen");

    string pakPath = Path.Join(rootPath, pakName + ".pak" + extension);
    string pabPath = Path.Join(rootPath, pakName + ".pab" + extension);

    if (console == "PS3")
    {
        pakPath = pakPath.ToUpper();
        pabPath = pabPath.ToUpper();
    }

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
        }
    }
}

if (args.Length == 0)
{
    ShowHelpMenu();
    return;
}

// Check mode (extract or compile)
string? mode = null;

if (args.Contains("extract"))
{
    mode = "extract";
}
else if (args.Contains("compile"))
{
    mode = "compile";  
}
else if (args.Contains("deflate"))
{
    RunDeflater(args);
    return;
}

if (string.IsNullOrEmpty(mode) || (mode != "extract" && mode != "compile"))
{
    ShowHelpMenu();
    return;
}

if (mode == "extract")
{
    RunExtractor(args);
}
else if (mode == "compile")
{
    RunCompiler(args);
}