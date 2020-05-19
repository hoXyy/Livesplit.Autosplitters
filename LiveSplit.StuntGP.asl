// Stunt GP autosplitter, made per request
// Supports original International version and Polish version
// Bugs anyone is free to figure out: timer starts when moving around menus because of values changing during fades

state("StuntGP_D3D", "International - DirectX")
{
    int menuState: 0x1DABB0;
    bool raceFinish: 0xC1A8C;
    float timer: 0xBA240;
}

state("StuntGP_Glide", "International - Glide")
{
    int menuState: 0x194EC8;
    bool raceFinish: 0x96AF0;
    float timer: 0xB1190;
}

state("StuntGP_D3D", "Polish - DirectX")
{
    int menuState: 0x1DA194;
    bool raceFinish: 0xA31AC;
    float timer: 0xAA7C8;
}

state("StuntGP_Glide", "Polish - Glide")
{
    int menuState: 0x1944BC;
    bool raceFinish: 0xB06B8;
    float timer: 0xB0590;
}

init
{
	byte[] exeMD5HashBytes = new byte[0];
	using (var md5 = System.Security.Cryptography.MD5.Create())
	{
		using (var s = File.Open(modules.First().FileName, FileMode.Open, FileAccess.Read, FileShare.ReadWrite))
		{
			exeMD5HashBytes = md5.ComputeHash(s); 
		} 
	}
	var MD5Hash = exeMD5HashBytes.Select(x => x.ToString("X2")).Aggregate((a, b) => a + b);
	print("MD5Hash: " + MD5Hash.ToString());

    switch(MD5Hash) {
        case "E4BAF3E5CACD51AFCE61007F72781167":
            version = "International - DirectX";
            break;
        case "C5801F89E46C53A67AC8D7C18A94ACD8":
            version = "International - Glide";
            break;
        case "CE9A034310D45EED6D6E2C1B6014376E":
            version = "Polish - DirectX";
            break;
        case "7D7EB6DFB099CF06FEF28F436CAE6E52":
            version = "Polish - Glide";
            break;   
        default:
            version = "Unknown";
            break;
    }

    print(version);

    vars.menuStates = new List<int>();
    vars.menuStates.Add(1117257728);
    vars.menuStates.Add(1113587712);
    vars.menuStates.Add(1);
}

start
{
    return current.menuState != old.menuState && vars.menuStates.Contains(current.menuState); 
}

split
{
    return current.raceFinish && !old.raceFinish && current.timer > 0;
}