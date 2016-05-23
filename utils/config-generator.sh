#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
set -o errtrace

function base64encode {
	echo -n "$1" | base64
}

function generate_configs {
	echo "generate_configs started"

	if [ -f "secrets-${region}.sh" ]; then
		source "secrets-${region}.sh"
	else
		echo "WARNING: secrets-${region}.sh not found. using default secrets"
	fi

	aptly_auth_password=${aptly_auth_password:=S3CR3T}
	auth_application_password=${auth_application_password:=S3CR3T}
	auth_admin_token=${auth_admin_token:=S3CR3T}
	facebook_secret_sm=${facebook_secret_sm:=S3CR3T}
	facebook_token_sm=${facebook_token_sm:=S3CR3T}
	facebook_secret_hq=${facebook_secret_hq:=S3CR3T}
	facebook_token_hq=${facebook_token_hq:=S3CR3T}
	haproxy_stats_password=${haproxy_stats_password:=S3CR3T}
	highrise_auth_password=${highrise_auth_password:=S3CR3T}
	storage_auth_password=${storage_auth_password:=S3CR3T}
	taiga_database_password=${taiga_database_password:=S3CR3T}
	telegram_token=${telegram_token:=S3CR3T}
	telegram_token_hq=${telegram_token_hq:=S3CR3T}
	weather_api_key=${weather_api_key:=S3CR3T}

	sed_script=""
	sed_script_base64=""
	for var in aptly_auth_password auth_application_password auth_admin_token facebook_secret_sm facebook_token_sm facebook_secret_hq facebook_token_hq haproxy_stats_password highrise_auth_password storage_auth_password taiga_database_password telegram_token telegram_token_hq weather_api_key region nfs_server dns_server k8s_node_domain taiga_public_hostname; do
		base64=$(base64encode "${!var}")
		sed_script+="s,{{$var}},${!var},g;"
		sed_script_base64+="s,{{${var}_base64}},${base64},g;"
	done

	cd template
	find . -type d -exec mkdir -p "../sm/{}" \;
	for i in `find . -type f -name "*.yaml"`; do
	    echo "render ${i}"
			cat ${i} | sed -e "$sed_script" | sed -e "$sed_script_base64" > ../sm/${i}
	done

	echo "generate_configs finished"
}

function render {
  eval "echo \"$(cat $1)\""
}

function remove_configs {
	echo "remove_configs started"
	rm -rf $region
	echo "remove_configs finished"
}
