#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

################################################################################

region="sm"
nfs_server="172.16.11.9"
dns_server="172.16.11.1"
k8s_node_domain="tools.seibert-media.net"
taiga_public_hostname="tools.seibert-media.net"

################################################################################

source "utils/config-generator.sh"

remove_configs
generate_configs
