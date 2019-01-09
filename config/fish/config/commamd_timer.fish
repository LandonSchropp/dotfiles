function pluralize
  printf "%d %s" $argv[2] $argv[1]

  if test $argv[2] -ge 0
    printf "s"
  end
end


function command_timer --on-event fish_postexec
  set -l duration $CMD_DURATION

  if test $duration -lt 10000
    return
  end

  set -l hours (pluralize hour (math --scale 0 "$duration / 1000 / 60 / 60"))
  set -l minutes (pluralize minute (math --scale 0 "$duration / 1000 / 60 % 60"))
  set -l seconds (pluralize second (math --scale 0 "$duration / 1000 % 60"))

  set_color blue

  printf "🕐  %s, %s, %s" $hours $minutes $seconds
end
