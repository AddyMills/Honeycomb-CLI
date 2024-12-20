using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.CommandLine;
using System.CommandLine.Invocation;
using GH_Toolkit_Core.INI;
using GH_Toolkit_Core.MIDI;
using static GH_Toolkit_Core.Methods.CreateForGame;

namespace PAK_Compiler
{
    internal class MakeSong
    {
        private string? Game;
        private string? Platform;
        private string? Folder;
        private SongData SongData = new SongData();
        private GhMetadata ghMetadata = new GhMetadata();
        public MakeSong(string folder, string game, string platform)
        {
            Game = game;
            Platform = platform;
            Folder = folder;
            if (Game == null || Platform == null || Folder == null)
            {
                Console.WriteLine("Missing required arguments: ");
                ShowHelpMenu();
            }
            else
            {
                ProcessSong();
            }
        }
        private void ProcessSong() 
        {
            GetDataFromFolder();
            var songInfo = SongData.GetSongInfo();
            var metadata = new GhMetadata(songInfo);

        }
        private void GetDataFromFolder()
        {
            SongData.SetFilePathInfo(iniParser.AssignFiles(Folder, Game));
            // Get the data from the folder
            string iniCheck = Path.Combine(Folder, "song.ini");
            if (File.Exists(iniCheck))
            {
                var ini = iniParser.ReadIniFromPath(iniCheck);
                string songSection = null;

                // Check for the section in a case-insensitive manner
                foreach (var section in ini.Sections)
                {
                    if (string.Equals(section.SectionName, "song", StringComparison.OrdinalIgnoreCase))
                    {
                        songSection = section.SectionName; // This retains the original casing ("song" or "Song")
                        break;
                    }
                }

                // Proceed only if a matching section was found
                if (songSection != null)
                {
                    SongData.SetSongInfo(iniParser.ParseSongIni(ini, songSection));
                }
            }

        }
        private void CheckValidSongData()
        {

        }
        public void ShowHelpMenu()
        {
            Console.WriteLine("Usage: makesong <folder> -g <game> -c <console>");
            Console.WriteLine("  -g <game> - The game the song is for.");
            Console.WriteLine("  -c <console> - The console to compile for.");
            Console.WriteLine("Available games options:");
            Console.WriteLine("GH3, GHA, GHWT, GHM, GHSH, GHGH, GHVH, GH5, WOR, GHWOR");
            Console.WriteLine("Available console options:");
            Console.WriteLine("360, PC, PS2, PS3, WII");
        }
    }
}
