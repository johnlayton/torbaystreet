#####################################################################
# Init
#####################################################################

function jqx () {
  [[ $# -gt 0 ]] || {
    _sumo::help
    return 1
  }

  local command="$1"
  shift

  (( $+functions[_jqx::$command] )) || {
    _jqx::help
    return 1
  }

  _jqx::$command "$@"
}

function _jqx {
  local -a cmds subcmds
  cmds=(
    'help:Usage information'
  )

  if (( CURRENT == 2 )); then
    _describe 'command' cmds
  elif (( CURRENT == 3 )); then
    case "$words[2]" in
#      fields) subcmds=(
#        'last:Create a query for last [x] mins'
#        )
#        _describe 'command' subcmds ;;
    esac
  fi

  return 0
}

compdef _jqx jqx

function _jqx::help {
  cat <<EOF
Usage: jqx <command> [options]

Available commands:

    stream
    fields            [field]*

Examples:

    Turn stdin array into json objects;
      echo '[{"foo":"bar"},{"foo":"baz"}]' | jqx stream
EOF
}

function _jqx::stream () {
  jq -cn --stream 'fromstream(1|truncate_stream(inputs))'
}

function _jqx::fields () {
  local QUERY=""
  for FIELD in "${@}"; do
    QUERY="$QUERY \"${FIELD}\"  : .${FIELD},"
  done
  jq -r "{ ${QUERY} }"
}
