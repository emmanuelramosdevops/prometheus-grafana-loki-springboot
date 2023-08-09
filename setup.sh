#!/bin/bash

prometheus_config_dir="$HOME/.prometheus/config"
prometheus_data_dir="$HOME/.prometheus/data"
prometheus_config_file="prometheus.yml"

loki_config_dir="$HOME/.loki/config"
loki_config_file="loki.yml"

if [[ ! -d "$prometheus_config_dir" ]]; then
  echo "Criando diretorio [config] do Prometheus em $prometheus_config_dir."
  mkdir -p "$prometheus_config_dir"
else
  echo "Diretorio $prometheus_config_dir ja existe."
fi

if [[ ! -d "$prometheus_data_dir" ]]; then
  echo "Criando diretorio [data] do Prometheus em $prometheus_data_dir."
  mkdir -p "$prometheus_data_dir"
else
  echo "Diretorio $prometheus_data_dir ja existe."
fi

if [[ ! -d "$loki_config_dir" ]]; then
  echo "Criando diretorio [config] do Loki em $loki_config_dir."
  mkdir -p "$loki_config_dir"
else
  echo "Diretorio $loki_config_dir ja existe."
fi

if [[ ! -f "$loki_config_dir/$loki_config_file"  ]]; then
  cp "./$loki_config_file" "$loki_config_dir"
  echo "Arquivo de config do Loki copiado para $loki_config_dir."
else
  echo "Arquivo de config do Loki ja existe."
fi

if [[ ! -f "$prometheus_config_dir/$prometheus_config_file" ]]; then
  cp "./$prometheus_config_file" "$prometheus_config_dir"
  echo "Arquivo de config do Prometheus copiado para $prometheus_config_dir."
else
  echo "Arquivo de config do Prometheus ja existe."
fi
