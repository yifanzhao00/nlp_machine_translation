#!/bin/bash

if [ "$1" = "train" ]; then
	CUDA_VISIBLE_DEVICES=0 python run.py train --train-src=./de_en_data/train.de --train-tgt=./de_en_data/train.en --dev-src=./de_en_data/dev.de --dev-tgt=./de_en_data/dev.en --vocab=vocab.json 
elif [ "$1" = "test" ]; then
        CUDA_VISIBLE_DEVICES=0 python run.py decode model.bin ./de_en_data/dev.de ./de_en_data/dev.en outputs/test_outputs.txt 
elif [ "$1" = "train_local" ]; then
	python run.py train --train-src=./de_en_data/train.de --train-tgt=./de_en_data/train.en --dev-src=./de_en_data/dev.de --dev-tgt=./de_en_data/dev.en --vocab=vocab.json
elif [ "$1" = "test_local" ]; then
    python run.py decode model.bin ./de_en_data/test.de ./de_en_data/test.en outputs/test_outputs.txt
elif [ "$1" = "vocab" ]; then
	python vocab.py --train-src=./de_en_data/train.de --train-tgt=./de_en_data/train.en vocab.json
else
	echo "Invalid Option Selected"
fi
