#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! type "gsed" > /dev/null; then
        # gsed does not exist; use default macOS sed; note: will append newline to modified fieles
        sed -I "" 's/^.*theme.*$/  "theme": "system",/' ./*/.obsidian/appearance.json
    else
        # use gsed
        gsed --in-place -e 's/^.*theme.*$/  "theme": "system",/' ./*/.obsidian/appearance.json
    fi
else
    # default to GNU sed
    sed --in-place -e 's/^.*theme.*$/  "theme": "system",/' ./*/.obsidian/appearance.json
fi
