state("Yakuza6", "Game Pass - Launch Version") 
{
    bool isLoad: 0x027DDB20, 0x1C4;
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

isLoading
{
    return current.isLoad;
} 
