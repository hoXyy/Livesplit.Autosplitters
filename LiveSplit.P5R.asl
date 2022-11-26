/*
    Credits:
    Kuno for finding the general addresses that were used to create the signature scanners
    Hoxi for creating the signiature scanners and coding the memory watcher

    Commissioned by:
    hamhub7


*/

state("P5R") {}

startup
{
    // vars.Log = (Action<object>)((output) => print("[Process ASL] " + output));

    settings.Add("day_split", false, "Split on day change");
}

init
{
    // Used for getting addresses from pattern scans
	Func<int, string, int> getAddressFromPattern = (patternOffset, patternStr) => {
		var page = modules.First();
		var scanner = new SignatureScanner(game, page.BaseAddress, page.ModuleMemorySize);
		IntPtr offsetPtr = scanner.Scan(new SigScanTarget(patternOffset, patternStr));
		return (int) (offsetPtr.ToInt64() - page.BaseAddress.ToInt64() + game.ReadValue<int>(offsetPtr) + 0x4);
	};

    vars.Watchers = new MemoryWatcherList();

    // Only Steam version has that module, so use that to find which version is running
    if (Array.Exists(modules, module => module.ToString() == "steam_api64.dll")) {
        // Find addresses from signatures
        int curDayAddress = getAddressFromPattern(4, "44 0F BF 25 ?? ?? ?? ?? 4C 8D 2D ?? ?? ?? ??");
        int curCutsceneAddress = getAddressFromPattern(3, "48 8D 05 ?? ?? ?? ?? 48 8D 0D ?? ?? ?? ?? 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 48 83 3D ?? ?? ?? ?? 00 74 ?? 48 8B 0D ?? ?? ?? ?? E8 ?? ?? ?? ?? 48 C7 05 ?? ?? ?? ?? 00 00 00 00 48 83 3D ?? ?? ?? ?? 00");
        int curLoadAddress = getAddressFromPattern(3, "4C 8B 15 ?? ?? ?? ?? 4D 85 D2 74 ?? 48 8B 05 ?? ?? ?? ??");
        int curControlAddress = getAddressFromPattern(3, "0F B6 05 ?? ?? ?? ?? F3 0F 10 0D ?? ?? ?? ??");

        // Add memory watchers
        vars.Watchers.Add(new MemoryWatcher<short>(new DeepPointer(curDayAddress)) { Name = "curDay" });
        vars.Watchers.Add(new StringWatcher(new DeepPointer(curCutsceneAddress, 0x50, 0x7C8, 0x8E4), 100) { Name = "curCutscene" });
        vars.Watchers.Add(new MemoryWatcher<short>(new DeepPointer(curLoadAddress)) { Name = "curLoad" });
        vars.Watchers.Add(new MemoryWatcher<bool>(new DeepPointer(curControlAddress)) { Name = "curControl" });
    } else {
        // Find addresses from signatures 
        int curDayAddress = getAddressFromPattern(3, "48 8D 05 ?? ?? ?? ?? 48 8D 3D ?? ?? ?? ?? 49 8B D8 48 0F 43 F8");
        int curCutsceneAddress = getAddressFromPattern(3, "48 89 1D ?? ?? ?? ?? 89 73 ??"); 
        int curLoadAddress = getAddressFromPattern(3, "48 89 3D ?? ?? ?? ?? 49 8B E3");
        int curControlAddress = getAddressFromPattern(3, "44 38 35 ?? ?? ?? ?? 41 BF 02 00 00 00");

        // Add memory watchers
        vars.Watchers.Add(new MemoryWatcher<short>(new DeepPointer(curDayAddress)) { Name = "curDay" });
        vars.Watchers.Add(new StringWatcher(new DeepPointer(curCutsceneAddress, 0x8), 100) { Name = "curCutscene" });
        vars.Watchers.Add(new MemoryWatcher<short>(new DeepPointer(curLoadAddress)) { Name = "curLoad" });
        vars.Watchers.Add(new MemoryWatcher<bool>(new DeepPointer(curControlAddress)) { Name = "curControl" }); 
    }

    vars.doneMaps = new List<string>(); 
}

update
{
    vars.Watchers.UpdateAll(game);

    //print("day: " + vars.Watchers["curDay"].Current.ToString());
    //print("cutscene: " + vars.Watchers["curCutscene"].Current);
    //print("load: " + vars.Watchers["curLoad"].Current);
    //print("control: " + vars.Watchers["curControl"].Current); 
}

split
{
    if (settings["day_split"]) {
        if ((!vars.doneMaps.Contains(vars.Watchers["curDay"].Current.ToString())) && (vars.Watchers["curDay"].Current != vars.Watchers["curDay"].Old))
        {
            vars.doneMaps.Add(vars.Watchers["curDay"].Current.ToString());
            return true;
        }
    }

}

isLoading
{
    return ((vars.Watchers["curLoad"].Current != 0) && 
            (!vars.Watchers["curControl"].Current));
}

onReset
{
    vars.doneMaps.Clear();
}