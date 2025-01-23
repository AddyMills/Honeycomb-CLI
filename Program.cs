using GH_Toolkit_Core.Methods;
using PAK_Compiler;
using System.CommandLine;
using System.CommandLine.Invocation;

void ShowHelp()
{
    Console.WriteLine("Usage:");
    Console.WriteLine("  pak <args> - Compile, extract, or deflate PAK files with specified arguments.");
    Console.WriteLine("  makesong <args> - Compile a Clone Hero style song folder to a PAK file.");
    Console.WriteLine("For help with any of the commands, type '<command> --help'.");
    // Add more usage instructions as needed
}

Command makePakCommand() 
{
    var pakCommand = new Command("pak", "Compile, extract, or deflate PAK files with specified arguments.");
    var pakPathArgument = new Argument<string>("pakPath", "The path to the PAK file.");

    var extractPakCommand = new Command("extract", "Extract a PAK file to a folder."); 
    var toQbOption = new Option<bool>(["--qb", "-q"], "Do not convert QB files to Q when extracting.");
    extractPakCommand.AddArgument(pakPathArgument);
    extractPakCommand.AddOption(toQbOption);
    extractPakCommand.SetHandler(PakFuncs.RunExtractor, pakPathArgument, toQbOption);

    var deflatePakCommand = new Command("deflate", "Deflate a PAK file.");
    deflatePakCommand.AddArgument(pakPathArgument);
    deflatePakCommand.SetHandler(PakFuncs.RunDeflater, pakPathArgument);

    var compilePakCommand = new Command("compile", "Compile a PAK file from a folder.");
    var folderPathArgument = new Argument<string>("folderPath", "The path to the folder to compile.");
    compilePakCommand.AddArgument(folderPathArgument);
    var gamePakOption = new Option<string>(["--game", "-g"], "The game the PAK file is for (required).");
    compilePakCommand.AddOption(gamePakOption);
    var assetOption = new Option<string>(["--asset", "-a"], "Specifies the asset context of the PAK. Can be a string or hex value starting with 0x.");
    compilePakCommand.AddOption(assetOption);
    var consoleOption = new Option<string>(["--console", "-c"], "The console the PAK file is for.");
    compilePakCommand.AddOption(consoleOption);
    var splitOption = new Option<bool>(["--split", "-s"], "Splits the final file into a PAK and PAB file.");
    compilePakCommand.AddOption(splitOption);
    var outputOption = new Option<string>(["--output", "-o"], "The output folder path for the compiled PAK file.");
    compilePakCommand.AddOption(outputOption);

    compilePakCommand.SetHandler(PakFuncs.RunCompiler, folderPathArgument, gamePakOption, consoleOption, splitOption, assetOption, outputOption);

    pakCommand.AddCommand(extractPakCommand);
    pakCommand.AddCommand(deflatePakCommand);
    pakCommand.AddCommand(compilePakCommand);

    return pakCommand;
}


Command gameOptionCommand()
{
    var makeSongCommand = new Command("makesong", "Compile a Clone Hero style song folder to a PAK file.");
    var folderArgument = new Argument<string>("folder", "The folder to compile.");
    makeSongCommand.AddArgument(folderArgument);
    var gameOption = new Option<string>(new string[] { "--game", "-g" }, "The game the song is for.");
    makeSongCommand.AddOption(gameOption);
    var platformOption = new Option<string>(new string[] { "--console", "-c" }, "The console the song is for.");
    makeSongCommand.AddOption(platformOption);

    makeSongCommand.SetHandler((folder, game, console) =>
    {
        MakeSong makeSong = new MakeSong(folder, game, console);
    }, folderArgument, gameOption, platformOption);
    return makeSongCommand;
}

Command qbOptionCommand()
{
    var qbCommand = new Command("qb", "Compile or decompile a QB file. (not recommended for most cases, use the PAK compiler to compile Q files directly into PAKs)");
    var qPathArgument = new Argument<string>("qpath", "The path to the Q or QB file.");
    qbCommand.AddArgument(qPathArgument);

    var gameOption = new Option<string>(new string[] { "--game", "-g" }, "The game the QB file is for.");
    qbCommand.AddOption(gameOption);

    var platformOption = new Option<string>(new string[] { "--console", "-c" }, "The console the song is for (default 360/PS3/PC).");
    platformOption.SetDefaultValue("360");
    qbCommand.AddOption(platformOption);

    qbCommand.SetHandler(QbFuncs.RunQbCompiler, qPathArgument, gameOption, platformOption);

    return qbCommand;

}

Command WadOption()
{
    var wadCommand = new Command("wad", "Compile or extract WAD files for PS2 games.");

    var extractWadCommand = new Command("extract", "Extract a WAD file to a folder.");
    var wadPathArgument = new Argument<string>("wadPath", "The path to the WAD file.");
    extractWadCommand.AddArgument(wadPathArgument);
    extractWadCommand.SetHandler(WadFuncs.RunWadExtractor, wadPathArgument);

    var compileWadCommand = new Command("compile", "Compile a WAD file from a folder.");
    var folderPathArgument = new Argument<string>("folderPath", "The path to the folder to compile.");
    var recompilePakOption = new Option<bool>(["--recompile", "-r"], "Recompile the QB.PAK file in the extracted WAD folder before compiling the WAD.");
    compileWadCommand.AddArgument(folderPathArgument);
    compileWadCommand.AddOption(recompilePakOption);
    compileWadCommand.SetHandler(WadFuncs.RunWadCompiler, folderPathArgument, recompilePakOption);

    wadCommand.AddCommand(extractWadCommand);
    wadCommand.AddCommand(compileWadCommand);

    return wadCommand;
}

var pakCommand = makePakCommand();
var makeSongCommand = gameOptionCommand();
var wadCommand = WadOption();
//var qbCommand = qbOptionCommand();

var rootCommand = new RootCommand
{
    pakCommand,
    // makeSongCommand,
    wadCommand
};

rootCommand.Invoke(args);

/*
try
{
    string runProg = args[0];
    string[] Args = args.Skip(1).ToArray();

    switch (runProg)
    {
        case "pak":
            PakFuncs pakFuncs = new PakFuncs(Args);
            break;
        default:
            ShowHelp();
            break;
    }
}
catch
{
    ShowHelp();
}*/