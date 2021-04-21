function _ng {
  local use_ng
  local local_ng='node_modules/@angular/cli/bin/ng'
  if [[ -d "${local_ng}" ]]; then
    use_ng="${local_ng}"
  else
    use_ng="$(which ng)"
  fi
  "${use_ng}" $@
}

