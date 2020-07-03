# ngrok commands
# full docs in this url https://ngrok.com/docs

# 1. expose your local domain
# http -host-header=rewrite YOUR-LOCAL-DOMAIN:PORT
# 2. expose ssh 
# tcp 22
# 3. expose localhost
# http 80
NGROK_CMD="http 80"

# download ngrok from this url if executable
# ngrok file not found in current dir
ZIPPED_NGROK_URL="https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip"

# extract ngrok filename from url
ZIPPED_NGROK_FILENAME="${ZIPPED_NGROK_URL##*/}"

# 0 to to pring public url in terminal 
# 1 to log public url in log file silently
DEBUG="0"

# where to log the ngrok public url
LOG_FILE="log.ngrok"

# check if ngrok executable file exist,
# if not download it
if [ ! -f "ngrok" ]; then
  echo "Ngrok executable file not found"
  wget "${ZIPPED_NGROK_URL}" -q --show-progress
  unzip  "${ZIPPED_NGROK_FILENAME}"
  rm  "${ZIPPED_NGROK_FILENAME}"
fi

# find runing ngrok process and kill it to release  port 4040
NGROK_PID=$(lsof -ti:4040)

if [ ! -z  "$NGROK_PID" ]; then
  kill -9 "$NGROK_PID"
  #echo "Killed Running Proccess: ${NGROK_PID}"
fi

# run ngrok in the background and redirect output to the space  
./ngrok ${NGROK_CMD} > /dev/null 2>&1 &

# wait for ngrok to initiate the tunnel,
# you may need to how much time to sleep
# depending on your system speed
sleep 2

# get the public tunnel url from ngrok api
URL=$( curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"https:..([^"]*).*/\1/p')

if [ "${DEBUG}" -eq "0" ]; then
  echo "${URL}"
else
  echo "${URL}" > "${LOG_FILE}"
fi
