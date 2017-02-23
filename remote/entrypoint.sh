#!/bin/sh
# XXX /etc/openpvn is a volume so it gets wiped on container startup :(
export OPENVPN=/etc/openvpn.temp
export EASYRSA_PKI=$OPENVPN/pki
export EASYRSA_VARS_FILE=$OPENVPN/vars
easyrsa build-client-full THECLIENT nopass
ovpn_getclient THECLIENT > /client-config/vpn.conf
ovpn_run --proto tcp-server
