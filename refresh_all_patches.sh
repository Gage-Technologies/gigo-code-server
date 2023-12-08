#!/bin/bash

# List all patches and loop through them
for patch in $(quilt series); do
    echo "Applying and refreshing patch: $patch"

    # Apply the patch
    quilt push "$patch"

    # Check if the patch is applied successfully
    if quilt applied | grep -q "$patch"; then
        # Refresh the patch
        quilt refresh

        # Pop the patch
        quilt pop
    else
        echo "Failed to apply the patch: $patch"
    fi
done

echo "All patches have been refreshed."