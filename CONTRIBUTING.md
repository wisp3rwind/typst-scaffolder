# Release checklist

- Check & finalize changelog, commit
- create a new tag and push it, this triggers the release workflow
- Create a PR against the typst packages repository
- prepend a new section to the changelog and commit it:
  ```
  # [unreleased](https://github.com/wisp3rwind/typst-guide-lines/releases/tag/<tag>)

  ## Added

  ## Removed

  ## Changed

  ## Migration Guide from v0.1.x
  ```
