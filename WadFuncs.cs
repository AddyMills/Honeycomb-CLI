using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static GH_Toolkit_Core.PS2.HED;
using static GH_Toolkit_Core.PS2.WAD;

namespace PAK_Compiler
{
    public class WadFuncs
    {
        public WadFuncs()
        {

        }

        public static void RunWadExtractor(string mainPath)
        {
            string folderPath = Path.GetDirectoryName(mainPath);
            string extractPath = Path.Combine(folderPath, "WAD Extract");
            string hedPath = Path.Combine(folderPath, "DATAP.HED");
            string wadPath = Path.Combine(folderPath, "DATAP.WAD");
            string pdPath = Path.Combine(folderPath, "DATAPD.HDP");
            string pfPath = Path.Combine(folderPath, "DATAPF.HDP");

            var filesExist = new string[] { hedPath, wadPath, pdPath, pfPath };
            var allExist = filesExist.All(File.Exists);

            if (!allExist)
            {
                foreach (var file in filesExist)
                {
                    if (!File.Exists(file))
                    {
                        Console.WriteLine($"The file {file} does not exist.");
                    }
                }
                return;
            }


            List<HedEntry> HedFiles = ReadHEDFile(File.ReadAllBytes(hedPath));
            ExtractWADFile(HedFiles, File.ReadAllBytes(wadPath), extractPath);
        }

        public static void RunWadCompiler(string mainPath, bool recompilePak)
        {
            CompileWADFile(mainPath, true, recompilePak);
        }
    }
}
