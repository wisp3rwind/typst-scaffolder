root := justfile_directory()

export TYPST_ROOT := root


[private]
default:
	@just --list --unsorted

# run reference tests
test *args:
	typst-test run {{ args }}

# update reference tests
update *args:
	typst-test update {{ args }}

# compile examples for README to svg
examples:
	for f in "{{ root }}/docs"/*.typ; do rm -f "${f/.typ/}"-*.svg; typst compile "$f" "${f/.typ/-p\{0p\}.svg}"; done

# install the package into the specified target folder (which may be @local)
install target="@local":
  ./scripts/install "{{target}}"
