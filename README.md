# Expand AWS IAM Wildcards E2E

This repository is the disposable GitHub pull-request fixture for
[`thekbb/expand-aws-iam-wildcards`](https://github.com/thekbb/expand-aws-iam-wildcards).
It keeps temporary branches, pull requests, review comments, and write-scoped
workflow permissions outside the action's source repository.

## Run the Test

Before the first run, enable **Allow GitHub Actions to create and approve pull
requests** under **Settings → Actions → General → Workflow permissions**.

1. Copy the full commit SHA to test from the source repository's `main` branch.
1. Open the `End-to-End Test` workflow in this repository.
1. Run it from `main` and provide the SHA as `source_sha`.

The workflow rejects malformed SHAs and commits outside the source repository's
`main` history. It checks out and builds the exact accepted commit before it
creates a unique draft fixture pull request here.

The lifecycle test verifies comment creation, an unchanged rerun, in-place
updates, stale-comment deletion, and preservation of a thread with a real review
reply. It also follows a representative AWS documentation link and requires the
expected native action anchor. Its final step closes the fixture pull request
and deletes its branch, even when an earlier test phase fails.

## Security Boundary

The workflow grants `contents: write` and `pull-requests: write` only to its
fixture job in this repository. It reads the public source repository without
granting it write access. Third-party actions are pinned to full commit SHAs.

This repository should contain only the fixture workflow and its documentation.
Product source, lifecycle assertions, and release logic belong in the source
repository.
