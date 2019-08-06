# Prints out the IP address for the current internal network connection.
function internal-ip {
  ifconfig \
    | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active' \
    | grep "inet " \
    | awk '{print $2}'
}

# Prints out the external IP address of the current internet connection.
function external-ip {
  curl -s checkip.dyndns.org | sed -e "s/.*Current IP Address: //" -e "s/<.*\$//"
}
