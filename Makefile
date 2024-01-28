.PHONY: get
get:
	@flutter pub get

.PHONY: build
build:
	@flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: watch
watch:
	@flutter pub run build_runner watch

.PHONY: bundle-dev
bundle-dev:
	@flutter build appbundle -t lib/main_dev.dart  --flavor=dev

.PHONY: bundle-prod
bundle-prod:
	@flutter build appbundle -t lib/main.dart  --flavor=prod

.PHONY: bundle-stg
bundle-stg:
	@flutter build appbundle -t lib/main_stg.dart  --flavor=stg

.PHONY: apk-dev
apk-dev:
	@flutter build apk --debug --flavor development --target lib/main_dev.dart

.PHONY: apk-stg
apk-stg:
	@flutter build apk --profile --flavor staging --target lib/main_stg.dart

.PHONY: apk-prod
apk-prod:
	@flutter build apk --release --flavor production --target lib/main.dart

.PHONY: ipa-dev
ipa-dev:
	@flutter build ipa --debug --flavor development --target lib/main_dev.dart

.PHONY: ipa-stg
ipa-stg:
	@flutter build ipa --profile --flavor staging --target lib/main_stg.dart

.PHONY: ipa-prod
ipa-prod:
	@flutter build ipa --release --flavor production --target lib/main.dart

.PHONY: test
test:
	@flutter test --coverage

.PHONY: coverage-report
coverage-report:
	genhtml coverage/lcov.info -o coverage/html
	@open coverage/html/index.html

.PHONY: fix
fix:
	@dart fix --apply

.PHONY: check-fix
check-fix:
	@dart fix --dry-run