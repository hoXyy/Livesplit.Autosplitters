state("Yakuza6", "Game Pass") 
{
    bool isLoad: 0x027DDB20, 0x1C4;
}

state("Yakuza6", "Steam") 
{
    bool isLoad: 0x025F0FC0, 0x364;
}

init
{
	switch (modules.First().ModuleMemorySize)
	{
		case 62529536:
			version = "Game Pass";
			break;
		case 60653568:
			version = "Steam";
			break;
	}
}

isLoading
{
    return current.isLoad;
} 
