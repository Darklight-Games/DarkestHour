//==============================================================================
// Darkest Hour: Europe '44-'45
// Copyright (c) Darklight Games.  All rights reserved.
//==============================================================================
// TODO
// Make new 100mm shell class and assign to SU-100 cannon
// Make new sight reticle
// Add more skins
// Add destroyed skins
// Add destroyed mesh
// Add interior mesh
// Add interior textures
// Add GUI pictures
// Add hatch sounds

class DH_SU100Tank extends DHArmoredVehicle;

defaultproperties
{
    // Vehicle properties
    VehicleNameString="SU-100"
    VehicleTeam=1
    ReinforcementCost=6

    // Vehicle weapons
    PassengerWeapons(0)=(WeaponPawnClass=Class'DH_SU100CannonPawn',WeaponBone="TURRET_PLACEMENT")
    
    // Hull mesh
    Mesh=SkeletalMesh'DH_SU100_anm.SU100_BODY_EXT'
    Skins(0)=Texture'DH_SU100_tex.SU100_EXT'
    Skins(1)=Texture'DH_T34_tex.T34_TRACK'
    Skins(2)=Texture'DH_T34_tex.T34_TRACK'
    // Skins(3)=Texture'allies_vehicles_tex.T3476_int'
    DestroyedVehicleMesh=StaticMesh'allies_vehicles_stc.T3476_Destroyed'
    // DestroyedMeshSkins(0)=Combiner'DH_VehiclesSOV_tex.T3476_ext_dest'
    // DestroyedMeshSkins(1)=Combiner'DH_VehiclesSOV_tex.T3476_treads_dest'

    // Destroyed Treads
    DamagedTrackStaticMeshLeft=StaticMesh'DH_T34_stc.T34_TRACK_DAMAGED_L'
    DamagedTrackStaticMeshRight=StaticMesh'DH_T34_stc.T34_TRACK_DAMAGED_R'
 
    // Periscope
    PeriscopePositionIndex=0
    PeriscopeCameraBone="DRIVER_PERISCOPE"

    // Driver
    InitialPositionIndex=0
    UnbuttonedPositionIndex=1
    DriverPositions(0)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_SU100_anm.SU100_BODY_EXT',TransitionUpAnim="driver_hatch_open",DriverTransitionAnim="SU_DRIVER_HATCH_CLOSE",ViewPitchUpLimit=0,ViewPitchDownLimit=65535,ViewPositiveYawLimit=0,ViewNegativeYawLimit=0,bDrawOverlays=true)
    DriverPositions(1)=(ViewFOV=85.0,PositionMesh=SkeletalMesh'DH_SU100_anm.SU100_BODY_EXT',TransitionDownAnim="driver_hatch_close",DriverTransitionAnim="SU_DRIVER_HATCH_OPEN",ViewPitchUpLimit=5500,ViewPitchDownLimit=63500,ViewPositiveYawLimit=11000,ViewNegativeYawLimit=-12500,bExposed=true)
    DrivePos=(X=98,Y=-36,Z=62)
    DriveRot=(Yaw=16384)
    DriveAnim="SU_DRIVER_CLOSE_IDLE"
    DriverAttachmentBone="BODY"
    bLockCameraDuringTransition=true

    // Collision Attachments
    CollisionAttachments(0)=(StaticMesh=StaticMesh'DH_T34_stc.T34_DRIVER_HATCH_COLLISION',AttachBone="driver_hatch")

    // Attachments
    // RandomAttachmentGroups(0)=(Options=((Probability=0.6,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_76_stc.T3476_FUEL_TANKS',SkinIndexMap=((VehicleSkinIndex=0,AttachmentSkinIndex=0))))))
    // RandomAttachmentGroups(1)=(Options=((Probability=0.9,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_TOWING_CABLES',Offset=(Z=52.3)))))
    // RandomAttachmentGroups(2)=(Options=((Probability=0.8,Attachment=(AttachBone="body",StaticMesh=StaticMesh'DH_T34_stc.T34_TARP',Offset=(X=5,Y=68.5,Z=79.6),Rotation=(Pitch=7826,Yaw=-16380)))))

    //Interface 
    VehicleHudImage=Texture'DH_InterfaceArt_tex.t34_body'
    VehicleHudTurret=TexRotator'DH_InterfaceArt_tex.t34_76_turret_rot'
    VehicleHudTurretLook=TexRotator'DH_InterfaceArt_tex.t34_76_turret_look'
    SpawnOverlay(0)=Material'DH_InterfaceArt_tex.T34_76'

    // Riders
    PassengerPawns(0)=(AttachBone="Body",DrivePos=(X=-59.0,Y=-50.0,Z=53.0),DriveRot=(Yaw=-16384),DriveAnim="VHalftrack_Rider1_idle")
    PassengerPawns(1)=(AttachBone="body",DrivePos=(X=-100.0,Y=-25.0,Z=105.5),DriveAnim="crouch_idle_binoc") // kneeling, as can't sit in usual position due to fuel drum
    PassengerPawns(2)=(AttachBone="Body",DrivePos=(X=-135.0,Y=35.0,Z=51.0),DriveRot=(Yaw=-32768),DriveAnim="VHalftrack_Rider5_idle")
    PassengerPawns(3)=(AttachBone="Body",DrivePos=(X=-59.0,Y=50.0,Z=54.0),DriveRot=(Yaw=16384),DriveAnim="VHalftrack_Rider6_idle")

    // Hull armor
    FrontArmor(1)=(Thickness=7.5,Slope=50.0,MaxRelativeHeight=90.7,LocationName="upper")
    FrontArmor(0)=(Thickness=4.5,Slope=-55.0,MaxRelativeHeight=47.3,LocationName="lower")

    RightArmor(1)=(Thickness=4.5,Slope=40.0,LocationName="upper")
    RightArmor(0)=(Thickness=4.5,MaxRelativeHeight=66.5,LocationName="lower")

    LeftArmor(1)=(Thickness=4.5,Slope=40.0,LocationName="upper")
    LeftArmor(0)=(Thickness=4.5,MaxRelativeHeight=66.5,LocationName="lower")

    RearArmor(1)=(Thickness=4.5,Slope=48.0,MaxRelativeHeight=100.1,LocationName="upper")
    RearArmor(0)=(Thickness=4.5,Slope=-45.0,MaxRelativeHeight=52.9,LocationName="lower")

    FrontLeftAngle=330.0
    FrontRightAngle=30.0
    RearRightAngle=155.0
    RearLeftAngle=205.0

    // Movement
    GearRatios(3)=0.65
    GearRatios(4)=0.75
    TransRatio=0.13
    EngineRestartFailChance=0.1 // mid-late war variant with better engine production quality

    // Damage
    Health=525
    HealthMax=525
    EngineHealth=300

    PlayerFireDamagePer2Secs=12.0 // reduced from 15 for all diesels
    FireDetonationChance=0.045  //reduced from 0.07 for all diesels
    DisintegrationHealth=-1200.0 //diesel
    AmmoIgnitionProbability=0.8 // 0.75 default
    VehHitpoints(0)=(PointRadius=40.0,PointOffset=(X=-90.0,Y=0.0,Z=0.0)) // engine
    VehHitpoints(1)=(PointRadius=25.0,PointBone="Body",PointOffset=(X=13.0,Y=-25.0,Z=-5.0),DamageMultiplier=5.0,HitPointType=HP_AmmoStore)
    VehHitpoints(2)=(PointRadius=25.0,PointBone="Body",PointOffset=(X=13.0,Y=25.0,Z=-5.0),DamageMultiplier=5.0,HitPointType=HP_AmmoStore)
    TreadHitMaxHeight=5.0
    DamagedEffectScale=0.9
    DamagedEffectOffset=(X=-105.0,Y=0.0,Z=40.0) // adjusted from original
    FireAttachBone="Body"
    FireEffectOffset=(X=127.0,Y=-18.0,Z=25.0)

    // Exit positions
    ExitPositions(0)=(X=215.0,Y=-14.0,Z=50.0)  // driver
    ExitPositions(1)=(X=25.0,Y=-5.0,Z=200.0)   // commander
    ExitPositions(2)=(X=215.0,Y=41.0,Z=50.0)   // hull MG
    ExitPositions(3)=(X=-43.0,Y=-125.0,Z=75.0) // riders
    ExitPositions(4)=(X=-220.0,Y=-35.0,Z=75.0)
    ExitPositions(5)=(X=-220.0,Y=37.0,Z=75.0)
    ExitPositions(6)=(X=-43.0,Y=125.0,Z=75.0)

    // Sounds
    SoundPitch=32 // half normal pitch = 1 octave lower
    MaxPitchSpeed=50.0
    IdleSound=SoundGroup'Vehicle_Engines.t34_engine_loop'
    StartUpSound=Sound'Vehicle_Engines.t34_engine_start'
    ShutDownSound=Sound'Vehicle_Engines.t34_engine_stop'
    LeftTreadSound=Sound'Vehicle_Engines.track_squeak_L07'
    RightTreadSound=Sound'Vehicle_Engines.track_squeak_L07'
    RumbleSound=Sound'Vehicle_Engines.tank_inside_rumble02'

    // Visual effects
    TreadVelocityScale=175.0
    WheelRotationScale=50000.0
    ExhaustEffectClass=Class'ExhaustDieselEffect'
    ExhaustEffectLowClass=Class'ExhaustDieselEffect_simple'
    ExhaustPipes(0)=(ExhaustPosition=(X=-175,Y=30,Z=64),ExhaustRotation=(Pitch=36000,Yaw=0,Roll=0))
    ExhaustPipes(1)=(ExhaustPosition=(X=-175,Y=-30,Z=64),ExhaustRotation=(Pitch=36000,Yaw=0,Roll=0))
    ShadowZOffset=20.0

    // HUD
    VehicleHudTreadsPosX(0)=0.36 // some positions adjusted from original
    VehicleHudTreadsScale=0.73
    VehicleHudOccupantsX(0)=0.465
    VehicleHudOccupantsY(0)=0.27
    VehicleHudOccupantsX(2)=0.565
    VehicleHudOccupantsY(1)=0.47
    VehicleHudOccupantsX(3)=0.42
    VehicleHudOccupantsY(3)=0.62
    VehicleHudOccupantsX(4)=0.45
    VehicleHudOccupantsY(4)=0.72
    VehicleHudOccupantsX(5)=0.57
    VehicleHudOccupantsY(5)=0.73
    VehicleHudOccupantsX(6)=0.58
    VehicleHudOccupantsY(6)=0.62

    // Visible wheels
    LeftWheelBones(0)="Wheel_L_1"
    LeftWheelBones(1)="Wheel_L_2"
    LeftWheelBones(2)="Wheel_L_3"
    LeftWheelBones(3)="Wheel_L_4"
    LeftWheelBones(4)="Wheel_L_5"
    LeftWheelBones(5)="Wheel_L_6"
    LeftWheelBones(6)="Wheel_L_7"
    RightWheelBones(0)="Wheel_R_1"
    RightWheelBones(1)="Wheel_R_2"
    RightWheelBones(2)="Wheel_R_3"
    RightWheelBones(3)="Wheel_R_4"
    RightWheelBones(4)="Wheel_R_5"
    RightWheelBones(5)="Wheel_R_6"
    RightWheelBones(6)="Wheel_R_7"

    // Physics wheels
    Begin Object Class=SVehicleWheel Name=LF_Steering
         bPoweredWheel=true
         BoneOffset=(X=35.0,Y=-10.0,Z=2.0)
         SteerType=VST_Steered
         BoneName="Steer_Wheel_LF"
         BoneRollAxis=AXIS_Y
         WheelRadius=33.0
         bLeftTrack=true
     End Object
     Wheels(0)=LF_Steering
     Begin Object Class=SVehicleWheel Name=RF_Steering
         bPoweredWheel=true
        BoneOffset=(X=35.0,Y=10.0,Z=2.0)
         SteerType=VST_Steered
         BoneName="Steer_Wheel_RF"
         BoneRollAxis=AXIS_Y
         WheelRadius=33.0
     End Object
     Wheels(1)=RF_Steering
     Begin Object Class=SVehicleWheel Name=LR_Steering
         bPoweredWheel=true
         BoneOffset=(X=-12.0,Y=-10.0,Z=2.0)
         SteerType=VST_Inverted
         BoneName="Steer_Wheel_LR"
         BoneRollAxis=AXIS_Y
         WheelRadius=33.0
         bLeftTrack=true
     End Object
     Wheels(2)=LR_Steering
     Begin Object Class=SVehicleWheel Name=RR_Steering
         bPoweredWheel=true
         BoneOffset=(X=-12.0,Y=10.0,Z=2.0)
         SteerType=VST_Inverted
         BoneName="Steer_Wheel_RR"
         BoneRollAxis=AXIS_Y
         WheelRadius=33.0
     End Object
     Wheels(3)=RR_Steering
     Begin Object Class=SVehicleWheel Name=Left_Drive_Wheel
         bPoweredWheel=true
         BoneOffset=(X=0.0,Y=10.0,Z=2.0)
         BoneName="Drive_Wheel_L"
         BoneRollAxis=AXIS_Y
         WheelRadius=33.0
         bLeftTrack=true
     End Object
     Wheels(4)=Left_Drive_Wheel
     Begin Object Class=SVehicleWheel Name=Right_Drive_Wheel
         bPoweredWheel=true
         BoneOffset=(X=0.0,Y=-10.0,Z=2.0)
         BoneName="Drive_Wheel_R"
         BoneRollAxis=AXIS_Y
         WheelRadius=33.0
     End Object
     Wheels(5)=Right_Drive_Wheel    
}
