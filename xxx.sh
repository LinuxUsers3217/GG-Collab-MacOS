  echo "----------------"
  echo "Windows 10 8GB RAM"
  echo "Script by BinZ FAKE (BZOT9 Team)"
  echo "YT: youtube.com/@binzfake2500"
  echo "----------------"
echo "Updating Colab System...."
sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
echo "Download CD Rom (Tiny10.iso)"
qemu-img create -f raw Tiny10.img 100G
wget -O binz_disk_cd.iso 'https://www.dropbox.com/s/2h1r9z7tltkn4g6/binz_disk_cd.iso?dl=1'
wget -O Tiny10.iso 'https://dl.malwarewatch.org/windows/mods/Tiny%2010.iso'
echo "Use VNC Viewer to connect"
echo "VNC Address:"
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 4G \
  -cpu EPYC \
  -boot order=d \
  -drive file=Tiny10.iso,media=cdrom \
  -drive file=Tiny10.img,format=raw \
  -drive file=binz_disk_cd.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu core2duo \
  -smp cores=2 \
  -device rtl8139,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \
