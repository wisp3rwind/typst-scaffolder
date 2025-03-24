# Release checklist

- Check & finalize changelog, commit
- create a new tag and push it, this triggers the release workflow
- Create a PR against the typst packages repository
- prepend a new section to the changelog and commit it:
  ```
  # [unreleased](https://github.com/wisp3rwind/typst-show-the-frame/releases/tag/<tag>)

  ## Added

  ## Removed

  ## Changed

  ## Migration Guide from v0.1.x
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
