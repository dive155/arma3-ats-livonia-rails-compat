if (isServer) then {
	private _allPotentialBridges = nearestTerrainObjects
	[
		[worldSize / 2, worldSize / 2],
		["HOUSE"],
		worldSize * sqrt 2 / 2,
		false,
		true
	];
	
	private _bridges = _allPotentialBridges select {
		_modelName = (getModelInfo _x) select 0;
		_modelName == "rail_bridge_40_f.p3d" 
			or _modelName == "wc_rails_bridge_40.p3d"
			or _modelName == "rails_bridge_40.p3d"
	};

	{
		_bridge = _x;
		_pos = getPosWorld _bridge;
		_dir = vectorDir _bridge;
		_up = vectorUp _bridge;
		_bridge hideObjectGlobal true;

		_newBridge = createVehicle ["ATS_Tracks_A2_Bridge", _pos, [], 0, "CAN_COLLIDE"];
		_newBridge setPosWorld _pos;
		_newBridge setVectorDirAndUp [_dir, _up];
	} forEach _bridges;
};