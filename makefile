project:
	sh ./setup.sh
	
build:
	dart run build_runner build --delete-conflicting-outputs

watch:
	dart run build_runner watch

apk-development:
	flutter build apk --debug --flavor development -t lib/main.dart

apk-production:
	flutter build apk --flavor production -t lib/main.dart

env:
	rm .dart_tool/build/generated/flutter_template/lib/core/configs/env.envied.g.part
	dart run build_runner build --delete-conflicting-outputs

.PHONY: build