// Yakuza 6 Load Remover by hoxi, contributions by Vojtas131
// with help from rythin_songrequest
state("Yakuza6") {}

init {

	vars.memoryWatchers = new MemoryWatcherList();
	vars.threadScan = new Thread(() => {
		Func<IntPtr, int, int, IntPtr> PtrFromOpcode = (ptr, targetOperandOffset, totalSize) => {
			byte[] bytes = game.ReadBytes(ptr + targetOperandOffset, 4);
			if (bytes == null) return IntPtr.Zero;

			Array.Reverse(bytes);
			int offset = Convert.ToInt32(BitConverter.ToString(bytes).Replace("-", ""), 16);
			IntPtr actualPtr = IntPtr.Add((ptr + totalSize), offset);
			return actualPtr;
		};
	
		SigScanTarget target = new SigScanTarget("48 8B 0D ?? ?? ?? ?? 48 85 C9 74 ?? 66 0F 1F 84 ?? 00 00 00 00 48 8B 59 ??");
		target.OnFound = (proc, s, ptr) => PtrFromOpcode(ptr, 3, 7); 
		SignatureScanner scanner = new SignatureScanner(game, modules.First().BaseAddress, modules.First().ModuleMemorySize);
		IntPtr address = IntPtr.Zero;
		Thread.Sleep(2000); // wait till game actually starts up 
		int sigAttempt = 0; 
		while (sigAttempt++ <= 100) {
			if ((address = scanner.Scan(target)) != IntPtr.Zero) break;
			Thread.Sleep(2000);
			print("Current iteration: " + sigAttempt);  
		}

		print("Address: " + address.ToString());
		vars.memoryWatchers.Add(new MemoryWatcher<bool>(new DeepPointer(address, 0x28, 0x8, 0x364)) { Name = "load"});
	});
	vars.threadScan.Start(); 
}

update {
    vars.memoryWatchers.UpdateAll(game);
}

isLoading
{
	return vars.memoryWatchers["load"].Current; 
}
