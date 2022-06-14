types_py = ../subiquity/subiquity/common/types.py
types_dart = ../lib/src/types.dart

default generate:
	python3 generator.py $(types_py) $(types_dart)
	dart format $(types_dart)

check test:
	python3 -m unittest
