//ATRAIN_Track_Debug_Enabled = true;

ATRAIN_Track_Definitions = missionNamespace getVariable ["ATRAIN_Track_Definitions",[]];

// [Class Name, Center Point Offset, Is Split Track, Is End Track,Memory Point Height Offset]
private _lift = 0.2;
private _liftSlight = 0.8;
private _liftMuch = 1.25;
private _liftMuchissimo = 2;
ATRAIN_Track_Definitions append [ 
	// Livonia/Enoch Tracks
	// [Class Name, Center Point Offset, Is Split Track, Is End Track,Memory Point Height Offset]
	["Land_Rail_Track_TurnOutR_F",-1,true,false,0.15], 
	["Land_Rail_Track_TurnOutL_F",1,true,false,0.15], 
	["Land_Rail_TrackE_TurnOutR_F",-1,true,false,_liftMuch], 
	["Land_Rail_TrackE_TurnOutL_F",1,true,false,_liftMuch], 
	["Land_Rail_Track_Passing_25NOLC_F",0,false,false,_lift], 
	["Land_Rail_Track_Passing_25_F",0,false,false,_lift], 
	["Land_Rail_Track_Passing_10_F",0,false,false,_lift], 
	["Land_Rail_Track_SP_F",0,false,false,_liftSlight], 
	["Land_Rail_Track_LE1_RB_F",-0.3,false,false,_lift], 
	["Land_Rail_Track_LE_RB_F",-0.3,false,false,_lift], 
	["Land_Rail_Track_LB1_RE_F",0.3,false,false,_lift], 
	["Land_Rail_Track_LB_RE_F",0.3,false,false,_lift], 
	["Land_Rail_TrackE_8NOLC_F",0,false,false,_lift], 
	["Land_Rail_TrackE_8_F",0,false,false,_liftSlight], 
	["Land_Rail_TrackE_4_F",0,false,false,_liftSlight], 
	["Land_Rail_Track_Up_40_F",0,false,false,_liftMuch], 
	["Land_Rail_TrackE_40NOLC_F",0,false,false,_liftSlight], 
	["Land_Rail_TrackE_40_F",0,false,false,_liftSlight], 
	["Land_Rail_Track_Down_40_F",0,false,false,_liftMuch], 
	["Land_Rail_TrackE_R30_20_F",0,false,false,1], 
	["Land_Rail_TrackE_2_F",0,false,false,_liftSlight], 
	["Land_Rail_Track_Up_25_F",0,false,false,_liftSlight], 
	["Land_Rail_TrackE_25NOLC_F",0,false,false,1], 
	["Land_Rail_TrackE_R25_5_F",-0.3,false,false,1], 
	["Land_Rail_TrackE_L25_5_F",0.3,false,false,1], 
	["Land_Rail_TrackE_R25_10_F",-0.3,false,false,1], 
	["Land_Rail_TrackE_L25_10_F",0.3,false,false,1], 
	["Land_Rail_TrackE_25_F",0,false,false,1], 
	["Land_Rail_Track_Down_25_F",0,false,false,_liftSlight], 
	["Land_Rail_Track_R25_10_F",-0.3,false,false,_liftSlight], 
	["Land_Rail_Track_L25_10_F",0.3,false,false,_liftSlight], 
	["Land_Rail_Track_25_F",0,false,false,_lift], 
	//["Land_Rail_Bridge_40_F",0,false,false,1],
	["Land_Rail_TrackE_L30_20_F",0,false,false,1]
];
//["Land_Rail_Bridge_40_F",0,false,false,1]

ATRAIN_Object_Model_To_Type_Map = missionNamespace getVariable ["ATRAIN_Object_Model_To_Type_Map",[]];

