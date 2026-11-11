using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static GH_Toolkit_Core.MIDI.SongQbFile;
using static GH_Toolkit_Core.PAK.PAK;

namespace PAK_Compiler
{
    public class MidiFuncs
    {
        public MidiFuncs()
        {

        }
        public static void ConvertPakToMidi(string pakPath)
        {
            var pakFile = TokenizePak(pakPath);
            var pakFolder = Path.GetDirectoryName(pakPath);
            var midiName = Path.GetFileNameWithoutExtension(pakPath) + ".mid";
            var midiFile = pakFile.MakeMidiFile();
            midiFile.Write(Path.Combine(pakFolder, midiName), true);
        }
    }
}
