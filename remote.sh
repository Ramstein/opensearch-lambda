

qwinsta /server:"192.168.1.84" or query session /server:"192.168.1.84"


wmic.exe /node:"192.168.1.84" ComputerSystem Get UserName


for /f "TOKENS=1,2,*" %%a in ('tasklist /s %PCNAME% /FI "IMAGENAME eq explorer.exe" /FO LIST /V') do if /i "%%a %%b"=="User Name:" (set domain_user=%%c)    
for /f "TOKENS=1,2 DELIMS=\" %%a in ("%domain_user%") do set domain=%%a && set user=%%b

nbtstat –a "192.168.1.84"

net view /domain:ad > somefile.

xfreerdp --ignore-certificate --authonly -u '{username}' -p '{password}' '{ip_address}' 

xfreerdp --ignore-certificate --authonly -u 'Ismail' -p 'tyler' '192.168.1.98'

script -c "xfreerdp --ignore-certificate --authonly -u 'Ismail' -p 'tyler' '192.168.1.98'" test.txt