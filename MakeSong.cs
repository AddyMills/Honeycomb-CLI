using GH_Toolkit_Core.Audio;
using GH_Toolkit_Core.INI;
using GH_Toolkit_Core.MIDI;
using GH_Toolkit_Core.PAK;
using System;
using System.Collections.Generic;
using System.CommandLine;
using System.CommandLine.Invocation;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static GH_Toolkit_Core.Methods.CreateForGame;
using static GH_Toolkit_Core.QB.QBConstants;

namespace PAK_Compiler
{
    internal class MakeSong
    {
        private string? Game;
        private string? Platform;
        private string? Folder;
        private bool Gh3Plus;
        private SongData SongData = new SongData();
        private GhMetadata ghMetadata = new GhMetadata();
        public MakeSong(string folder, string game, string platform)
        {

            game = game.ToUpper();
            switch (game)
            {
                case GAME_GH3:
                case GAME_GHA:
                case GAME_GHWT:
                case GAME_GHM:
                case GAME_GHSH:
                case GAME_GHGH:
                case GAME_GHVH:
                case GAME_GH5:
                    break;
                case STRING_WOR:
                case GAME_GHWOR_UPPER:
                    game = GAME_GHWOR;
                    break;
                case GAME_GH3PLUS:
                    game = GAME_GH3;
                    Gh3Plus = platform == CONSOLE_PC;
                    break;
                default:
                    Console.WriteLine("Invalid game option.");
                    Game = null;
                    return;
            }
            Game = game;
            Platform = platform;
            Folder = folder;
        }
        public async Task ProcessSong() 
        {
            if (Game == null || Platform == null || Folder == null)
            {
                Console.WriteLine("Missing required arguments: ");
                ShowHelpMenu();
                return;
            }
            GetDataFromFolder();
            await CreateSongPackage();
        }
        private async Task CreateSongPackage()
        {
            var songInfo = SongData.GetSongInfo();
            string[] dlcName = { Game!, songInfo.Artist, songInfo.Title, songInfo.Year.ToString(), songInfo.Charter, songInfo.IsCover.ToString() };
            var dlcNum = MakeConsoleChecksum(dlcName);
            if (Platform! != CONSOLE_PC)
            {
                songInfo.Checksum = $"dlc{dlcNum}";
            }
            var metadata = new GhMetadata(songInfo);
            var fileInfo = SongData.GetFilePathInfo();
            if (!(fileInfo.DoesMidiExist))
            {
                if (!fileInfo.DoesChartExist)
                {
                    Console.WriteLine("No MIDI or Chart note file found in folder.");
                    return;
                }
                fileInfo.SetMidiFile(fileInfo.GetChartFile());
            }
            var skaPath = fileInfo.DoesSkaExist ? fileInfo.SkaFiles : string.Empty;
            var perfPath = fileInfo.DoesPerfExist ? fileInfo.PerfOverride : string.Empty;
            var scriptPath = fileInfo.DoesSongScriptsExist ? fileInfo.SongScripts : string.Empty;
            AudioCompiler audio;
            var previewLength = songInfo.PreviewEndTime - songInfo.PreviewStartTime;
            if (previewLength <= 0)
            {
                previewLength = 30000;
            }
            var bassExists = Path.Exists(fileInfo.Bass);
            var bassPath = bassExists ? fileInfo.Bass : fileInfo.Rhythm;
            if (Game == GAME_GH3 || Game == GAME_GHA)
            {
                audio = AudioCompiler.CreateGh3Compiler(
                    metadata.Checksum,
                    Folder,
                    "Compile",
                    Game,
                    songInfo.PreviewStartTime,
                    previewLength,
                    -7.0m,
                    1.0m,
                    1.0m,
                    fileInfo.DoesPreviewExist, // Custom Preview
                    false, // Coop Audio - Change this? Not sure if CH folders support co-op audio
                    fileInfo.Guitar,
                    bassPath,
                    fileInfo.BackingTracks.ToArray(),
                    fileInfo.Crowd,
                    fileInfo.Preview,
                    "",
                    "",
                    [""]
                    );
                if (Platform == CONSOLE_PS2)
                {
                    await audio.GH3AudioCompilePs2();
                }
                else
                {
                    await audio.GH3AudioCompile();
                }
            }
            else
            {
                if (Platform == CONSOLE_PS2)
                {
                    throw new NotSupportedException("PS2 not supported for band games.");
                }
                var encrypt = !(Game == GAME_GHWT && Platform == CONSOLE_PC);
                audio = AudioCompiler.CreateGhwtCompiler(
                metadata.Checksum,
                Folder,
                "Compile",
                Game,
                songInfo.PreviewStartTime,
                previewLength,
                -7.0m,
                1.0m,
                1.0m,
                fileInfo.DoesPreviewExist, // Custom Preview
                fileInfo.Guitar,
                bassPath,
                fileInfo.Vocals,
                fileInfo.KickDrum,
                fileInfo.SnareDrum,
                fileInfo.Cymbals,
                fileInfo.Toms,
                fileInfo.BackingTracks.ToArray(),
                fileInfo.Crowd,
                fileInfo.Preview
                );
                await audio.GHWTAudioCompile(encrypt);
            }

            var compiler = new SongPakCompiler(
                midiPath: fileInfo.MidiFile,
                savePath: Folder,
                songName: metadata.Checksum,
                game: Game,
                gameConsole: Platform
            )
            {
                SkaPath = skaPath,
                PerfOverride = perfPath,
                SongScripts = scriptPath,
                SkaSource = songInfo.SkaSource,
                VenueSource = songInfo.VenueSource,
                HopoThreshold = metadata.HmxHopoThreshold,
                Gh3Plus = Gh3Plus
            };

            compiler.Build();

            var (pakFile, doubleKick, pakExpertPlus) = compiler.GetResults();

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
            Console.WriteLine("GH3, GH3+, GHA, GHWT, GHM, GHSH, GHGH, GHVH, GH5, WOR, GHWOR");
            Console.WriteLine("Available console options:");
            Console.WriteLine("360, PC, PS2, PS3, WII");
        }
    }
}
