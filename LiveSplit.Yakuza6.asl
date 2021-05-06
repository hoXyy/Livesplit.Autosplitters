state("Yakuza6", "Game Pass - Launch Version") 
{
    bool isLoad: 0x027DDB20, 0x1C4;
}

state("Yakuza6", "Steam - 06.05.2021 Version")
{
    bool isLoad: 0x025F5280, 0x364;
}

state("Yakuza6", "Steam - 12.04.2021/21.04.2021 Version")
{
    bool isLoad: 0x025F5240, 0x1C4;
}

state("Yakuza6", "Steam - Launch Version") 
{
    bool isLoad: 0x025F0FC0, 0x364;
}

init
{
	// Use MD5 for newest version because module memory size is the same
	string MD5Hash;
    using (var md5 = System.Security.Cryptography.MD5.Create())
        using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
        MD5Hash = md5.ComputeHash(s).Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);

	if (MD5Hash == "88A4781428F0A65F15C862A6B4526FB6") {
		version = "Steam - 06.05.2021 Version";
	}
	else {
		switch (modules.First().ModuleMemorySize)
		{
			case 60669952:
				version = "Steam - 12.04.2021/21.04.2021 Version";
				break;
			case 62529536:
				version = "Game Pass - Launch Version";
				break;
			case 60653568:
				version = "Steam - Launch Version";
				break;
		}
	}
}

isLoading
{
    return current.isLoad;
} 
