@echo OFF
cd "%~dp0"
pushd ..\..
call usagi build
popd
ucc server DH-Target_Range.rom?game=DH_Engine.DarkestHourGame?MaxPlayers=64?Mutator=DH_AdminMenuMutator.DHAdminMenuMutator -log=DHServerLog_%RANDOM%.log -mod=DarkestHourDev -ini=DarkestHourDev.ini