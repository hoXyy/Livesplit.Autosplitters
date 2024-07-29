state("SMT5V-Win64-Shipping")
{
    int saveLoad: 0x40C8440;
}

init
{
    // Scanning the MainModule for static pointers to GSyncLoadCount, UWorld, UEngine and FNamePool
    var scn = new SignatureScanner(game, game.MainModule.BaseAddress, game.MainModule.ModuleMemorySize);
    var syncLoadTrg = new SigScanTarget(5, "89 43 60 8B 05") { OnFound = (p, s, ptr) => ptr + 0x4 + game.ReadValue<int>(ptr) };
    var syncLoadCounterPtr = scn.Scan(syncLoadTrg);

    // Throwing in case any base pointers can't be found (yet, hopefully)
    if(syncLoadCounterPtr == IntPtr.Zero)
    {
        throw new Exception("One or more base pointers not found - retrying");
    }

    //print(syncLoadCounterPtr.ToString("X"));

	vars.Watchers = new MemoryWatcherList
    {
        // GSyncLoadCount
        new MemoryWatcher<int>(new DeepPointer(syncLoadCounterPtr)) { Name = "syncLoadCount" },
    };
}

update
{
    vars.Watchers.UpdateAll(game);
    current.loading = vars.Watchers["syncLoadCount"].Current > 0;
    //print("Loading: " + vars.Watchers["syncLoadCount"].Current.ToString());
    //print("saveLoad: " + current.saveLoad.ToString());
}

isLoading
{
    return current.saveLoad == 3 || current.loading;
}