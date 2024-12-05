using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static GH_Toolkit_Core.PAK.PAK;

namespace PAK_Compiler
{
    public class PakFuncs
    {
        private string[] Args;
        private Action ToRun;
        private string HelpReason = "";
        private string? RunProg = null;
        public PakFuncs(string[] args)
        {
            if (args.Length > 0)
            {
                RunProg = args[0];
                Args = args;
                if (RunProg == "decompress" || RunProg == "deflate")
                {
                    ToRun = RunDeflater;
                }
                else if (RunProg == "extract")
                {
                    ToRun = RunExtractor;
                }
                else if (RunProg == "compile")
                {
                    ToRun = RunCompiler;
                }
                else
                {
                    ToRun = ShowHelpMenu;
                }
            }
            else
            {
                ToRun = ShowHelpMenu;
            }
            try
            {
                ToRun();
            }
            catch (Exception e)
            {
                ErrorHandler(e);
            }
        }
        private void ErrorHandler(Exception e)
        {
            HelpReason = $"An error occurred while running {RunProg}:";
            Console.WriteLine(e.Message);
            Console.WriteLine(e.StackTrace);
            ShowHelpMenu();
            Console.WriteLine("\nPress any key to exit.");
            Console.ReadKey();
        }
        public void ShowHelpMenu()
        {
            if (HelpReason != "")
            {
                Console.WriteLine("Program failed due to following reason:");
                Console.WriteLine(HelpReason);
                Console.WriteLine();
            }

            Console.WriteLine("Usage: pak <mode> <options>");
            Console.WriteLine("Modes:");
            Console.WriteLine("  extract <filePath> [options]               Extracts files from a PAK archive.");
            Console.WriteLine("  compile <folderPath> -g <game> [options]   Compiles PAK files.");
            Console.WriteLine("  deflate <filePath>                         Decompresses a PAK file.");
            Console.WriteLine("Options for extract mode:");
            Console.WriteLine("  -q, --qb                                   Specifies that the scripts are not converted to text.");
            Console.WriteLine("Options for compile mode:");
            Console.WriteLine("  -g <game>, --game <game>                   Specifies the game version. Required.");
            Console.WriteLine("  -a, --asset <string>                       Specifies the asset context of the PAK. Can be a string or hex value starting with 0x");
            Console.WriteLine("  -c, --console <console>                    Specifies the console type (e.g., PC, PS2, PS3). Default is PC.");
            Console.WriteLine("  -s, --split                                Splits the final file into a PAK and PAB file.");
            Console.WriteLine("Available games options:");
            Console.WriteLine("GH3, GHA, GHWT, GHM, GHSH, GHGH, GHVH, GH5, WOR, GHWOR");
            Console.WriteLine("Available console options:");
            Console.WriteLine("360, PC, PS2, PS3, WII (lowercase for all options works too)");
        }
        void RunDeflater()
        {
            if (Args.Length < 2)
            {
                HelpReason = "No file path provided to decompress.";
                ShowHelpMenu();
                return;
            }

            string filePath = Args[1];

            if (!File.Exists(filePath))
            {
                HelpReason = "Invalid file path provided.";
                ShowHelpMenu();
                return;
            }

            List<string> files = GetFilesFromFolder(filePath);
            foreach (string file in files)
            {
                byte[] data = DeflateData(file);
                string output = Path.ChangeExtension(file, ".deflated");
                File.WriteAllBytes(output, data);
            }
        }

        void RunExtractor()
        {
            if (Args.Length < 2)
            {
                HelpReason = "No file or folder path provided to extract.";
                ShowHelpMenu();
                return;
            }

            string? filePath = null;

            foreach (string arg in Args)
            {
                if (File.Exists(arg))
                {
                    filePath = arg;
                    break;
                }
                else if (Directory.Exists(arg))
                {
                    filePath = arg;
                    break;
                }
            }

            if (filePath == null)
            {
                HelpReason = "Invalid or no file or folder path provided to extract.";
                ShowHelpMenu();
                return;
            }
            bool convertQ = !(Args.Contains("-q") || Args.Contains("--qb"));

            List<string> files = GetFilesFromFolder(filePath);
            foreach (string file in files)
            {
                ProcessPAKFromFile(file, convertQ);
            }
        }

        void RunCompiler()
        {
            if (!Args.Contains("-g"))
            {
                HelpReason = "Game version is required with flag '-g'.";
                ShowHelpMenu();
                return;
            }

            // Initialize default values
            string gameVersion = "GHWT"; // Default value
            bool isQb = false;
            bool split = false;
            string console = "PC";

            // Parse required argument for game version
            int gameIndex = Array.IndexOf(Args, "-g");
            if (gameIndex != -1 && gameIndex + 1 < Args.Length)
            {
                gameVersion = Args[gameIndex + 1].ToUpper();
            }
            else
            {
                HelpReason = "Game version is required with flag '-g'.";
                ShowHelpMenu();
                return;
            }

            int consoleIndex = Array.IndexOf(Args, "-c");
            if (consoleIndex == -1)
            {
                consoleIndex = Array.IndexOf(Args, "--console");
            }

            if (consoleIndex != -1 && consoleIndex + 1 < Args.Length)
            {
                console = Args[consoleIndex + 1].ToUpper();
            }

            string? assetContext = null;
            int assetIndex = Array.IndexOf(Args, "-a");
            if (assetIndex == -1)
            {
                assetIndex = Array.IndexOf(Args, "--asset");
            }

            if (assetIndex != -1 && assetIndex + 1 < Args.Length)
            {
                assetContext = Args[assetIndex + 1];
            }

            // Determine if it's a QB file based on the folder name
            string? folderPath = null;

            foreach (string arg in Args)
            {
                if (Directory.Exists(arg))
                {
                    folderPath = arg;
                    break;
                }
            }
            if (folderPath == null)
            {
                HelpReason = "Invalid or no folder path provided to compile.";
                ShowHelpMenu();
                return;
            }
            Console.WriteLine("Compiling files from: " + folderPath);
            string rootPath = Path.GetDirectoryName(folderPath);
            string pakName = Path.GetRelativePath(rootPath, folderPath);
            isQb = pakName.Equals("qb", StringComparison.OrdinalIgnoreCase);
            // Optional arguments
            if (Args.Contains("-s") || Args.Contains("--split") || isQb)
            {
                split = true;
            }

            // Compile PAK and PAB files
            PakCompiler pakCompiler = new PakCompiler(gameVersion, console, assetContext, isQb, split);
            var (pak, pab) = pakCompiler.CompilePAK(folderPath, console);
            string extension = "";
            switch (console)
            {
                case "PS2":
                    extension = ".ps2";
                    break;
                case "PS3":
                    extension = ".PS3";
                    break;
                case "WII":
                    extension = ".ngc";
                    break;
                default:
                    extension = ".xen";
                    break;
            }

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
    }
}
