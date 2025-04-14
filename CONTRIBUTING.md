# Release checklist
- Update version in `typst.toml` and `README.md`
- Check & finalize changelog, commit
- create a new tag and push it, this triggers the release workflow
- Create a PR against the typst packages repository
- prepend a new section to the changelog and commit it:
  ```
  # [unreleased](https://github.com/wisp3rwind/typst-scaffolder/releases/tag/<tag>)

  ## Added

  ## Removed

  ## Changed

  ## Migration Guide from vX.Y.Z
  ```

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
