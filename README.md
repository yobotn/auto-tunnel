# Shell script to run Ngrok in the background and get the public url easily from terminal or from log file.


## Usage
```sh
$ sudo wget https://raw.githubusercontent.com/yobotn/auto-tunnel/master/autotunnel.sh
$ sudo chmod +x autotunnel.sh
$ sudo ./autotunnel.sh
```
## Documentation
| VARIABLE | COMMENT |
| ------ | ------ |
| **ZIPPED_NGROK_URL** | ngrok will be downloaded from this url if not found |
| **NGROK_CMD** | ngrok arguments |
| **DEBUG** | where to show/save the tunnel public url > "**0**">**Terminal** "**1**">**Log file** |
| **LOG_FILE** | if **DEBUG** is **1**, public url will saved in this file |

### For more Ngrok documentation please visit https://ngrok.com/docs
