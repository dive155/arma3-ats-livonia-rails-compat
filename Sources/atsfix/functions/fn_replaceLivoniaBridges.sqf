if (isServer) then {
	// Function to transform a relative position to world space
	private _toWorldspace = {
		params ["_object", "_relativePos"];
	
		private _objPos = getPosWorld _object;
		private _dir = vectorDir _object;
		private _up = vectorUp _object;
		private _right = _up vectorCrossProduct _dir;  // Compute right vector
	
		// Transform relative position to world space
		private _transformedPos = _objPos vectorAdd 
			((_right vectorMultiply (_relativePos select 0)) vectorAdd
			((_dir vectorMultiply (_relativePos select 1)) vectorAdd
			(_up vectorMultiply (_relativePos select 2))));
	
		_transformedPos
	};
		
	private _allPotentialBridges = nearestTerrainObjects
	[
		[worldSize / 2, worldSize / 2],
		["HOUSE", "BUILDING"],
		worldSize * sqrt 2 / 2,
		false,
		true
	];
	
	private _bridges = _allPotentialBridges select {
		_modelName = (getModelInfo _x) select 0;
		_modelName == "rail_bridge_40_f.p3d" 
			or _modelName == "wc_rails_bridge_40.p3d"
			or _modelName == "rails_bridge_40.p3d"
			or _modelName == "vn_rails_bridge_40_nondest.p3d"
			or _modelName == "vn_rails_bridge_40.p3d"
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
	
	// Format "LookupModel.p3d", [["objectClass", relativePos, vectorDir, vectorUp], [..]]
	private _specialCasesAddObjects = createHashMap;
	_specialCasesAddObjects set [
		"vn_bridge_road_hanoi_06.p3d",
		[
			["ATS_Tracks_A2_Straight_25", [0,12.5,-0.3], [0,1,0], [0,0,1]],
			["ATS_Tracks_A2_Straight_25", [0,-12.5,-0.3], [0,1,0], [0,0,1]]
		]
	];
	_specialCasesAddObjects set [
		"vn_bridge_road_hanoi_07.p3d",
		[
			["ATS_Tracks_A2_Straight_25", [0,-4,-0.3], [0,1,0], [0,0,1]]
		]
	];
	_specialCasesAddObjects set [
		"vn_bridge_road_hanoi_09.p3d",
		[
			["ATS_Tracks_A2_Straight_25", [0,12.5,-0.3], [0,1,0], [0,0,1]],
			["ATS_Tracks_A2_Straight_25", [0,-12.5,-0.3], [0,1,0], [0,0,1]]
		]
	];
	_specialCasesAddObjects set [
		"vn_bridge_road_hanoi_01.p3d",
		[
			["ATS_Tracks_A2_Straight_25", [0,12.5,-0.2], [0,1,0], [0,0,1]],
			["ATS_Tracks_A2_Straight_25", [0,-12.5,-0.2], [0,1,0], [0,0,1]]
		]
	];
	_specialCasesAddObjects set [
		"vn_bridge_road_hanoi_02.p3d",
		[
			["ATS_Tracks_A2_Straight_25", [0,10,-0.3], [0,1,0], [0,0,1]],
			["ATS_Tracks_A2_Straight_25", [0,-10,-0.3], [0,1,0], [0,0,1]]
		]
	];
	
	private _specialCasesModels = keys _specialCasesAddObjects;
	private _specialBridges = _allPotentialBridges select {
		_modelName = (getModelInfo _x) select 0;
		_modelName in _specialCasesModels;
	};
	
	{
		_originalBridge = _x;
		_modelName = (getModelInfo _originalBridge) select 0;
		private _spawns = _specialCasesAddObjects get _modelName;
		
		{
			_className = _x select 0;
			_pos = _x select 1;
			_vectorDir = _x select 2;
			_vectorUp = _x select 3;
			
			_pos = [_originalBridge, _pos] call _toWorldspace;
			_newObject = createVehicle [_className, _pos, [], 0, "CAN_COLLIDE"];
			_newObject setPosWorld _pos;
			
			_vectorDir = _originalBridge vectorModelToWorld _vectorDir;
			_vectorUp = _originalBridge vectorModelToWorld _vectorUp;
			_newObject setVectorDirAndUp [_vectorDir, _vectorUp];
			
		} forEach _spawns;
	} forEach _specialBridges;
	
	// Fuck this piece of rail in particular
	if (worldName == "green_sea") then {
		private _brokenRails = nearestTerrainObjects [[12448.8,14459.9,-0.42901],["RAILWAY"],30,false,true];
		{
			private _modelName = (getModelInfo _x) select 0;
			if (_modelName == "rail_track_le_rb_gsfix_f.p3d") then {
				_x hideObjectGlobal true;
			};
		} forEach _brokenRails;
	};
};