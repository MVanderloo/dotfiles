function ollama-update-models
    for model in (ollama list | tail -n +2 | cut -d ' ' -f 1)
        echo "Updating $model"
        ollama pull $model
    end
end
