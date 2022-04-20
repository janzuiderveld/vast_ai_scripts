#!/bin/bash
cd /workspace/vast_ai/midialogue
git clone https://github.com/chrisdonahue/LakhNES

python3 - << EOF
import os
os.makedirs("/root/LakhNES/model/pretrained/LakhNES", exist_ok=True)
EOF

wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1ND27trP3pTAl6eAk5QiYE9JjLOivqGsd' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1ND27trP3pTAl6eAk5QiYE9JjLOivqGsd" -O /root/LakhNES/model/pretrained/model.tar.gz && rm -rf /tmp/cookies.txt
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1WO6guGagqaw22LH32_NEBeavtbaWy_ar' -O /root/LakhNES/data/nesmdb_tx1.tar.gz

cd /workspace/vast_ai/midialogue/LakhNES/model/pretrained
tar -xf model.tar.gz && rm model.tar.gz
cd /workspace/vast_ai/midialogue/LakhNES/data
tar -xf /workspace/vast_ai/midialogue/LakhNES/nesmdb_tx1.tar.gz
cd /workspace/vast_ai/midialogue

cp /workspace/vast_ai/midialogue/mem_transformer.py /workspace/vast_ai/midialogue/LakhNES/model/mem_transformer.py

touch /workspace/vast_ai/midialogue/LakhNES/model/utils/__init__.py
touch /workspace/vast_ai/midialogue/LakhNES/model/model/__init__.pyw
touch /workspace/vast_ai/midialogue/LakhNES/model/__init__.py

python3 startup.py