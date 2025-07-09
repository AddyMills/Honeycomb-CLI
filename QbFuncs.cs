using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using static GH_Toolkit_Core.Methods.Exceptions;
using static GH_Toolkit_Core.QB.QB;

namespace PAK_Compiler
{
    public class QbFuncs
    {
        public QbFuncs(string[] args)
        {

        }

        public static void RunQbCompiler(string entry, string? game, string platform = "360")
        {


            if (File.Exists(entry))
            {
                entry = entry.ToLower();
                var qbName = Path.GetFileName(entry);
                var qbNoExt = Path.GetFileNameWithoutExtension(qbName);
                var fileExt = Path.GetExtension(qbName);
                if (fileExt == ".xen")
                {
                    platform = "360";
                }
                while (fileExt != ".qb" && fileExt != ".q")
                {
                    fileExt = Path.GetExtension(qbNoExt);
                    qbNoExt = Path.GetFileNameWithoutExtension(qbNoExt);
                    if (fileExt == string.Empty)
                    {
                        Console.WriteLine("File is not a .qb or .q file");
                        return;
                    }
                }
                if (fileExt == ".q")
                {
                    var (qBItems, _) = ParseQFile(entry);
                    var fileData = CompileQbFile(qBItems, qbName, game: game, console: platform!);
                    var output = Path.ChangeExtension(entry, ".qb");
                    File.WriteAllBytes(output, fileData);
                }
                else if (fileExt == ".qb")
                {
                    string endian = platform == "PS2" ? "little" : "big";
                    var fileData = DecompileQbFromFile(entry, endian, "", game: game, console: platform!);
                    var output = Path.ChangeExtension(entry, ".q");
                    QbToText(fileData, output);
                }

                else
                {
                    Console.WriteLine("The file specified does not exist.");
                }
            }
            else
            {
                Console.WriteLine("The file soecified does not exist.");
            }
        }

    }
}
