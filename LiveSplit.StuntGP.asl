// Stunt GP autosplitter, made per request
// Supports original International version and Polish version

state("StuntGP_D3D", "International - DirectX")
{
    int menuState: 0x1FF320;
    bool raceFinish: 0xC1A8C;
    float timer: 0xBA240;
}

state("StuntGP_Glide", "International - Glide")
{
    int menuState: 0x1B9638;
    bool raceFinish: 0x96AF0;
    float timer: 0xB1190;
}

state("StuntGP_D3D", "Polish - DirectX")
{
    int menuState: 0x1FE900;
    bool raceFinish: 0xA31AC;
    float timer: 0xAA7C8;
}

state("StuntGP_Glide", "Polish - Glide")
{
    int menuState: 0x1B8C28;
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

}

start
{
    // start after single player menu, don't start by going back to main menu
    return current.menuState != old.menuState && old.menuState == 692 && current.menuState != 468 ;
}

split
{
    // split on finish line
    return current.raceFinish && !old.raceFinish && current.timer > 0;
}

reset
{
    // reset when entering single player menu
    return  current.menuState != old.menuState && current.menuState == 692;
}