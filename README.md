# rust-workflows
Example usage:
```
name: Build Release Tag

on:
  workflow_dispatch:
    inputs:
      releaseTagType:
        type: choice
        options: [patch, minor, major, alpha, beta, rc]
        description: 'Select tag increment level'
        required: true


jobs:
  call-build-release-tag-repo:
    uses: zack53/rust-workflows/.github/workflows/build-tag.yml@028603077a309657eb20ff18a183bd9847ddab87
    with:
      releaseTagType: ${{ github.event.inputs.releaseTagType }}
    secrets:
      PAT: ${{ secrets.PAT }}
```