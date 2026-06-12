-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{ minlevel = 1,     maxlevel = 8,     multiplier = 20000 },
	{ minlevel = 9,     maxlevel = 200,   multiplier = 18000 },
	{ minlevel = 201,   maxlevel = 500,   multiplier = 16000 },
	{ minlevel = 501,   maxlevel = 1000,  multiplier = 14000 },
	{ minlevel = 1001,  maxlevel = 1500,  multiplier = 10000 },
	{ minlevel = 1501,  maxlevel = 2500,  multiplier = 6000  },
	{ minlevel = 2501,  maxlevel = 3000,  multiplier = 2000  },
	{ minlevel = 3001,  maxlevel = 4000,  multiplier = 1800  },
	{ minlevel = 4001,  maxlevel = 4100,  multiplier = 1400  },
	{ minlevel = 4101,  maxlevel = 4300,  multiplier = 1000  },
	{ minlevel = 4301,  maxlevel = 4500,  multiplier = 400   },
	{ minlevel = 4501,  maxlevel = 4800,  multiplier = 200   },
	{ minlevel = 4801,  maxlevel = 5000,  multiplier = 100   },
	{ minlevel = 5001,  maxlevel = 6000,  multiplier = 50    },
	{ minlevel = 6001,  maxlevel = 7000,  multiplier = 20    },
	{ minlevel = 7001,  maxlevel = 8000,  multiplier = 10    },
	{ minlevel = 8001,  maxlevel = 9000,  multiplier = 4     },
	{ minlevel = 9001,  maxlevel = 10000, multiplier = 2     },
	{ minlevel = 10001,                   multiplier = 1     },
}

skillsStages = {
	{ minlevel = 10,  maxlevel = 50,  multiplier = 130 },
	{ minlevel = 51,  maxlevel = 70,  multiplier = 100 },
	{ minlevel = 71,  maxlevel = 80,  multiplier = 80  },
	{ minlevel = 81,  maxlevel = 100, multiplier = 60  },
	{ minlevel = 101, maxlevel = 110, multiplier = 40  },
	{ minlevel = 111,                 multiplier = 20  },
}

magicLevelStages = {
	{ minlevel = 0,   maxlevel = 50,  multiplier = 130 },
	{ minlevel = 51,  maxlevel = 70,  multiplier = 100 },
	{ minlevel = 71,  maxlevel = 80,  multiplier = 80  },
	{ minlevel = 81,  maxlevel = 100, multiplier = 60  },
	{ minlevel = 101, maxlevel = 110, multiplier = 40  },
	{ minlevel = 111,                 multiplier = 20  },
}
