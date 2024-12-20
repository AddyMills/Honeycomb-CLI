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
        public PakFuncs(string[] args)
        {

        }
        static private void ErrorHandler(Exception e)
        {
            Console.WriteLine("An error occurred:");
            Console.WriteLine(e.Message);
            Console.WriteLine(e.StackTrace);
            ShowHelpMenu();
            Console.WriteLine("\nPress any key to exit.");
            Console.ReadKey();
        }
        public static void ShowHelpMenu()
        {

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
        public static void RunDeflater(string filePath)
        {
            if (!File.Exists(filePath))
            {
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

        public static void RunExtractor(string pakPath, bool noConvert = false)
        {
            string? filePath = null;


            if (File.Exists(pakPath))
            {
                filePath = pakPath;
            }
            else if (Directory.Exists(pakPath))
            {
                filePath = pakPath;
            }

            if (filePath == null)
            {
                ShowHelpMenu();
                return;
            }

            List<string> files = GetFilesFromFolder(filePath);
            foreach (string file in files)
            {
                ProcessPAKFromFile(file, !noConvert);
            }
        }

        public static void RunCompiler(string compilePath, string? gameVersion, string? console = "PC", bool split = false, string? assetContext = null)
        {
            if (gameVersion == null)
            {
                Console.WriteLine("Game version is required.");
                ShowHelpMenu();
                return;
            }

            bool isQb = false;

            // Determine if it's a QB file based on the folder name
            string? folderPath = null;

            if (Directory.Exists(compilePath))
            {
                folderPath = compilePath;
            }
            if (folderPath == null)
            {
                ShowHelpMenu();
                return;
            }
            Console.WriteLine("Compiling files from: " + folderPath);
            string rootPath = Path.GetDirectoryName(folderPath);
            string pakName = Path.GetRelativePath(rootPath, folderPath);
            isQb = pakName.Equals("qb", StringComparison.OrdinalIgnoreCase);

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
