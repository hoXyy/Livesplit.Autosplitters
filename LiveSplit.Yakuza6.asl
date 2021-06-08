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
	
		SigScanTarget target = new SigScanTarget("4C 8B 15 ?? ?? ?? ?? 33 C0 45 8B 42 ?? 45 85 C0 74 ?? 44 8B 09");
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
		vars.memoryWatchers.Add(new MemoryWatcher<bool>(new DeepPointer(address, 0xA8, 0x8, 0x18, 0x58, 0x10, 0xB0, 0x964)) { Name = "load"});
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
