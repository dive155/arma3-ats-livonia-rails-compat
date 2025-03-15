class CfgPatches
{
	class atsfix
	{
		name = "Advanced Train Simulator (ATS) Livonia Rails Compat (Unofficial)";
		author = "Dive";
		fileName="atsfix.pbo";
		
		units[]={};
		weapons[]={};
		requiredVersion=0.1;
		requiredAddons[]=
		{
			"ATS_Core"
		};
	};
};

class CfgFunctions
{
	class atsfix
	{
		class main
		{
			file = "atsfix\functions";
			class addLivoniaTracks
			{
				postInit=1;
			};
			
			class replaceLivoniaBridges
			{
				preInit=1;
			};
		};
	};
};

