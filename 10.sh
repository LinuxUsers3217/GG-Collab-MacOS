sudo apt update
sudo apt install apache2
sudo apt install ufw
sudo ufw allow 'VNC'
sudo ufw status
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
rm -rf ngrok-stable-linux-amd64.zip
./ngrok authtoken 268tKkixRMBBxHKeBCpS6s72ohm_7UvxkT4VkysGcyKi2JpZN
nohup ./ngrok tcp --region ap 5900 &>/dev/null &
sudo apt-get update -y
sudo apt-get install -y qemu-system-x86-64
wget -O RTL8139F.iso 'https://drive.google.com/uc?export=download&id=1wDL8vo9mmYKw1HKXZzaYHoKmzSt_wXai'
wget -O Tiny10.qcow2 'https://archive.org/download/tiny-10_202205/Tiny10.qcow2'
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 4G \
  -boot order=c \
  -drive file=Tiny10.qcow2 \
  -drive file=RTL8139F.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -cpu n270 \
  -smp sockets=1,cores=4,threads=2 \
  -vga std \
  -device e1000,netdev=n0 -netdev user,id=n0 \
  -accel tcg,thread=multi \
