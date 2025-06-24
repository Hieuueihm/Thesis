#!/bin/bash

PROJECT_ROOT=$(pwd)

# Ghi vào env.sh
cat << EOF > env.sh
#!/bin/bash
export PROJECT_ROOT="$PROJECT_ROOT"
echo "[✓] PROJECT_ROOT set to: \$PROJECT_ROOT"
EOF

