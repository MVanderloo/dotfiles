function ollama-start
    if pgrep -f ollama >/dev/null
        echo "ollama already running"
        return 1
    end

    set OLLAMA_STATE "$XDG_STATE_HOME/ollama"
    OLLAMA_FLASH_ATTENTION=1 OLLAMA_KV_CACHE_TYPE=q8_0 ollama serve >>"$OLLAMA_STATE/ollama.log" 2>>"$OLLAMA_STATE/ollama.err" &
    disown
end

function ollama-stop
    pkill -f ollama
end

function ollama-restart
    ollama-stop
    sleep 1
    ollama-start
end