ATRAIN_Object_Model_To_Type_Map append [
	// Livonia/Enoch Tracks
	["rail_track_turnoutr_f.p3d",["Land_Rail_Track_TurnOutR_F",true]],
	["rail_track_turnoutl_f.p3d",["Land_Rail_Track_TurnOutL_F",true]],
	["rail_tracke_turnoutr_f.p3d",["Land_Rail_TrackE_TurnOutR_F",true]],
	["rail_tracke_turnoutl_f.p3d",["Land_Rail_TrackE_TurnOutL_F",true]],
	["rail_track_passing_25nolc_f.p3d",["Land_Rail_Track_Passing_25NOLC_F",true]],
	["rail_track_passing_25_f.p3d",["Land_Rail_Track_Passing_25_F",true]],
	["rail_track_passing_10_f.p3d",["Land_Rail_Track_Passing_10_F",true]],
	["rail_track_sp_f.p3d",["Land_Rail_Track_SP_F",true]],
	["rail_track_le1_rb_f.p3d",["Land_Rail_Track_LE1_RB_F",true]],
	["rail_track_le_rb_f.p3d",["Land_Rail_Track_LE_RB_F",true]],
	["rail_track_lb1_re_f.p3d",["Land_Rail_Track_LB1_RE_F",true]],
	["rail_track_lb_re_f.p3d",["Land_Rail_Track_LB_RE_F",true]],
	["rail_tracke_8nolc_f.p3d",["Land_Rail_TrackE_8NOLC_F",true]],
	["rail_tracke_8_f.p3d",["Land_Rail_TrackE_8_F",true]],
	["rail_tracke_4_f.p3d",["Land_Rail_TrackE_4_F",true]],
	["rail_track_up_40_f.p3d",["Land_Rail_Track_Up_40_F",true]],
	["rail_tracke_40nolc_f.p3d",["Land_Rail_TrackE_40NOLC_F",true]],
	["rail_tracke_40_f.p3d",["Land_Rail_TrackE_40_F",true]],
	["rail_track_down_40_f.p3d",["Land_Rail_Track_Down_40_F",true]],
	["rail_tracke_r30_20_f.p3d",["Land_Rail_TrackE_R30_20_F",true]],
	["rail_tracke_2_f.p3d",["Land_Rail_TrackE_2_F",true]],
	["rail_track_up_25_f.p3d",["Land_Rail_Track_Up_25_F",true]],
	["rail_tracke_25nolc_f.p3d",["Land_Rail_TrackE_25NOLC_F",true]],
	["rail_tracke_r25_5_f.p3d",["Land_Rail_TrackE_R25_5_F",true]],
	["rail_tracke_l25_5_f.p3d",["Land_Rail_TrackE_L25_5_F",true]],
	["rail_tracke_r25_10_f.p3d",["Land_Rail_TrackE_R25_10_F",true]],
	["rail_tracke_l25_10_f.p3d",["Land_Rail_TrackE_L25_10_F",true]],
	["rail_tracke_25_f.p3d",["Land_Rail_TrackE_25_F",true]],
	["rail_track_down_25_f.p3d",["Land_Rail_Track_Down_25_F",true]],
	["rail_track_r25_10_f.p3d",["Land_Rail_Track_R25_10_F",true]],
	["rail_track_l25_10_f.p3d",["Land_Rail_Track_L25_10_F",true]],
	["rail_track_25_f.p3d",["Land_Rail_Track_25_F",true]],
	//["rail_bridge_40_f.p3d",["Land_Rail_Bridge_40_F",true]],
	["rail_tracke_l30_20_f.p3d",["Land_Rail_TrackE_L30_20_F",true]]
];
//["rail_bridge_40_f.p3d",["Land_Rail_Bridge_40_F",true]]

[] call ATRAIN_fnc_rebuildArrayLookupIndexes;
[] call ATRAIN_fnc_preloadAllTracksNearEditorPlacedConnections;
ATRAIN_Track_Node_Lookup = missionNamespace getVariable ["ATRAIN_Track_Node_Lookup",[]];
ATRAIN_Nodes = missionNamespace getVariable ["ATRAIN_Nodes",[]];
ATRAIN_Map = missionNamespace getVariable ["ATRAIN_Map",[]];