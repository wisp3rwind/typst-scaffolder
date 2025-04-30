# Release checklist
- Update version in `typst.toml` and `README.md`, incrementing it according
  to [SemVer](https://semver.org/)
- Check & finalize changelog, commit
- push this commit, wait for CI to finish before going to the next step (FIXME: change the release workflow/environment rules such that this is not required)
- create a new tag and push it, this triggers the release workflow
- Create a PR against the typst packages repository
- in `typst.toml`, bump version to `vX.Y.{Z+1}-dev` and prepend a new section
  to the changelog:
  ```
  # [unreleased](https://github.com/wisp3rwind/typst-scaffolder/releases/tag/<tag>)

  ## Added

  ## Removed

  ## Changed

  ## Migration Guide from vX.Y.Z
  ```
  then commit both

# Git branches and commits
- Use commit prefixes: https://www.conventionalcommits.org/en/v1.0.0/
  (TODO: list the ones that should be used here with a short description)
- Deliberate rebasing is encouraged
- If possible, do not change existing tests such that existing reference
  outputs remain unmodified. Adding new output pages is ok.
- rebase/merge/squash strategy?
- what can happen directly on main?

# Testing
This project uses [`tytanic`](https://tingerrr.github.io/tytanic/index.html) to
run tests (currently just checking that output documents match a reference image
to prevent regressions).

To run tests, you'll need to obtain `tytanic` and then run
```
just test
```

When making changes that intentionally change the output, run
```
just update
```
to update the reference files.

To add a new test, either use `tytanic` via
```
tt add "my-test"
```
(see
[the documentation](https://tingerrr.github.io/tytanic/reference/tests/unit.html)
regarding the various kinds of tests that are supported).
If you have already created a `.typ` file for your test, and want to turn it
into a ref-test, simply create a directory called `ref` next to it before
running `just update`.
