@echo off
chcp 65001 >nul
title ARX Store // discord.gg/fsYE5qPjym

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Please run this as Administrator!
    pause
    exit
)

setlocal enabledelayedexpansion
for /f %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"

set "KEY=evox"

:login
cls
echo(
echo  ___________    ____  ______    __       __    __  .___________. __    ______   .__   __. ___   ___ 
echo ^|   ____\   \  /   / /  __  \  ^|  ^|     ^|  ^|  ^|  ^| ^|           ^|^|  ^|  /  __  \  ^|  \ ^|  ^| \  \ /  / 
echo ^|  ^|__   \   \/   / ^|  ^|  ^|  ^| ^|  ^|     ^|  ^|  ^|  ^| `---^|  ^|----`^|  ^| ^|  ^|  ^|  ^| ^|   \^|  ^|  \  V  /  
echo ^|   __^|   \      /  ^|  ^|  ^|  ^| ^|  ^|     ^|  ^|  ^|  ^|     ^|  ^|     ^|  ^| ^|  ^|  ^|  ^| ^|  . `  ^|   ^>   ^<   
echo ^|  ^|____   \    /   ^|  `--'  ^| ^|  `----.^|  `--'  ^|     ^|  ^|     ^|  ^| ^|  `--'  ^| ^|  ^|\   ^|  /  .  \  
echo ^|_______^|   \__/     \______/  ^|_______^| \______/      ^|__^|     ^|__^|  \______/  ^|__^| \__^| /__/ \__\ 

echo(
set /p "userkey=License Key: "

if /i "%userkey%"=="%KEY%" (
    echo !ESC![32m[+] Login Complte !
    timeout /t 1 >nul
    cls
    goto menu
) else (
    echo !ESC![31m[-] Invalid Key !
    timeout /t 2 >nul
    goto login
)

:menu
cls
echo(
echo  ___________    ____  ______   ___   ___ .___  ___.  _______ .__   __.  __    __  
echo ^|   ____\   \  /   / /  __  \  \  \ /  / ^|   \/   ^| ^|   ____^|^|  \ ^|  ^| ^|  ^|  ^|  ^| 
echo ^|  ^|__   \   \/   / ^|  ^|  ^|  ^|  \  V  /  ^|  \  /  ^| ^|  ^|__   ^|   \^|  ^| ^|  ^|  ^|  ^| 
echo ^|   __^|   \      /  ^|  ^|  ^|  ^|   ^>   ^<   ^|  ^|\/^|  ^| ^|   __^|  ^|  . `  ^| ^|  ^|  ^|  ^| 
echo ^|  ^|____   \    /   ^|  `--'  ^|  /  .  \  ^|  ^|  ^|  ^| ^|  ^|____ ^|  ^|\   ^| ^|  `--'  ^| 
echo ^|_______^|   \__/     \______/  /__/ \__\ ^|__^|  ^|__^| ^|_______^|^|__^| \__^|  \______/  
echo(
echo !ESC![33m [1]!ESC![0m Start EvolutionX ( ARX )
echo !ESC![33m [2]!ESC![0m Run Winutill ( CTT )
echo !ESC![33m [3]!ESC![0m Start Mouse KeyboardXARX
echo !ESC![33m [4]!ESC![0m ExitX
echo(
set /p choice=Select Option: 

if "%choice%"=="1" goto evox
if "%choice%"=="2" goto ctt
if "%choice%"=="3" goto mk
if "%choice%"=="4" exit
goto menu

:evox
cls

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 16396842 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "Scheduling Category" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "SFIO Priority" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "Clock Rate" /t REG_SZ /d 2710 /f >nul
echo     OK

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDelay /t REG_DWORD /d 20 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDdiDelay /t REG_DWORD /d 20 /f >nul
echo     OK

echo [8/9] Reset useplatformclock
bcdedit /deletevalue useplatformclock >nul 2>&1
echo     OK

echo [9/9] Applying TCP/UDP FiveM tweaks...
netsh interface ipv4 set subinterface "Ethernet" mtu=3000 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mss=1460 store=persistent
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global initialrto=3000

netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=cubic

netsh int tcp set global timestamps=disabled
netsh int tcp set global ecncapability=disabled

netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global chimney=disabled

netsh int tcp set global pacingprofile=off


Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MTU" /t REG_DWORD /d "4190" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MSS" /t REG_DWORD /d "4150"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "2576980377"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "174" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "343932926" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "UDPAckFrequency" /t REG_DWORD /d "2576980377"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "UDPNoDelay" /t REG_DWORD /d "2576980377"  /f



set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v TcpDelAckTicks /t REG_DWORD /d 174 /f
reg add "%KEY%" /v TCPNoDelay /t REG_DWORD /d 343932926 /f
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 4130 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 4170 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f


echo [1/4] Setting Multimedia SystemProfile (Network throttling / responsiveness)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

echo [2/4] Setting QoS Policy (NonBestEffortLimit)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" ^
 /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul

echo [3/4] Setting AFD Parameters (UDP handling)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "FastSendDatagramThreshold" /t REG_DWORD /d 1100 /f >nul

:: 256KB = 262144
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultReceiveWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultSendWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "EnableDynamicBacklog" /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MinimumDynamicBacklog" /t REG_DWORD /d 48 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MaximumDynamicBacklog" /t REG_DWORD /d 1024 /f >nul


echo [4/4] Setting TCP/IP Parameters (safe)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "UdpMaxConnections" /t REG_DWORD /d 65534 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "EnableUDPChecksum" /t REG_DWORD /d 1 /f >nul

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 16396842 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul
echo     OK
echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 16396842 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul
echo     OK
set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 1060 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f
set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 1060 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f
set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 4130 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 4170 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f

echo [1/4] Setting Multimedia SystemProfile (Network throttling / responsiveness)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

echo [2/4] Setting QoS Policy (NonBestEffortLimit)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" ^
 /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul

echo [3/4] Setting AFD Parameters (UDP handling)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "FastSendDatagramThreshold" /t REG_DWORD /d 911 /f >nul

:: 256KB = 262144
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultReceiveWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultSendWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "EnableDynamicBacklog" /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MinimumDynamicBacklog" /t REG_DWORD /d 48 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MaximumDynamicBacklog" /t REG_DWORD /d 1024 /f >nul


echo [4/4] Setting TCP/IP Parameters (safe)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "UdpMaxConnections" /t REG_DWORD /d 65534 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "EnableUDPChecksum" /t REG_DWORD /d 1 /f >nul

:: 1) Multimedia SystemProfile
:: ----------------------------
echo [1/4] Setting Multimedia SystemProfile (Network throttling / responsiveness)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

echo [2/4] Setting QoS Policy (NonBestEffortLimit)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" ^
 /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul

echo [3/4] Setting AFD Parameters (UDP handling)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "FastSendDatagramThreshold" /t REG_DWORD /d 911 /f >nul

:: 256KB = 262144
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultReceiveWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultSendWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "EnableDynamicBacklog" /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MinimumDynamicBacklog" /t REG_DWORD /d 48 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MaximumDynamicBacklog" /t REG_DWORD /d 1024 /f >nul


echo [4/4] Setting TCP/IP Parameters (safe)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "UdpMaxConnections" /t REG_DWORD /d 65534 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "EnableUDPChecksum" /t REG_DWORD /d 1 /f >nul

echo [1/4] Setting Multimedia SystemProfile (Network throttling / responsiveness)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

:: ----------------------------
:: 2) QoS Policy (Psched)
:: ----------------------------
echo [2/4] Setting QoS Policy (NonBestEffortLimit)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" ^
 /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul

echo [3/4] Setting AFD Parameters (UDP handling)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "FastSendDatagramThreshold" /t REG_DWORD /d 911 /f >nul

:: 256KB = 262144
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultReceiveWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultSendWindow" /t REG_DWORD /d 327683 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "EnableDynamicBacklog" /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MinimumDynamicBacklog" /t REG_DWORD /d 48 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MaximumDynamicBacklog" /t REG_DWORD /d 1024 /f >nul


echo [4/4] Setting TCP/IP Parameters (safe)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "UdpMaxConnections" /t REG_DWORD /d 65534 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "EnableUDPChecksum" /t REG_DWORD /d 1 /f >nul

reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 1060 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f
set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 3540 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 3590 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f
set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v UDPNoDelay /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v UDPAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 2576980377 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v FastSendDatagramThreshold /t REG_DWORD /d 1100 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 4150 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 4190 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f
echo     OK
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseSensitivity /t REG_SZ /d 10 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverHeight /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverWidth /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseTrails /t REG_SZ /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v MaxFrameLatency /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v ConvertibleSlateMode /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 4211081216 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f >nul
echo     OK

echo 
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f >nul
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f >nul
echo     OK

echo 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "Scheduling Category" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "GPU Priority" /t REG_DWORD /d 8 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "SFIO Priority" /t REG_SZ /d High /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
 /v "Clock Rate" /t REG_SZ /d 2710 /f >nul
echo     OK

echo 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDelay /t REG_DWORD /d 20 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v TdrDdiDelay /t REG_DWORD /d 20 /f >nul
echo     OK

echo [8/9] Reset useplatformclock (safe)...
bcdedit /deletevalue useplatformclock >nul 2>&1
echo     OK

:: ============================================================
:: 9) Network (ทดลอง: TCP experimental + UDP packet handling)
:: ============================================================ 
echo [9/9] Applying TCP/UDP FiveM tweaks...
netsh interface ipv4 set subinterface "Ethernet" mtu=1400 store=persistent
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global initialrto=3000

:: Core behavior
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=cubic

:: Latency hygiene
netsh int tcp set global timestamps=disabled
netsh int tcp set global ecncapability=disabled

:: CPU / buffering
netsh int tcp set global rss=enabled
netsh int tcp set global rsc=disabled
netsh int tcp set global chimney=disabled

:: Queue stability
netsh int tcp set global pacingprofile=off


Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MTU" /t REG_DWORD /d "1400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MSS" /t REG_DWORD /d "1360"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpAckFrequency" /t REG_DWORD /d "343932926"  /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "TCPNoDelay" /t REG_DWORD /d "343932926" /f




set KEY=HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters
reg add "%KEY%" /v TcpDelAckTicks /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TCPNoDelay /t REG_DWORD /d 343932926 /f
reg add "%KEY%" /v TcpAckFrequency /t REG_DWORD /d 343932926 /f
reg add "%KEY%" /v DeadGWDetectDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DefaultTTL /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableIPSourceRouting /t REG_DWORD /d 8 /f
reg add "%KEY%" /v DisableLargeMtu /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableMediaSenseEventLog /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableRSS /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DisableTaskOffload /t REG_DWORD /d 1 /f
reg add "%KEY%" /v DisableTcpChimneyOffload /t REG_DWORD /d 0 /f
reg add "%KEY%" /v DontAddDefaultGatewayDefault /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableConnectionRateLimiting /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableDCA /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableICMPRedirect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUBHDetect /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnablePMTUDiscovery /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableRSS /t REG_DWORD /d 1 /f
reg add "%KEY%" /v EnableTCPA /t REG_DWORD /d 0 /f
reg add "%KEY%" /v EnableWsd /t REG_DWORD /d 0 /f
reg add "%KEY%" /v ForwardBroadcasts /t REG_DWORD /d 0 /f
reg add "%KEY%" /v GlobalMaxTcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPAutoconfigurationEnabled /t REG_DWORD /d 0 /f
reg add "%KEY%" /v IPEnableRouter /t REG_DWORD /d 0 /f
reg add "%KEY%" /v MaxConnectionsPer1_0Server /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxConnectionsPerServer /t REG_DWORD /d 16 /f
reg add "%KEY%" /v MaxFreeTcbs /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v MaxHashTableSize /t REG_DWORD /d 65536 /f
reg add "%KEY%" /v MaxUserPort /t REG_DWORD /d 65534 /f
reg add "%KEY%" /v MSS /t REG_DWORD /d 1360 /f
reg add "%KEY%" /v MTU /t REG_DWORD /d 1400 /f
reg add "%KEY%" /v NumTcbTablePartitions /t REG_DWORD /d 0 /f
reg add "%KEY%" /v SackOpts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SizeReqBuf /t REG_DWORD /d 53819 /f
reg add "%KEY%" /v StrictTimeWaitSeqCheck /t REG_DWORD /d 1 /f
reg add "%KEY%" /v SynAttackProtect /t REG_DWORD /d 1 /f
reg add "%KEY%" /v Tcp1323Opts /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TCPCongestionControl /t REG_DWORD /d 1 /f
reg add "%KEY%" /v TcpCreateAndConnectTcbRateLimitDepth /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpFinWait2Delay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TCPInitialRtt /t REG_DWORD /d 49697 /f
reg add "%KEY%" /v TcpInitialRTT /t REG_DWORD /d 0 /f
reg add "%KEY%" /v TcpMaxDataRetransmissions /t REG_DWORD /d 3 /f
reg add "%KEY%" /v TcpMaxDupAcks /t REG_DWORD /d 2 /f
reg add "%KEY%" /v TcpMaxSendFree /t REG_DWORD /d 65535 /f
reg add "%KEY%" /v TcpNumConnections /t REG_DWORD /d 2097152 /f
reg add "%KEY%" /v TcpTimedWaitDelay /t REG_DWORD /d 30 /f
reg add "%KEY%" /v TcpWindowSize /t REG_DWORD /d 0 /f
reg add "%KEY%" /v UseDomainNameDevolution /t REG_DWORD /d 0 /f


:: 1) Multimedia SystemProfile
:: ----------------------------
echo [1/4] Setting Multimedia SystemProfile (Network throttling / responsiveness)...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
 /v "SystemResponsiveness" /t REG_DWORD /d 0 /f >nul

:: ----------------------------
:: 2) QoS Policy (Psched)
:: ----------------------------
echo [2/4] Setting QoS Policy (NonBestEffortLimit)...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" ^
 /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f >nul

echo [3/4] Setting AFD Parameters (UDP handling)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "FastSendDatagramThreshold" /t REG_DWORD /d 819 /f >nul

:: 256KB = 262144
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultReceiveWindow" /t REG_DWORD /d 7040032 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "DefaultSendWindow" /t REG_DWORD /d 7040032 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "EnableDynamicBacklog" /t REG_DWORD /d 1 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MinimumDynamicBacklog" /t REG_DWORD /d 150 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\AFD\Parameters" ^
 /v "MaximumDynamicBacklog" /t REG_DWORD /d 2184 /f >nul


echo [4/4] Setting TCP/IP Parameters (safe)...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "DefaultTTL" /t REG_DWORD /d 64 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "TcpTimedWaitDelay" /t REG_DWORD /d 10 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "UdpMaxConnections" /t REG_DWORD /d 65534 /f >nul

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" ^
 /v "EnableUDPChecksum" /t REG_DWORD /d 1 /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MTU" /t REG_DWORD /d "1400" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces" /v "MSS" /t REG_DWORD /d "1460 "  /f

netsh interface ipv4 set subinterface "Ethernet" mtu=1400 store=persistent
netsh int tcp set global autotuninglevel=normal >nul
netsh int tcp set global initialrto=1400

:: HAGS = 2 (Driver Controlled)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" ^
 /v "HwSchMode" /t REG_DWORD /d 2 /f

:: GPU Frame Queue (GraphicsDrivers)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" ^
 /v "MaxFrameLatency" /t REG_DWORD /d 1 /f

:: DirectX Frame Queue (some setups read this too)
reg add "HKLM\SOFTWARE\Microsoft\DirectX" ^
 /v "MaxFrameLatency" /t REG_DWORD /d 1 /f

reg add "HKCU\Software\Microsoft\Windows\DWM" ^
 /v "MaxQueuedFrames" /t REG_DWORD /d 1 /f

gpupdate /force

cls
goto menu

:ctt
cls

powershell -Command "irm christitus.com/win | iex"

cls
goto menu

:mk
cls

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v EnablePreemption /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v PlatformSupportMiracast /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v DpiMapIommuContiguous /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v EnablePreemption /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v VsyncIdleTimeout /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Scheduler" /v MaxGpuPreemptionTimeout /t REG_DWORD /d 100 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f

reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v MaxTextureDimension /t REG_DWORD /d 16384 /f
reg add "HKLM\SOFTWARE\Microsoft\DirectX" /v D3D12_ALLOW_TEARING /t REG_DWORD /d 1 /f

reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v ShaderCacheMaxSize /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v D3D11_MULTITHREADED /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t REG_DWORD /d 256 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisable8dot3NameCreation /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v NtfsDisableLastAccessUpdate /t REG_DWORD /d 2147483649 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpAckFrequency /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TCPNoDelay /t REG_DWORD /d 1 /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f

reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f

reg add "HKCU\Software\Microsoft\GameBar" /v GamePanelStartupNotificationOff /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f

reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f

reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisableThumbnailCache /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f

reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global" /v SendTelemetryData /t REG_DWORD /d 0 /f

cls
goto menu