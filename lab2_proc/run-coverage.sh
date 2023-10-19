#!/bin/bash

# Need to input the DESIGN argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 DESIGN"
    exit 1
fi

DESIGN=$1

# Export VCD waveform and no optimization
export VCD=1
export NOPT=1

# Iterate over all ".asm" files in the "asm" folder
for file in asm/*.asm; do
    base_name=$(basename "$file" .asm)
    make "$base_name.hex.sim" DESIGN="$DESIGN" RUN_ARG=--trace COVERAGE=coverage
done

# Make coverage report
make coverage-report
